import 'package:doctors_speciality/core/networking/api_error_handler.dart';
import 'package:doctors_speciality/features/home/data/models/specializations_response_model.dart';
import 'package:doctors_speciality/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
// HomeCubit(this._homeRepo) : super(HomeState.initial());


  HomeCubit(this._homeRepo) : super(HomeState.initial())
  
  {
    getSpecialization();
  }


  List<SpecializationsData?>? specializationsList = [];

  void getSpecialization() async{
    emit(const HomeState.specializationsLoading());

  final response = await _homeRepo.getSpecialization();

  response.when(
      success: (specializationsResponseModel) {
        specializationsList =
            specializationsResponseModel.specializationDataList ?? [];

        // // getting the doctors list for the first specialization by default.
        // getDoctorsList(specializationId: specializationsList?.first?.id);

        emit(HomeState.specializationsSuccess(
            specializationsResponseModel.specializationDataList));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationsError(errorHandler));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList =
        getDoctorsListBySpecializationId(specializationId);

   if (doctorsList != null && doctorsList.isNotEmpty) {
  emit(HomeState.doctorsSuccess(doctorsList));
} else {
  emit(HomeState.doctorsError(ErrorHandler.handle('No doctors found')));
}
  }

  /// returns the list of doctors based on the specialization id
  getDoctorsListBySpecializationId(specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
