import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/domain/repository/base_image_repo.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/services/supabase_storage.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoints.dart';

class ImageRepoImpl implements BaseImageRepo {
  ImageRepoImpl(this.storageService);
  final StorageService storageService;
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      final result = await storageService.uploadFile(
        image,
        BackEndPoints.images,
        BackEndPoints.imagesBucket,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteImage(String path) async {
    try {
      await storageService.deleteFile(path, BackEndPoints.imagesBucket);
      return Right('image deleted successfully');
    } catch (e) {
      return Left(ServerFailure("this is existing file"));
    }
  }
}
