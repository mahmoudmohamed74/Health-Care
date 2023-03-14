import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/data/request/user_request.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/error/failure.dart';

abstract class BaseUserRepository {
  Future<Either<Failure, UserData>> userLogin(
    UserLoginRequest userLoginRequest,
  );
}
