import 'package:flutter/material.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/authentication/presentation/screens/doctor/doctor_register_screen.dart';
import 'package:health_care/authentication/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:health_care/authentication/presentation/screens/patient/patient_register_screen.dart';
import 'package:health_care/authentication/presentation/screens/splash/splash_screen.dart';
import 'package:health_care/authentication/presentation/screens/toggle/toggle_screen.dart';
import 'package:health_care/authentication/presentation/screens/user/user_email_confirmation_screen.dart';
import 'package:health_care/authentication/presentation/screens/user/user_forget_password_screen.dart';
import 'package:health_care/authentication/presentation/screens/user/user_login_screen.dart';
import 'package:health_care/authentication/presentation/screens/user/user_update_info_screen.dart';
import 'package:health_care/authentication/presentation/screens/user/user_update_password_screen.dart';
import 'package:health_care/core/global/resources/strings_manger.dart';
import 'package:health_care/doctor/presentation/screens/doctor_layout/doctor_layout_screen.dart';
import 'package:health_care/patient/domain/model/appointment_model.dart';
import 'package:health_care/patient/domain/model/rarte_model.dart';
import 'package:health_care/patient/presentation/screens/book_appointment/book_appointment_screen.dart';
import 'package:health_care/patient/presentation/screens/doctor_profile/doctor_profile_screen.dart';
import 'package:health_care/patient/presentation/screens/layout/layout_screen.dart';
import 'package:health_care/patient/presentation/screens/reviews/reviews_screen.dart';
import 'package:health_care/patient/presentation/screens/search/search_screen.dart';
import 'package:health_care/patient/presentation/screens/specialist_doctor/specialist_doctor.dart';
import 'package:health_care/patient/presentation/screens/top_doctor/top_doctor.dart';
import 'package:health_care/patient/presentation/screens/write_review/rate_review_screen.dart';
import 'package:health_care/test.dart';

class Routes {
  static const String splashRoute = "/";
  static const String testRoute = "/test";
  static const String onBoardingRoute = "/onBoarding";
  static const String toggleRoute = "/toggle";
  static const String userLoginRoute = "/userLogin";
  static const String userEmailConfirmationRoute = "/userEmailConfirmation";
  static const String userForgetPasswordRoute = "/userForgetPassword";
  static const String userUpdatePasswordRoute = "/userUpdatePassword";
  static const String userUpdateInfoRoute = "/userUpdateInfo";
  static const String doctorRegisterRoute = "/doctorRegister";
  static const String patientRegisterRoute = "/patientRegister";
  static const String forgotPasswordRoute = "/forgotPassword";
  /////////////doctor//////////////
  static const String layoutDoctorRoute = "/layoutDoctor";
  /////////////patient//////////////
  static const String layoutPatientRoute = "/layoutPatient";
  static const String searchPatientRoute = "/searchPatient";
  static const String specialistDoctorPatientRoute = "/specialistDoctorPatient";
  static const String topDoctorPatientRoute = "/topDoctorPatient";
  static const String doctorProfilePatientRoute = "/doctorProfilePatient";
  static const String bookAppointmentRoute = "/bookAppointment";
  static const String reviewsRoute = "/reviews";
  static const String writeReviewRoute = "/writeReview";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.testRoute:
        return MaterialPageRoute(builder: (_) => TestPage());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.toggleRoute:
        return MaterialPageRoute(builder: (_) => const ToggleScreen());
      case Routes.doctorRegisterRoute:
        return MaterialPageRoute(builder: (_) => DoctorRegisterScreen());
      case Routes.userLoginRoute:
        return MaterialPageRoute(builder: (_) => UserLoginScreen());
      case Routes.userEmailConfirmationRoute:
        return MaterialPageRoute(
            builder: (_) => const UserEmailConfirmationScreen());
      case Routes.userForgetPasswordRoute:
        return MaterialPageRoute(
            builder: (_) => const UserForgetPasswordScreen());
      case Routes.userUpdatePasswordRoute:
        return MaterialPageRoute(
            builder: (_) => const UserUpdatePasswordScreen());
      case Routes.userUpdateInfoRoute:
        return MaterialPageRoute(builder: (_) => const UserUpdateInfoScreen());
      case Routes.patientRegisterRoute:
        return MaterialPageRoute(builder: (_) => PatientRegisterScreen());
      /////////////doctor//////////////
      case Routes.layoutDoctorRoute:
        return MaterialPageRoute(builder: (_) => const DoctorLayoutScreen());
      /////////////patient//////////////
      case Routes.layoutPatientRoute:
        return MaterialPageRoute(builder: (_) => const LayoutPatientScreen());
      case Routes.searchPatientRoute:
        return MaterialPageRoute(builder: (_) => SearchPatientScreen());
      case Routes.specialistDoctorPatientRoute:
        return MaterialPageRoute(
            builder: (_) => const SpecialistDoctorPatientScreen());
      case Routes.topDoctorPatientRoute:
        return MaterialPageRoute(builder: (_) => TopDoctorPatientScreen());
      case Routes.doctorProfilePatientRoute:
        final User doctorModel = routeSettings.arguments as User;
        return MaterialPageRoute(
            builder: (_) => DoctorProfilePatientScreen(
                  doctorModel: doctorModel,
                ));
      case Routes.bookAppointmentRoute:
        final Map<String, dynamic> arguments =
            routeSettings.arguments as Map<String, dynamic>;
        final List<Appointment> appointmentList =
            arguments['appointmentList'] as List<Appointment>;
        final String date = arguments['date'] as String;
        final String day = arguments['day'] as String;
        return MaterialPageRoute(
            builder: (_) => BookAppointmentScreen(
                  appointmentList: appointmentList,
                  date: date,
                  day: day,
                ));
      case Routes.reviewsRoute:
        final List<Rate> reviews = routeSettings.arguments as List<Rate>;
        return MaterialPageRoute(
            builder: (_) => ReviewsScreen(
                  reviews: reviews,
                ));
      case Routes.writeReviewRoute:
        return MaterialPageRoute(builder: (_) => WriteReviewScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(
            AppStrings.noRouteFound,
          ),
        ),
      ),
    );
  }
}
