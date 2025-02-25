import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'speciality_list_view_item.dart';

class SpecialityListView extends StatelessWidget {
  const SpecialityListView({super.key});

    @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsetsDirectional.only(start: index == 0 ? 0: 24.w),
            child: SpecialityListViewItem(
            ),
          );
        },
      ),
    );
  }
}