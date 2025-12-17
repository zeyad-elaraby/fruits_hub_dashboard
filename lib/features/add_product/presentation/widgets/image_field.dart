import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onImageSelected});
  final ValueChanged<File?> onImageSelected;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  XFile? selectedImage;
  Future<void> selectImage() async {
    setState(() {
      isLoading = true;
    });
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      isLoading = false;
      selectedImage = image;
      widget.onImageSelected(File(selectedImage!.path));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectImage,
      child: Skeletonizer(
        enabled: isLoading,

        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16.r),
              ),
              width: double.infinity,
              child: selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16.r),
                      child: Image.file(
                        File(selectedImage!.path),
                        height: 200.h,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(Icons.image_outlined, size: 180),
            ),
            Visibility(
              visible: selectedImage != null,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    selectedImage = null;
                    widget.onImageSelected(null);
                  });
                },
                icon: Icon(Icons.clear),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
