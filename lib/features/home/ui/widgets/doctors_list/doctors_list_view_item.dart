import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctors_speciality/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050",
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.white,
                child: Container(
                  width: 110.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              );
            },
            imageBuilder: (context, imageProvider) => Container(
              width: 110.w,
              height: 120.h,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Doctor Name', // يمكنك تغيير الاسم حسب الحاجة
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                Text(
                  'Degree | Phone Number', // يمكنك تغيير المعلومات حسب الحاجة
                  style: TextStyles.font12GrayMedium,
                ),
                SizedBox(height: 5.h),
                Text(
                  'Email Address', // يمكنك تغيير البريد الإلكتروني حسب الحاجة
                  style: TextStyles.font12GrayMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}