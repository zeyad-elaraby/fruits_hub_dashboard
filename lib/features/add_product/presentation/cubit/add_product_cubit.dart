import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/domain/repository/base_image_repo.dart';
import 'package:fruits_hub_dashboard/core/domain/repository/base_product_repo.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entity/add_product_input_entity.dart';

import 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.baseImageRepo, this.baseProductRepo)
    : super(AddProductInitial());
  BaseImageRepo baseImageRepo;
  BaseProductRepo baseProductRepo;
  Future<void> addProduct(
    AddProductInputEntity addProductInputEntity  ) async {
    emit(AddProductLoading());

    final result = await baseImageRepo.uploadImage(
      addProductInputEntity.image
    );
    result.fold(
      (failure) async {
        emit(AddProductError(message: failure.message));
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        

        final result = await baseProductRepo.addProduct(
          addProductInputEntity
          
        );

        result.fold((failure) async {
          emit(AddProductError(message: failure.message));
        }, (r) => emit(AddProductSuccess()));
      },
    );
  }
}
