import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:fruits_hub_dashboard/core/domain/repository/base_product_repo.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/models/add_product_input_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entity/add_product_input_entity.dart';

class ProductRepoImpl implements BaseProductRepo {
  DatabaseService databaseService;

  ProductRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) async {
    try {
      await databaseService.addData(
        path: BackEndPoints.addProducts,
        data: AddProductInputModel.fromEntity(addProductInputEntity).toJson(),
      );
      return Right(null);
    } catch (e) {
      if (kDebugMode) {
        print("error in add product repo impl  $e");
      }
      return Left(ServerFailure('failed to add product'));
    }
  }
}
