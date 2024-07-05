import 'package:flutter/material.dart';
import 'package:test_task_screen/layers/presentation/app_colors.dart';
import 'package:test_task_screen/layers/presentation/app_style.dart';
import 'package:test_task_screen/layers/presentation/calendar_page/view/calendar_page.dart';
import 'package:test_task_screen/layers/presentation/diary_page/view/diary_page.dart';
import 'package:test_task_screen/layers/presentation/stats_page/view/stats_page.dart';






class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              '1 января 09:00',
              style: AppStyle.appBarTextStyle,
            ),
            centerTitle: true,
            actions: [
              Builder(
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: IconButton(
                        icon: const Icon(
                          Icons.calendar_month,
                          color: AppColors.greyColor,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CalendarPage()),
                          );
                        },
                      ),
                    );
                  }
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: AppColors.disabledGreyColor,
                  ),
                  child: const TabBar(
                    labelStyle: AppStyle.tapBarTextStyle,
                    indicatorSize: TabBarIndicatorSize.tab,
                    splashBorderRadius: BorderRadius.all(Radius.circular(50)),
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: AppColors.orangeColor,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: AppColors.greyColor,
                    tabs: [
                      TabItem(
                        title: 'Дневник настроения',
                        imagePath: 'assets/images/diary.png',
                      ),
                      TabItem(
                        title: 'Статистика',
                        imagePath: 'assets/images/stats.png',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              DiaryPage(),
              StatsPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;
  final String imagePath;

  const TabItem({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 20,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            title,
          ),
        ],
      ),
    );
  }
}


