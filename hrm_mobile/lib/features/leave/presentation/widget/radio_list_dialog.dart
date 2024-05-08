// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RadioList extends StatefulHookWidget {
  final String title;
  final List<String> list;
  final String selectedValue;
  const RadioList({Key? key, required this.title, required this.list, required this.selectedValue}) : super(key: key);

  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  @override
  Widget build(BuildContext context) {
    var selectedValue = useState(widget.selectedValue);
    return SimpleDialog(
      title: Text(widget.title),
      children: [
        SizedBox(
          height: 170.0,
          width: 300.0,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.list.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    selectedValue.value = widget.list[index];
                  },
                  child: ListTile(
                    title: Text(widget.list[index]),
                    leading: Radio(
                      value: widget.list[index],
                      groupValue: selectedValue.value,
                      onChanged: (String? value) {
                        selectedValue.value = value ?? selectedValue.value;
                      },
                    ),
                  ));
            },
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () => Navigator.pop(context, selectedValue.value),
                child: const Text("OK"),
              )),
        )
      ],
    );
  }
}
