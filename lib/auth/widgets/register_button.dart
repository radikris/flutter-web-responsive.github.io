import 'package:flutter/material.dart';
import 'package:flutter_web_test/app/app_colors.dart';
import 'package:flutter_web_test/app/app_extensions.dart';

class RegisterButtonT extends StatelessWidget {
  final double? width;
  final bool isNavbar;

  const RegisterButtonT({Key? key, this.width, this.isNavbar = false}) : super(key: key);

  factory RegisterButtonT.normal({double? width}) {
    return RegisterButtonT(width: width);
  }

  factory RegisterButtonT.navbar({double? width}) {
    return RegisterButtonT(width: width, isNavbar: true);
  }

  @override
  Widget build(BuildContext context) {
    final Color textColor = isNavbar ? AppColor.teal : AppColor.lightMint;

    return Container(
      height: 40.0,
      width: width,
      decoration: BoxDecoration(
        border: isNavbar ? Border.all(color: AppColor.lightSteelBlue) : null,
        borderRadius: BorderRadius.circular(12),
        color: isNavbar ? AppColor.white : null,
        gradient: isNavbar
            ? null
            : LinearGradient(
                colors: [
                  AppColor.teal,
                  AppColor.cerulean,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: const GradientRotation(95 * (3.14159 / 180)), // Convert degrees to radians
              ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          'Kostenlos Registrieren',
          style: context.textTheme.latoSemibold14.copyWith(color: textColor),
        ),
      ),
    );
  }
}
