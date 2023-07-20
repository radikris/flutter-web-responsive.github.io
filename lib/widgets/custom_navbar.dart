import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_test/app/app_colors.dart';
import 'package:flutter_web_test/app/app_dimen.dart';
import 'package:flutter_web_test/app/app_extensions.dart';
import 'package:flutter_web_test/auth/widgets/register_button.dart';

class CustomNavBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomNavBar({super.key, required this.showButton});
  final bool showButton;

  @override
  Size get preferredSize => const Size.fromHeight(67);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: AppDimen.w16),
      height: preferredSize.height,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(),
          if (showButton) ...[
            RegisterButtonT.navbar(),
            const SizedBox(
              width: 32,
            ),
          ],
          Text(
            'Login',
            style: context.textTheme.latoSemibold14.copyWith(
              color: AppColor.teal,
            ),
          )
        ],
      ),
      // Additional content of your navbar, such as buttons, icons, or text
    );
  }
}
