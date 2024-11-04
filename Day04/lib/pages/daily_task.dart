import 'package:bmiapp/constant/tab_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../module/pin_post_list.dart';
import '../widget/tab_style.dart';

class DailyTask extends StatefulWidget {
   DailyTask({super.key});

  @override
  State<DailyTask> createState() => _DailyTaskState();
}

class _DailyTaskState extends State<DailyTask> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: Column(
            children: [
              TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                indicatorColor: Colors.green,
                tabs: tabList,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    TabStyle(timeState: "Sunday",timeStatePeriod: "3rd Nov 2024",dataFrom: pinTaskData,),
                    TabStyle(timeState: "1st Week",timeStatePeriod: "1st to 7th Nov",dataFrom: weeklyTaskData,),
                    TabStyle(timeState: "November",timeStatePeriod: "1st to 30th Nov",dataFrom: monthlyTaskData,),
                    Center(child: Text('Year View')),
                    Center(child: Text('Year View')),
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


