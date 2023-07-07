// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/authentication/presentation/controller/auth_cubit.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/patient/presentation/controller/Patient_cubit/patient_cubit.dart';

import '../global/theme/theme_data/theme_data_light.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp instance = MyApp._internal(); // singleton

  factory MyApp() => instance; //factory for the class instance

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => sl<AuthCubit>(),
        ),
        BlocProvider<PatientCubit>(
          create: (BuildContext context) => sl<PatientCubit>()
            ..getTopDoctor()
            ..getAllDoctor(''),
        ),
      ],
      child: MaterialApp(
        theme: getThemeDataLight(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute:
            Constants.isLogout ? Routes.userLoginRoute : Routes.splashRoute,
      ),
    );
  }
}
