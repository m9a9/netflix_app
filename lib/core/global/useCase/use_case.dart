import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class UseCase<Type, parameter> {
  Future<Either<Failure, Type>> call([parameter parameter]);
}

class NoParam {}
