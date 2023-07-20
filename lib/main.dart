import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_test/app/app_colors.dart';
import 'package:flutter_web_test/auth/login_page.dart';
import 'package:flutter_web_test/home/home_page.dart';
import 'package:flutter_web_test/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  //await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ScreenUtilInit(
        designSize: const Size(1920, 1080),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: GoogleFonts.latoTextTheme().apply(fontSizeFactor: 1),
              ),
              // Wrapping the app with a builder method makes breakpoints
              // accessible throughout the widget tree.
              builder: (context, child) => ResponsiveBreakpoints.builder(
                    child: child!,
                    breakpoints: [
                      const Breakpoint(start: 0, end: 450, name: MOBILE),
                      const Breakpoint(start: 451, end: 800, name: TABLET),
                      const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                      const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                    ],
                  ),
              initialRoute: '/',
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute(builder: (context) {
                  // The following code implements the legacy ResponsiveWrapper AutoScale functionality
                  // using the new ResponsiveScaledBox. The ResponsiveScaledBox widget preserves
                  // the legacy ResponsiveWrapper behavior, scaling the UI instead of resizing.
                  //
                  // **MaxWidthBox** - A widget that limits the maximum width.
                  // This is used to create a gutter area on either side of the content.
                  //
                  // **ResponsiveScaledBox** - A widget that  renders its child
                  // with a FittedBox set to the `width` value. Set the fixed width value
                  // based on the active breakpoint.
                  return MaxWidthBox(
                    maxWidth: 1900,
                    background: Container(color: AppColor.white),
                    child: ResponsiveScaledBox(
                      width: ResponsiveValue<double>(context, conditionalValues: [
                        Condition.equals(name: MOBILE, value: 450),
                        Condition.between(start: 800, end: 1100, value: 800),
                        Condition.between(start: 1000, end: 1200, value: 1000),
                        // There are no conditions for width over 1200
                        // because the `maxWidth` is set to 1200 via the MaxWidthBox.
                      ]).value,
                      child:
                          BouncingScrollWrapper.builder(context, buildPage(settings.name ?? ''), dragWithMouse: true),
                    ),
                  );
                });
              });
        });
  }

  // onGenerateRoute route switcher.
  // Navigate using the page name, `Navigator.pushNamed(context, ListPage.name)`.
  Widget buildPage(String name) {
    switch (name) {
      case Routes.home:
        return const HomePage();
      case Routes.login:
        return const LoginPage();

      default:
        return const SizedBox.shrink();
    }
  }
}
