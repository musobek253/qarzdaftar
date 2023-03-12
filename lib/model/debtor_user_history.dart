import 'package:flutter/material.dart';

class DebtorUserHistory {
  final String id;
  final String name;
  final String koment;
  final int summ;
  final DateTime dateTime;
  final String debtorUserId;
  DebtorUserHistory ( {required this.id, required this.koment,required this.dateTime,required this.name,required this.summ ,required this.debtorUserId,});
}