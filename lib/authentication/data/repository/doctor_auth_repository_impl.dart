import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/data/data_source/doctor/doctor_auth_remote_data_source.dart';
import 'package:health_care/authentication/data/mapper/doctor_auth_mapper.dart';
import 'package:health_care/authentication/data/request/doctor_request.dart';
import 'package:health_care/authentication/domain/model/doctor_model.dart';
import 'package:health_care/authentication/domain/repository/doctor_auth_repository.dart';
import 'package:health_care/core/error/error_handler.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/network/network_info.dart';

class DoctorAuthRepositoryImpl implements BaseDoctorAuthRepository {
  final BaseDoctorAuthRemoteDataSource baseDoctorAuthRemoteDataSource;
  final NetworkInfo _networkInfo;
  DoctorAuthRepositoryImpl(
    this.baseDoctorAuthRemoteDataSource,
    this._networkInfo,
  );
  @override
  Future<Either<Failure, DoctorAuth>> doctorSignUp(
    DoctorSignUpRequest doctorSignUpRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await baseDoctorAuthRemoteDataSource.doctorSignUp(
          doctorSignUpRequest,
        );
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(1, response.message!));
        }
      } catch (error) {
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      // internet
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
