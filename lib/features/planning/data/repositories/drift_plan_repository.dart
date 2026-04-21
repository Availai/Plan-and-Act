import 'package:planandact/core/errors/failure.dart';
import 'package:planandact/core/logging/logger.dart';
import 'package:planandact/core/result/result.dart';
import 'package:planandact/features/planning/data/mappers/plan_mapper.dart';
import 'package:planandact/features/planning/domain/entities/plan_entity.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_status.dart';
import 'package:planandact/features/planning/domain/repositories/plan_repository.dart';
import 'package:planandact/shared/data/local/daos/plans_dao.dart';

/// Drift-backed implementation of [PlanRepository].
class DriftPlanRepository implements PlanRepository {
  DriftPlanRepository({
    required PlansDao plansDao,
    PlanMapper mapper = const PlanMapper(),
  })  : _dao = plansDao,
        _mapper = mapper;

  final PlansDao _dao;
  final PlanMapper _mapper;

  static const _tag = 'DriftPlanRepository';

  @override
  Future<Result<PlanEntity>> createPlan(PlanEntity plan) async {
    try {
      final companion = _mapper.toCompanion(plan);
      await _dao.insertPlan(companion);
      return Success(plan);
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to create plan', e, st);
      return Err(StorageFailure('Plan kaydedilemedi', e.toString()));
    }
  }

  @override
  Future<Result<PlanEntity>> updatePlan(PlanEntity plan) async {
    try {
      final companion = _mapper.toCompanion(plan);
      await _dao.updatePlan(companion);
      return Success(plan);
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to update plan', e, st);
      return Err(StorageFailure('Plan güncellenemedi', e.toString()));
    }
  }

  @override
  Future<Result<void>> deletePlan(String planId) async {
    try {
      await _dao.softDeletePlan(planId, DateTime.now());
      return const Success(null);
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to delete plan', e, st);
      return Err(StorageFailure('Plan silinemedi', e.toString()));
    }
  }

  @override
  Future<Result<PlanEntity>> getPlanById(String planId) async {
    try {
      final plans = await _dao.getAllPlans(''); // TODO: filter by id
      final match = plans.where((p) => p.id == planId).firstOrNull;
      if (match == null) {
        return const Err(NotFoundFailure('Plan bulunamadı'));
      }
      return Success(_mapper.toDomain(match));
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to get plan by id', e, st);
      return Err(StorageFailure('Plan okunamadı', e.toString()));
    }
  }

  @override
  Future<Result<List<PlanEntity>>> getPlansForDate(
      String userId, DateTime date) async {
    try {
      final rows = await _dao.getPlansForDate(userId, date);
      return Success(_mapper.toDomainList(rows));
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to get plans for date', e, st);
      return Err(StorageFailure('Planlar yüklenemedi', e.toString()));
    }
  }

  @override
  Future<Result<List<PlanEntity>>> getStuckPlans(String userId) async {
    try {
      final rows = await _dao.getStuckPlans(userId);
      return Success(_mapper.toDomainList(rows));
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to get stuck plans', e, st);
      return Err(StorageFailure('Stuck planlar yüklenemedi', e.toString()));
    }
  }

  @override
  Future<Result<List<PlanEntity>>> getPlansByStatus(PlanStatus status) async {
    try {
      // Use getAllPlans and filter for now as simple fallback since we don't have a specific dao method
      final rows = await _dao.getAllPlans(''); // User filter if needed later
      final match = rows.where((r) => r.status == status.name).toList();
      return Success(_mapper.toDomainList(match));
    } catch (e, st) {
      AppLogger.error(_tag, 'Failed to get plans by status', e, st);
      return Err(StorageFailure('Planlar durum ile yüklenemedi', e.toString()));
    }
  }

  @override
  Stream<List<PlanEntity>> watchPlansForDate(String userId, DateTime date) {
    return _dao
        .watchPlansForDate(userId, date)
        .map((rows) => _mapper.toDomainList(rows));
  }

  @override
  Future<int> countCompletedInRange(
      String userId, DateTime start, DateTime end) {
    return _dao.countCompletedInRange(userId, start, end);
  }
}
