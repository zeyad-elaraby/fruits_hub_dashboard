import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub_dashboard/core/utils/validator.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entity/add_product_input_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entity/review_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/cubit/add_product_state.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widgets/custom_text_form_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widgets/is_featured_item.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widgets/is_oragnic_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productExpiratioMonthsController =
      TextEditingController();
  TextEditingController productNumberOfCaloriesController =
      TextEditingController();
  TextEditingController productUnitAmountController = TextEditingController();
  bool isFeatured = false;
  bool isOrganic = false;
  File? selectedImage;
  String? _imageError;
  @override
  void dispose() {
    productNameController.dispose();
    productPriceController.dispose();
    productCodeController.dispose();
    productDescriptionController.dispose();
    productExpiratioMonthsController.dispose();
    productNumberOfCaloriesController.dispose();
    productUnitAmountController.dispose();
    super.dispose();
  }

  void _validateImage() {
    setState(() {
      _imageError = MyValidators.imageValidator(selectedImage?.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            spacing: 16.w,
            children: [
              CustomTextField(
                hintText: 'Product name',
                validator: (value) => MyValidators.displayNamevalidator(value),
                controller: productNameController,
              ),
              CustomTextField(
                hintText: 'Product Price',
                validator: (value) => MyValidators.priceValidator(value),

                controller: productPriceController,
              ),
              CustomTextField(
                hintText: 'Product Expiration Months',
                validator: (value) => MyValidators.priceValidator(value),

                controller: productExpiratioMonthsController,
              ),
              CustomTextField(
                hintText: 'Product Number of Calories',
                validator: (value) => MyValidators.priceValidator(value),

                controller: productNumberOfCaloriesController,
              ),
              CustomTextField(
                hintText: 'Product Unit Amount',
                validator: (value) => MyValidators.priceValidator(value),

                controller: productUnitAmountController,
              ),
              CustomTextField(
                hintText: 'Product Code',
                validator: (value) =>
                    MyValidators.genericValidator(value: value),
                controller: productCodeController,
              ),
              CustomTextField(
                hintText: 'Product Descrioption',
                maxLines: 5,
                validator: (value) => MyValidators.genericValidator(
                  value: value,
                  minLength: 5,
                  fieldName: 'Description',
                ),
                controller: productDescriptionController,
              ),
              IsOragnicCheckBox(
                onChange: (value) {
                  isOrganic = value;
                },
              ),
              IsFeaturedItem(
                onChange: (value) {
                  isFeatured = value;
                },
              ),
              ImageField(
                onImageSelected: (value) {
                  selectedImage = value;
                  if (value != null) {
                    _imageError = null;
                  }
                },
              ),
              if (_imageError != null)
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    _imageError!,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              CustomElevatedButton(
                onPressed: () {
                  _validateImage();
                  if (_formKey.currentState!.validate()) {
                    if (_imageError == null) {
                      AddProductInputEntity input = AddProductInputEntity(
                        name: productNameController.text,
                        code: productCodeController.text,
                        description: productDescriptionController.text,
                        price: productPriceController.text,
                        image: selectedImage!,
                        isFeatured: isFeatured,
                        expiratioMonths: int.parse(
                          productExpiratioMonthsController.text,
                        ),
                        isOrganic: isOrganic,
                        numberOfCalories: int.parse(
                          productNumberOfCaloriesController.text,
                        ),
                        unitAmount: int.parse(productUnitAmountController.text),
                        reviews: [
                          ReviewEntity(
                            name: 'John Doe',
                            image: 'https://www.pexels.com/search/flowers/',
                            rating: 4.5,
                            date: '2022-01-01',
                            reviewDescription: 'This is a review description.',
                          ),
                        ],
                      );
                      context.read<AddProductCubit>().addProduct(
                        // input
                        input,
                      );
                    }
                  }
                },
                title: "Add Product",
              ),
              SizedBox(height: 0.h),
            ],
          ),
        ),
      ),
    );
  }
}
