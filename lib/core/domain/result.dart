// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:flector/core/domain/failure.dart';

typedef Result<T> = Either<Failure, T>;
