import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/widgets/custom_check_box.dart';

class IsFeaturedItem extends StatefulWidget {
  const IsFeaturedItem({super.key, required this.onChange});

  final ValueChanged<bool> onChange;

  @override
  State<IsFeaturedItem> createState() => _IsFeaturedItemState();
}

class _IsFeaturedItemState extends State<IsFeaturedItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "is featured item",
            style: TextStyles.semibold13.copyWith(color: AppColors.color949D9E),
          ),
        ),
        CustomCheckBox(
          isChecked: isChecked,
          onChange: (value) {
            isChecked = value;
            widget.onChange(value);
            setState(() {});
          },
        ),
      ],
    );
  }
}
