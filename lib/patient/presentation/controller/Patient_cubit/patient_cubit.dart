import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/usecase/get_all_doctors_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_doctor_search_use_case.dart';
import 'package:health_care/patient/domain/usecase/get_top_doctors_use_case.dart';
import 'package:health_care/patient/presentation/screens/appointment/appointment_screen.dart';
import 'package:health_care/patient/presentation/screens/history/history_screen.dart';
import 'package:health_care/patient/presentation/screens/home/home_screen.dart';
import 'package:health_care/patient/presentation/screens/profile/profile_screen.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  GetTopDoctorsUseCase _getTopDoctorsUseCase = sl<GetTopDoctorsUseCase>();

  GetAllDoctorsUseCase _allDoctorsUseCase = sl<GetAllDoctorsUseCase>();
  GetDoctorSearchUseCase _getDoctorSearchUseCase = sl<GetDoctorSearchUseCase>();

  PatientCubit(this._getTopDoctorsUseCase, this._allDoctorsUseCase,
      this._getDoctorSearchUseCase)
      : super(PatientInitial());
  static PatientCubit get(context) => BlocProvider.of(context);

  List<String> titles = [
    'We Care',
    'My Appointments',
    'History',
    'profile',
  ];

  List<Widget> screens = [
    const HomePatientScreen(),
    const AppointmentPatientScreen(),
    const HistoryPatientScreen(),
    const ProfilePatientScreen(),
  ];

  int currentIndex = 0;
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

  /////////////all doctor////////////////
  List<User> allDoctor = [];
  getAllDoctor(String specialist) async {
    emit(GetAllDoctorLoadingState());
    allDoctor = [];
    (await _allDoctorsUseCase.call(specialist)).fold(
      (l) {
        emit(GetTopDoctorFailureState());
      },
      (r) {
        allDoctor = r.allDoctorsData!;
        emit(GetAllDoctorSuccessState());
      },
    );
  }

  ///////////top doctor//////////////////
  List<User> topDoctor = [];
  List<User> specialistTopDoctor = [];
  bool isAllTop = false;
  getTopDoctor({String? specialist}) async {
    emit(GetTopDoctorLoadingState());
    specialistTopDoctor = [];

    final useCase = specialist != null
        ? _getTopDoctorsUseCase.call(input: specialist)
        : _getTopDoctorsUseCase.call();

    (await useCase).fold(
      (l) {
        emit(GetTopDoctorFailureState());
      },
      (r) {
        if (specialist == null) {
          topDoctor = r.topDoctorsData!;
        } else if (specialist == "All") {
          isAllTop = false;
        } else {
          specialistTopDoctor = r.topDoctorsData!;
          isAllTop = true;
        }
        emit(GetTopDoctorSuccessState());
      },
    );
  }

  /////////////searched doctor////////////////
  List<User> searchedDoctor = [];
  bool isSearched = false;

  getSearchedDoctor({String? keyword, String? specialist}) async {
    emit(GetSearchedDoctorLoadingState());
    searchedDoctor = [];
    isSearched = true;
    final useCase = specialist != null
        ? _getDoctorSearchUseCase.call(
            TwoParametersUseCase(keyword!, specialist),
          )
        : _getDoctorSearchUseCase.call(TwoParametersUseCase(keyword!));
    (await useCase).fold(
      (l) {
        emit(GetSearchedDoctorFailureState());
      },
      (r) {
        searchedDoctor = r.doctorsSearchData!;

        emit(GetSearchedDoctorSuccessState());
      },
    );
  }
}