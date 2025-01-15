import 'package:flutter/material.dart';

class CheckListView extends StatefulWidget {
  @override
  _CheckListView createState() => _CheckListView();
}

class _CheckListView extends State<CheckListView> {
  List<String> checkList = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      checkList.add("$i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("title"),
      Expanded(
          child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(24))),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int position) {
            return getContainer(position);
          },
          itemCount: checkList.length,
        ),
      )),
    ]);
  }

  Container getContainer(int position) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Text("$position"),
    );
  }
}
