import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup get editUserForm => FormGroup({
      'firstName': FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      'middleName': FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      'lastName': FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'birth': FormControl<DateTime>(),
      'gender': FormControl<String>(),
      'nationality': FormControl<String>(),
      'avatarUrl': FormControl<String>(),
      'phoneNumber': FormControl<String>(),
      'jobTitle': FormControl<String>(),
      'dateStartContract': FormControl<DateTime>(),
    });

FormGroup get employeeFilterForm => FormGroup({
      'employeeName': FormControl<String>(
      ),
      'gender': FormControl<String>(),
      'birth': FormControl<DateTimeRange>(),
      'nationality': FormControl<String>(),
      'phoneNumber': FormControl<String>(),
      'jobTitle': FormControl<String>(),
      'dateStartContract': FormControl<DateTimeRange>(),
    });

FormGroup get leaveReuestFilterForm => FormGroup({
      'leaveDateFrom': FormControl<DateTime>(),
      'leaveDateTo': FormControl<DateTime>(),
      'leaveEntitlementId': FormControl<int>(),
      'session': FormControl<String>(),
      'numberOfHour': FormControl<double>(),
      'status': FormControl<String>(),
      'note': FormControl<String>(),
      'reason': FormControl<String>(),
    });

FormGroup get dateRangeForm => FormGroup({
      'start': FormControl<DateTime>(validators: [Validators.required]),
      'end': FormControl<DateTime>(validators: [Validators.required]),
    }, validators: [
      const CompareValidator('start', 'end', CompareOption.lower)
    ]);
