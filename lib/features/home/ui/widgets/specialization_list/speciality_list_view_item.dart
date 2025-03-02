import 'package:doctors_speciality/core/helpers/app_images.dart';
import 'package:doctors_speciality/core/helpers/spacing.dart';
import 'package:doctors_speciality/core/theming/styles.dart';
import 'package:doctors_speciality/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SpecialityListViewItem extends StatelessWidget {
final SpecializationsData? specializationsData;
final int itemIndex;

  const SpecialityListViewItem({super.key, required this.specializationsData, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          specializationsData?.name ?? 'Specialization',
          style: TextStyles.font12DarkBlueRegular
        ),
      ],
    );
  }
}
