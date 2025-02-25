import 'package:doctors_speciality/core/helpers/app_images.dart';
import 'package:doctors_speciality/core/helpers/spacing.dart';
import 'package:doctors_speciality/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SpecialityListViewItem extends StatelessWidget {
  const SpecialityListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            child: SvgPicture.asset(
              AppImages.generalSpeciality,
              height: 40.h,
              width: 40.w,
            ),
          ),
          verticalSpace(8),
          Text(
            'Muscle',
            style: TextStyles.font12DarkBlueRegular
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
