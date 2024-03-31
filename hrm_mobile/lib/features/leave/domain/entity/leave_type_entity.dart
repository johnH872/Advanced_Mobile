class LeaveTypeEntity {
  final int? leaveTypeId;
  final String? leaveTypeName;
  final int? defaultStartDay;
  final int? defaultStartMonth;
  final int? defaultEndDay;
  final int?  defaultEndMonth;
  final int? defaultBudget;
  final bool? isPaidSalary;
  
  LeaveTypeEntity({
    this.leaveTypeId,
    this.leaveTypeName,
    this.defaultStartDay,
    this.defaultStartMonth,
    this.defaultEndDay,
    this.defaultEndMonth,
    this.defaultBudget,
    this.isPaidSalary
  });
}
