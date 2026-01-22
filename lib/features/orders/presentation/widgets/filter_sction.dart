import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.filter_alt_rounded),
        SizedBox(width: 10),
        Text("Filter"),
      ],
    );
  }
}
