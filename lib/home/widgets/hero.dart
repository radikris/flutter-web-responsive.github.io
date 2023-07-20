import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_test/app/app_colors.dart';
import 'package:flutter_web_test/app/app_dimen.dart';
import 'package:flutter_web_test/app/app_extensions.dart';
import 'package:flutter_web_test/auth/widgets/register_button.dart';
import 'package:flutter_web_test/gen/assets.gen.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.buttonVisible});
  final bool buttonVisible;

  @override
  Widget build(BuildContext context) {
    return MaxWidthBox(
        alignment: Alignment.topCenter,
        background: Container(
          height: context.isDesktop
              ? 350
              : context.isTablet
                  ? 250
                  : 450,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: const GradientRotation(102 * (3.14159 / 180)), // Convert degrees to radians
              colors: [
                AppColor.lightBlue, // #EBF4FF
                AppColor.lightMint, // #E6FFFA
              ],
            ),
            backgroundBlendMode: BlendMode.srcOver,
          ),
        ),
        maxWidth: 1000,
        child: Padding(
          padding: EdgeInsets.all(context.isMobile ? 8.0.w : 32.w),
          child: ResponsiveRowColumn(
            layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(child: SizedBox(height: 74.h)),
              ResponsiveRowColumnItem(
                columnOrder: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deine Job\nWebsite',
                      style: (context.isMobile
                              ? context.textTheme.latoMedium40
                              : context.isTablet
                                  ? context.textTheme.latoSemibold30
                                  : context.textTheme.latoBold65)
                          .copyWith(color: AppColor.blueGray),
                      textAlign: context.isMobile ? TextAlign.center : TextAlign.left,
                    ),
                    if (!context.isMobile) ...[
                      SizedBox(
                        height: 53.h,
                      ),
                      RegisterButtonT.normal(
                        width: 300,
                      )
                    ]
                  ],
                ),
              ),
              ResponsiveRowColumnItem(
                child: SizedBox(
                  width: context.isMobile
                      ? 0
                      : context.isDesktop
                          ? 150.w
                          : 75.w,
                ),
              ),
              ResponsiveRowColumnItem(
                  columnOrder: 2,
                  child: context.isMobile
                      ? SvgPicture.asset(
                          Assets.hero,
                          fit: BoxFit.fitWidth,
                          height: 300,
                        )
                      : CircleAvatar(
                          backgroundColor: AppColor.white,
                          radius: context.isDesktop ? 125 : 100,
                          child: SvgPicture.asset(
                            Assets.hero,
                            width: 400,
                            height: 400,
                          ),
                        )),
              ResponsiveRowColumnItem(
                columnOrder: 3,
                child: context.isMobile
                    ? Container(
                        transform: Matrix4.translationValues(0.0, -24.0, 0.0),
                        height: 128,
                        padding: const EdgeInsets.all(20).copyWith(top: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppDimen.r24),
                              topRight: Radius.circular(AppDimen.r24),
                            ),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 0,
                                color: AppColor.blackTransparent,
                                blurRadius: 3.r,
                                offset: const Offset(0, -1),
                              )
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppDimen.r24),
                            topRight: Radius.circular(AppDimen.r24),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(child: RegisterButtonT.normal()),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ));
  }
}
