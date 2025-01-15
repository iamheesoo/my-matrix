import 'package:flutter/material.dart';

class CheckListView extends StatefulWidget {
  final List<String> checkList;
  final String title;

  const CheckListView({required this.checkList, required this.title, super.key});

  @override
  _CheckListViewState createState() => _CheckListViewState();
}

class _CheckListViewState extends State<CheckListView> {
  late List<bool> _checked;

  @override
  void initState() {
    super.initState();
    _checked = List.generate(widget.checkList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        widget.title,
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
              itemCount: widget.checkList.length,
            ),
          )),
    ]);
  }

  Container getContainer(BuildContext context, int position) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Checkbox(value: _checked[position], onChanged: (bool? isChecked) {
                setState(() {
                  _checked[position] = isChecked ?? false;
                });
          }),
          Text("$position")
        ],
      ),
    );
  }
}
