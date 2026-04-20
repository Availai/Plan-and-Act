import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planandact/features/plan_management/domain/entities/plan.dart';

final addPlanFormProvider =
    StateNotifierProvider.autoDispose<AddPlanFormNotifier, AddPlanFormState>(
      (ref) => AddPlanFormNotifier(),
    );

class AddPlanFormState {
  final String title;
  final String description;
  final TimeOfDay? selectedTime;
  final PlanCategory category;

  const AddPlanFormState({
    this.title = '',
    this.description = '',
    this.selectedTime,
    this.category = PlanCategory.personal,
  });

  bool get canSave => title.trim().isNotEmpty && selectedTime != null;

  AddPlanFormState copyWith({
    String? title,
    String? description,
    TimeOfDay? selectedTime,
    PlanCategory? category,
    bool clearTime = false,
  }) {
    return AddPlanFormState(
      title: title ?? this.title,
      description: description ?? this.description,
      selectedTime: clearTime ? null : selectedTime ?? this.selectedTime,
      category: category ?? this.category,
    );
  }
}

class AddPlanFormNotifier extends StateNotifier<AddPlanFormState> {
  AddPlanFormNotifier() : super(const AddPlanFormState());

  void setTitle(String value) {
    state = state.copyWith(title: value);
  }

  void setDescription(String value) {
    state = state.copyWith(description: value);
  }

  void setTime(TimeOfDay value) {
    state = state.copyWith(selectedTime: value);
  }

  void setCategory(PlanCategory value) {
    state = state.copyWith(category: value);
  }
}
