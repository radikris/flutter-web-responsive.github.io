import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_test/app/app_colors.dart';
import 'package:flutter_web_test/app/app_extensions.dart';
import 'package:flutter_web_test/app/models.dart';
import 'package:flutter_web_test/gen/assets.gen.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  final List<HomeStepModel> steps = [
    HomeStepModel("Arbeitnehmer", "Drei einfache Schritte zu deinem neuen Job", [
      ("Erstellen dein Lebenslauf", Assets.tab1Step1),
      ("Erstellen dein Lebenslauf", Assets.tab1Step2),
      ("Mit nur einem Klick bewerben", Assets.tab1Step3),
    ]),
    HomeStepModel("Arbeitgeber", "Drei einfache Schritte zu deinem neuen Mitarbeiter", [
      ("Erstellen dein Unternehmensprofil", Assets.tab1Step1),
      ("Erstellen ein Jobinserat", Assets.tab2Step2),
      ("Wähle deinen neuen Mitarbeiter aus", Assets.tab2Step3),
    ]),
    HomeStepModel("Temporärbüro", "Drei einfache Schritte zur Vermittlung neuer Mitarbeiter", [
      ("Erstellen dein Unternehmensprofil", Assets.tab1Step1),
      ("Drei einfache Schritte zur Vermittlung neuer Mitarbeiter", Assets.tab3Step2),
      ("Vermittlung nach Provision oder Stundenlohn", Assets.tab3Step3),
    ])
  ];

  late TabController tabController;
  int _tabIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() => _tabIndex = tabController.index);
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaxWidthBox(
      alignment: Alignment.topCenter,
      maxWidth: 1000,
      child: Container(
        margin: EdgeInsets.all(context.isMobile ? 8.0.w : 32.w),
        child: DefaultTabController(
          length: steps.length, // Number of tabs
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),

                  border: Border.all(color: AppColor.lightSteelBlue), // Border color
                ),
                child: TabBar(
                    dividerColor: AppColor.lightSteelBlue,
                    isScrollable: context.isMobile ? true : false,
                    controller: tabController,
                    indicatorColor: Colors.transparent,
                    labelStyle: context.textTheme.latoSemibold14.copyWith(color: AppColor.teal),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_tabIndex == 0 ? 12.0 : 0),
                        bottomLeft: Radius.circular(_tabIndex == 0 ? 12.0 : 0),
                        bottomRight: Radius.circular(_tabIndex == 2 ? 12.0 : 0),
                        topRight: Radius.circular(_tabIndex == 2 ? 12.0 : 0),
                      ),
                      color: AppColor.turquoise,
                    ),
                    unselectedLabelColor: AppColor.teal, // Text color for unselected tabs
                    tabs: steps.map((e) => Tab(text: e.tab)).toList()),
              ),
              Expanded(
                  child: TabBarView(
                      controller: tabController,
                      children: steps
                          .mapIndexed((idx1, e) => Column(children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 32.0.h),
                                  width: context.isDesktop
                                      ? context.screenSize.width * 0.3
                                      : context.screenSize.width * 0.8,
                                  child: Text(
                                    e.title,
                                    textAlign: TextAlign.center,
                                    style: context.textTheme.latoMedium40.copyWith(color: AppColor.slate),
                                  ),
                                ),
                                ...steps[idx1]
                                    .steps
                                    .mapIndexed((index, element) => Container(
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  ResponsiveRowColumn(
                                                      rowSpacing: 50,
                                                      layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                                                          ? ResponsiveRowColumnType.COLUMN
                                                          : ResponsiveRowColumnType.ROW,
                                                      children: index != 1
                                                          ? [
                                                              ResponsiveRowColumnItem(
                                                                columnOrder: index == 1 ? 2 : 1,
                                                                child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                                                  textBaseline: TextBaseline.alphabetic,
                                                                  children: [
                                                                    Container(
                                                                      padding: const EdgeInsets.all(20),
                                                                      decoration: BoxDecoration(
                                                                          shape: BoxShape.circle,
                                                                          color: Colors.grey[100]),
                                                                      child: Text('${index + 1}.',
                                                                          style: context.textTheme.latoRegular130
                                                                              .copyWith(color: AppColor.slate)),
                                                                    ),
                                                                    Text(element.$1,
                                                                        style: context.textTheme.latoRegular15
                                                                            .copyWith(color: AppColor.slate)),
                                                                  ],
                                                                ),
                                                              ),
                                                              ResponsiveRowColumnItem(
                                                                columnOrder: index == 1 ? 1 : 2,
                                                                child: SvgPicture.asset(
                                                                  element.$2,
                                                                ),
                                                              ),
                                                            ]
                                                          : [
                                                              ResponsiveRowColumnItem(
                                                                columnOrder: index == 1 ? 1 : 2,
                                                                child: SvgPicture.asset(element.$2),
                                                              ),
                                                              ResponsiveRowColumnItem(
                                                                columnOrder: index == 1 ? 2 : 1,
                                                                child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                                                  textBaseline: TextBaseline.alphabetic,
                                                                  children: [
                                                                    Text('${index + 1}.',
                                                                        style: context.textTheme.latoRegular130
                                                                            .copyWith(color: AppColor.slate)),
                                                                    Text(element.$1,
                                                                        style: context.textTheme.latoRegular15
                                                                            .copyWith(color: AppColor.slate)),
                                                                  ],
                                                                ),
                                                              ),
                                                            ]),
                                                  const SizedBox(
                                                    height: 50,
                                                  ),
                                                ],
                                              ),
                                              if (context.isDesktop && index != 2)
                                                Positioned(
                                                    left: 100,
                                                    bottom: -80,
                                                    child: SvgPicture.asset(
                                                        index == 0 ? Assets.line1To2 : Assets.line2To3,
                                                        height: 190,
                                                        width: 390)),
                                            ],
                                          ),
                                        ))
                                    .toList()
                              ]))
                          .toList())),
            ],
            // Contents for each tab
          ),
        ),
      ),
    );
  }
}
