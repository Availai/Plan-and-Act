import 'package:flutter_test/flutter_test.dart';
import 'package:planandact/features/planning/domain/value_objects/plan_lane.dart';

void main() {
  test('maps category id to plan lane deterministically', () {
    expect(PlanLane.fromCategoryId('critical'), PlanLane.critical);
    expect(PlanLane.fromCategoryId('must_do'), PlanLane.mustDo);
    expect(PlanLane.fromCategoryId('challenging'), PlanLane.challenging);
    expect(PlanLane.fromCategoryId('chore_useful'), PlanLane.choreUseful);
    expect(PlanLane.fromCategoryId(null), PlanLane.mustDo);
  });
}
