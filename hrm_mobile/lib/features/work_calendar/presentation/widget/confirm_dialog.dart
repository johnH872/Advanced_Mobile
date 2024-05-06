// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ConfirmDialog extends StatefulHookWidget {
  final String content;
  final String title;
  final Function onClickOk;
  const ConfirmDialog({Key? key, required this.content, required this.title, required this.onClickOk}) : super(key: key);

  @override
  State<ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  late TextEditingController changedValueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(widget.title, style: const TextStyle(fontSize: 16),),
      contentPadding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          child: Text(widget.content, style: const TextStyle(fontSize: 14),),
        ),
        Container(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Cancel")),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () async{
                      await widget.onClickOk();
                      Navigator.pop(context, true);
                    },
                    child: const Text("Yes"))
              ],
            )),
      ],
    );
  }
}
