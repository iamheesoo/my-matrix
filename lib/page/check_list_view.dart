import 'package:flutter/material.dart';

class CheckListView extends StatelessWidget {
  final List<String> checkList;
  final String title;

  const CheckListView({required this.checkList, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Expanded(
          child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int position) {
            return getContainer(context, position);
          },
          itemCount: checkList.length,
        ),
      )),
    ]);
  }

  Container getContainer(BuildContext context, int position) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Text("$position"),
    );
  }
}
