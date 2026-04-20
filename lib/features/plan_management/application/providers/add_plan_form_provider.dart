import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addPlanFormProvider =
    StateNotifierProvider.autoDispose<AddPlanFormNotifier, AddPlanFormState>(
      (ref) => AddPlanFormNotifier(),
    );

class AddPlanFormState {
  final String title;
  final String description;
  final TimeOfDay? selectedTime;

  const AddPlanFormState({
    this.title = '',
    this.description = '',
    this.selectedTime,
  });

  bool get canSave => title.trim().isNotEmpty && selectedTime != null;

  AddPlanFormState copyWith({
    String? title,
    String? description,
    TimeOfDay? selectedTime,
    bool clearTime = false,
  }) {
    return AddPlanFormState(
      title: title ?? this.title,
      description: description ?? this.description,
      selectedTime: clearTime ? null : selectedTime ?? this.selectedTime,
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
}
