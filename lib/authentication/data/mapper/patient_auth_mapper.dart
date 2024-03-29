import 'package:health_care/authentication/data/mapper/user_mapper.dart';
import 'package:health_care/authentication/data/response/patient_auth_response/patient_auth_response.dart';
import 'package:health_care/authentication/domain/model/patient_model.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/utils/extension.dart';

extension PatientAuthResponseMapper on PatientAuthResponse? {
  PatientAuth toDomain() {
    return PatientAuth(
      this?.token?.orEmpty() ?? Constants.empty,
      this?.user?.toDomain(),
    );
  }
}
