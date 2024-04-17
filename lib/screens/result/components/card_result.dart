import 'package:bmi_calculator/provider/theme_provider.dart';
import 'package:bmi_calculator/screens/result/components/custom_meter.dart';
import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/provider/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CardResult extends StatelessWidget {
  const CardResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(3.h),
      child: Container(
        height: 35.h,
        decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: themeProvider.isDark
                ? AppColors.darkOuterBoxShadow
                : AppColors.outerBoxShadow),
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            children: [
              Consumer<Mass>(
                builder: (context, value, child) => Text(
                  value.result,
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
              Consumer<Mass>(
                builder: (context, value, child) => Text(
                  value.msg,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: value.color,
                  ),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              const CustomMeter(),
            ],
          ),
        ),
      ),
    );
  }
}
