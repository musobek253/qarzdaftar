import 'package:uuid/uuid.dart';

class DebtorUser{

  final String id;
  final String name;
  final String phoneNumber;
  final String koment;
  final int summ;
  final DateTime dateTime;

  DebtorUser(  {required this.id ,required this.name, required this.koment, required this.summ, required this.dateTime, required this.phoneNumber});
}

