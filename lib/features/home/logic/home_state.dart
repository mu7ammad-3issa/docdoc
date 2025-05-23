import 'package:flutter_complete_project/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/specializations_response_model.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;
  // Specializations
  const factory HomeState.specializationsLoading() = SpecializationsLoading;
  const factory HomeState.specializationsSuccess(
          List<SpecializationsData?>? specializationDataList) =
      SpecializationsSuccess;
  const factory HomeState.specializationsError(ApiErrorModel apiErrorModel) =
      SpecializationsError;

  // doctors
  const factory HomeState.doctorsSuccess(List<Doctors?>? doctorsList) =
      DoctorsSuccess;
  const factory HomeState.doctorsError() = DoctorsError;
}
