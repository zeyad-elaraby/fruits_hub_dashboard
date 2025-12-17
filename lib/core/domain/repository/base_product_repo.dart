import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entity/add_product_input_entity.dart';

abstract class BaseProductRepo {
  Future<Either<Failure,void>> addProduct(
    AddProductInputEntity addProductInputEntity
    );
}
