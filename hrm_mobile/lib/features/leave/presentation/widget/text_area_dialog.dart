// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextArea extends StatefulHookWidget {
  final String value;
  final String title;
  const TextArea({Key? key, required this.value, required this.title}) : super(key: key);

  @override
  State<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  late TextEditingController changedValueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    changedValueController.text = widget.value;
    return SimpleDialog(
      title: Text(widget.title),
      contentPadding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      children: [
        TextField(
          controller: changedValueController,
          maxLines: 8, //or null
          decoration: InputDecoration.collapsed(hintText: '${widget.title} here', hintStyle: const TextStyle(fontSize: 14)),
        ),
        Container(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () => Navigator.pop(context, widget.value), child: const Text("Cancel")),
                const SizedBox(
                  width: 10,
                ),
                TextButton(onPressed: () => Navigator.pop(context, changedValueController.text), child: const Text("OK"))
              ],
            )),
      ],
    );
  }
}
