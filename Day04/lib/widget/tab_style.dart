import 'package:flutter/material.dart';

class TabStyle extends StatefulWidget {
  final String timeState, timeStatePeriod;
  final List dataFrom;

  TabStyle({
    super.key,
    required this.timeState,
    required this.timeStatePeriod,
    required this.dataFrom,
  });

  @override
  State<TabStyle> createState() => _TabStyleState();
}

class _TabStyleState extends State<TabStyle> {
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();

  void addData() {
    setState(() {
      widget.dataFrom.add({
        'taskTitle': '${textEditingController1.text}',
        'taskDescription': '${textEditingController2.text}',
        'taskStatus': false
      });
      textEditingController1.clear();
      textEditingController2.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            timeLine(),
            const SizedBox(height: 50),
            inputField(textEditingController1),
            const SizedBox(height: 20),
            inputField(textEditingController2),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  addData();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 4,
              ),
              child: Text(
                "Add Task",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const Icon(Icons.push_pin_outlined),
                Text("      You Have to do"),
              ],
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.dataFrom.length,
              itemBuilder: (BuildContext context, int index) {
                bool isChecked = widget.dataFrom[index]['taskStatus'];
                return isChecked
                    ? const SizedBox.shrink()
                    : pinTask(index);
              },
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Icon(Icons.done_all),
                Text("      You Complete"),
              ],
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.dataFrom.length,
              itemBuilder: (BuildContext context, int index) {
                bool isChecked = widget.dataFrom[index]['taskStatus'];
                return isChecked
                    ? pinTask(index)
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Column pinTask(int index) {
    bool isChecked = widget.dataFrom[index]['taskStatus'];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.dataFrom[index]['taskStatus'] =
                        !widget.dataFrom[index]['taskStatus'];
                      });
                    },
                    child: Icon(
                      isChecked ? Icons.check_box : Icons.check_box_outline_blank,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.dataFrom[index]['taskTitle'],
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.dataFrom[index]['taskDescription'],
                          style: const TextStyle(color: Colors.white60),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.more_horiz, color: Colors.white),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  TextField inputField(TextEditingController controller) {
    return TextField(
      controller: controller,
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
              widget.timeState,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
            Text(
              widget.timeStatePeriod,
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
