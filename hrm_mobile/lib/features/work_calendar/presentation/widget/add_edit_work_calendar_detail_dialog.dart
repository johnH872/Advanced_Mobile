// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hrm_mobile/core/models/global_form.dart';
import 'package:hrm_mobile/core/util/common.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/work_calendar_detail_entity.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/work_calendar_entity.dart';
import 'package:hrm_mobile/features/work_calendar/presentation/provider/work_calendar_provider.dart';
import 'package:intl/intl.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class AddEditWorkCalendarDetailDialog extends StatefulHookWidget {
  final WorkCalendarDetailEntity? workCalendarDetailEntity;
  final WorkCalendarEntity? workCalendarEntity;
  const AddEditWorkCalendarDetailDialog({Key? key, this.workCalendarDetailEntity, required this.workCalendarEntity})
      : super(key: key);

  @override
  State<AddEditWorkCalendarDetailDialog> createState() => _AddEditWorkCalendarDetailDialogState();
}

class _AddEditWorkCalendarDetailDialogState extends State<AddEditWorkCalendarDetailDialog> {
  late FormGroup _form;
  late FormGroup _initialForm;
  final commonUtil = CommonUtil();
  Color pickerColor = const Color.fromARGB(255, 41, 64, 198);
  Color currentColor = const Color.fromARGB(255, 41, 64, 198);
  @override
  void initState() {
    initForm();
    super.initState();
  }

  void initForm() {
    _initialForm = workCalendarDetailForm;
    _form = workCalendarDetailForm;
    if (widget.workCalendarDetailEntity != null) {
      DateTime entityStart = DateFormat('hh:mm a').parse(widget.workCalendarDetailEntity?.from ?? '00:00 AM');
      DateTime entityEnd = DateFormat('hh:mm a').parse(widget.workCalendarDetailEntity?.to ?? '11:59 PM');
      var startDate = DateTime(1970, 1, 1, entityStart.hour, entityStart.minute);
      var endDate = DateTime(1970, 1, 1, entityEnd.hour, entityEnd.minute);
      _initialForm.control('start').updateValue(startDate);
      _initialForm.control('end').updateValue(endDate);
      _initialForm.control('description').updateValue(widget.workCalendarDetailEntity?.description ?? '');
      _initialForm.control('codeColor').updateValue(widget.workCalendarDetailEntity?.codeColor ?? '');
      _form.control('start').updateValue(startDate);
      _form.control('end').updateValue(endDate);
      _form.control('description').updateValue(widget.workCalendarDetailEntity?.description ?? '');
      _form.control('codeColor').updateValue(widget.workCalendarDetailEntity?.codeColor ?? '');
      currentColor = commonUtil.hexToColor(widget.workCalendarDetailEntity?.codeColor ?? '');
      pickerColor = commonUtil.hexToColor(widget.workCalendarDetailEntity?.codeColor ?? '');
    } else {
      var currentDate = DateTime(1970, 1, 1);
      _initialForm.control('start').updateValue(currentDate);
      _initialForm.control('end').updateValue(currentDate);
      _initialForm.control('description').updateValue('');
      _initialForm.control('codeColor').updateValue('');
      _form.control('start').updateValue(currentDate);
      _form.control('end').updateValue(currentDate);
      _form.control('description').updateValue('');
      _form.control('codeColor').updateValue(('#${pickerColor.value.toRadixString(16).substring(2).padLeft(6, '0')}'));
    }
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    final workCalendarProvider = Provider.of<WorkCalendarProvider>(context, listen: false);
    return SimpleDialog(
      title: const Text('Edit detail'),
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
                type: ReactiveDatePickerFieldType.time,
                dateFormat: DateFormat('HH:mm'),
                style: const TextStyle(fontWeight: FontWeight.normal),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 12),
                  labelText: 'From',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(
                height: 15,
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
                type: ReactiveDatePickerFieldType.time,
                dateFormat: DateFormat('HH:mm'),
                style: const TextStyle(fontWeight: FontWeight.normal),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 12),
                  labelText: 'To',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ReactiveTextField(
                formControlName: 'description',
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Description here',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    child: AlertDialog(
                      title: const Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: pickerColor,
                          onColorChanged: changeColor,
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('Got it'),
                          onPressed: () {
                            setState(() => currentColor = pickerColor);
                            var hexColor = ('#${pickerColor.value.toRadixString(16).substring(2).padLeft(6, '0')}');
                            _form.control('codeColor').updateValue(hexColor);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: currentColor,
                ),
              )
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
                  TextButton(onPressed: () => Navigator.pop(context, widget.workCalendarDetailEntity), child: const Text("Cancel")),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        DateTime startDate = _form.control('start').value as DateTime;
                        DateTime endDate = _form.control('end').value as DateTime;
                        if (startDate.isBefore(endDate)) {
                          var saveModel = WorkCalendarDetailEntity();
                          if (widget.workCalendarDetailEntity != null) {
                            saveModel = WorkCalendarDetailEntity(
                                workCalendarDetailId: widget.workCalendarDetailEntity?.workCalendarDetailId,
                                workCalendarId: widget.workCalendarDetailEntity?.workCalendarId,
                                createdAt: widget.workCalendarDetailEntity?.createdAt,
                                updatedAt: widget.workCalendarDetailEntity?.updatedAt,
                                from: DateFormat('hh:mm a').format(_form.control('start').value),
                                to: DateFormat('hh:mm a').format(_form.control('end').value),
                                description: _form.control('description').value,
                                codeColor: _form.control('codeColor').value);
                          } else {
                            saveModel = WorkCalendarDetailEntity(
                                workCalendarDetailId: null,
                                workCalendarId: widget.workCalendarEntity?.workCalendarId,
                                createdAt: null,
                                updatedAt: null,
                                from: DateFormat('hh:mm a').format(_form.control('start').value),
                                to: DateFormat('hh:mm a').format(_form.control('end').value),
                                description: _form.control('description').value,
                                codeColor: _form.control('codeColor').value);
                          }
                          workCalendarProvider.saveWorkCalendarDetail(context, saveModel);
                          Navigator.pop(context, saveModel);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text("Wrong start and end date!")));
                        }
                      },
                      child: const Text("Save"))
                ],
              ),
            )),
      ],
    );
  }
}
