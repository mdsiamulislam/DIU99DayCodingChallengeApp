import 'package:bmiapp/constant/tab_list.dart';
import 'package:flutter/material.dart';
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
        length: 5, // Ensure this matches the number of tabs
        child: Scaffold(
          body: Column(
            children: [
              TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                indicatorColor: Colors.green,
                tabs: tabList, // Ensure `tabList` is defined with 5 items
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Passing data to each `TabStyle` widget
                    TabStyle(
                      timeState: "Sunday",
                      timeStatePeriod: "3rd Nov 2024",
                      dataFrom: dailyTaskData,
                    ),
                    TabStyle(
                      timeState: "1st Week",
                      timeStatePeriod: "1st to 7th Nov",
                      dataFrom: weeklyTaskData,
                    ),
                    TabStyle(
                      timeState: "November",
                      timeStatePeriod: "1st to 30th Nov",
                      dataFrom: monthlyTaskData,
                    ),
                    TabStyle(
                      timeState: "2024",
                      timeStatePeriod: "January to Decanber",
                      dataFrom: weeklyTaskData,
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
