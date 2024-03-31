// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hrm_mobile/core/models/global_form.dart';
import 'package:intl/intl.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DateTimeRangePickerDialog extends StatefulHookWidget {
  final String title;
  final DateTime start;
  final DateTime end;
  const DateTimeRangePickerDialog({Key? key, required this.title, required this.start, required this.end}) : super(key: key);

  @override
  State<DateTimeRangePickerDialog> createState() => _DateTimeRangePickerDialogState();
}

class _DateTimeRangePickerDialogState extends State<DateTimeRangePickerDialog> {
  late FormGroup _form;
  late FormGroup _initialForm;

  @override
  void initState() {
    _initialForm = dateRangeForm;
    _form = dateRangeForm;
    _initialForm.control('start').updateValue(widget.start);
    _initialForm.control('end').updateValue(widget.end);
    _form.control('start').updateValue(widget.start);
    _form.control('end').updateValue(widget.end);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(widget.title),
      contentPadding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      children: [
        ReactiveForm(
          formGroup: _form,
          child: Column(
            children: [
              ReactiveDateTimePicker(
                // 24 hours format
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                    child: child ?? Container(),
                  );
                },
                formControlName: 'start',
                type: ReactiveDatePickerFieldType.dateTime,
                dateFormat: DateFormat('EEE, dd MMM yyyy HH:mm'),
                style: const TextStyle(fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                  labelText: 'From',
                  hintText: DateFormat("EEE, dd MMM yyyy HH:mm").format(widget.start).toString(),
                  border: const OutlineInputBorder(),
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ReactiveDateTimePicker(
                // 24 hours format
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                    child: child ?? Container(),
                  );
                },
                formControlName: 'end',
                type: ReactiveDatePickerFieldType.dateTime,
                dateFormat: DateFormat('EEE, dd MMM yyyy HH:mm'),
                style: const TextStyle(fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                  labelText: 'To',
                  hintText: DateFormat("EEE, dd MMM yyyy HH:mm").format(widget.start).toString(),
                  border: const OutlineInputBorder(),
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
              ),
            ],
          ),
        ),
        Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () => Navigator.pop(context, _initialForm), child: const Text("Cancel")),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        DateTime startDate = _form.control('start').value as DateTime;
                        DateTime endDate = _form.control('end').value as DateTime;
                        if (startDate.isBefore(endDate)) {
                          Navigator.pop(context, _form);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Wrong start and end date!")));
                        }
                      },
                      child: const Text("OK"))
                ],
              ),
            )),
      ],
    );
  }
}
