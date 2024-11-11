import 'package:flutter/material.dart';
import 'package:bmiapp/constant/tab_list.dart';
import '../module/pin_post_list.dart';
import '../widget/tab_style.dart';

class DailyTask extends StatefulWidget {
  const DailyTask({super.key});

  @override
  State<DailyTask> createState() => _DailyTaskState();
}

class _DailyTaskState extends State<DailyTask> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4, // Match number of tabs
        child: Scaffold(
          body: Column(
            children: [
              TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                indicatorColor: Colors.green,
                tabs: tabList, // Ensure tabList is defined with 4 items
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    TabStyle(
                      timeState: "Sunday",
                      timeStatePeriod: "3rd Nov 2024",
                      taskKey: 'tasks_daily',
                    ),
                    TabStyle(
                      timeState: "1st Week",
                      timeStatePeriod: "1st to 7th Nov",
                      taskKey: 'tasks_weekly',
                    ),
                    TabStyle(
                      timeState: "November",
                      timeStatePeriod: "1st to 30th Nov",
                      taskKey: 'tasks_monthly',
                    ),
                    TabStyle(
                      timeState: "2024",
                      timeStatePeriod: "January to December",
                      taskKey: 'tasks_yearly',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
