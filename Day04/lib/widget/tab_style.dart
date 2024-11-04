import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../module/pin_post_list.dart';

class TabStyle extends StatelessWidget {
  final String timeState, timeStatePeriod;
  List dataFrom;

  TabStyle({
    super.key,
    required this.timeState,
    required this.timeStatePeriod,
    required this.dataFrom,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        timeLine(),
        inputField(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Icon(Icons.push_pin_outlined,),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: dataFrom.length,
            itemBuilder: (BuildContext context, int index) {
              return pinTask(index);
            },
          ),
        ),
      ],
    );
  }

  Padding pinTask(int index) {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8), // Adding vertical padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_box_outline_blank, color: Colors.white),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataFrom[index]['taskTitle'],
                              style: const TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Text(
                              dataFrom[index]['taskDescription'],
                              style: const TextStyle(color: Colors.white60),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Icon(Icons.more_horiz, color: Colors.white),
                  ],
                ),
              );
  }

  Padding inputField() {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.subject, color: Colors.grey),
          hintText: 'Add A Task..',
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black38),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black),
          ),
          filled: true,
          fillColor: const Color.fromRGBO(53, 58, 64, 1),
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Row timeLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.chevron_left, color: Colors.white70),
        const SizedBox(width: 20),
        Column(
          children: [
            Text(
              timeState,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
            Text(
              timeStatePeriod,
              style: const TextStyle(fontSize: 10, color: Colors.white70),
            ),
          ],
        ),
        const SizedBox(width: 20),
        const Icon(Icons.chevron_right, color: Colors.white70),
      ],
    );
  }
}
