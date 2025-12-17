import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';

abstract class BaseImageRepo {
  Future<Either<Failure, String>>uploadImage(File image);
  Future<Either<Failure, String>>deleteImage(String path);
}