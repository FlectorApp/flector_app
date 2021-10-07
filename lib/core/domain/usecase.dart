// Flutter imports:
// Package imports:
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

// Project imports:
import 'failure.dart';

abstract class UseCase<T, P extends Params> {
  @nonVirtual
  Future<Either<Failure, T>> call(P params) async {
    try {
      return await execute(params);
    } catch (e) {
      // log e
      // print(e);
      return const Left(UnknownFailure());
    }
  }

  Future<Either<Failure, T>> execute(P params);
}

class NoParams extends Params {
  NoParams() : super();
  @override
  List<Object> get props => [];
}

abstract class Params extends Equatable {}
