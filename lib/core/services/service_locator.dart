import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/data/repository/image_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/data/repository/product_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/domain/repository/base_image_repo.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/services/supabase_storage.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:get_it/get_it.dart';

import '../domain/repository/base_product_repo.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //CUBITS

    sl.registerFactory<AddProductCubit>(() => AddProductCubit(sl(), sl()));

    //REPOSITORY
    sl.registerLazySingleton<BaseImageRepo>(() => ImageRepoImpl(sl()));
    sl.registerLazySingleton<BaseProductRepo>(() => ProductRepoImpl(sl()));

    //DATA SOURCE
    sl.registerLazySingleton<StorageService>(() => SupabaseStorage());
    sl.registerLazySingleton<DatabaseService>(() => FirestoreService());
  }
}
