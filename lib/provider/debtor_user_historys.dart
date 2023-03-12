import 'package:flutter/material.dart';
import 'package:qarzdaftar/model/debtor_user_history.dart';

import '../db.dart';

class DebtorUserHistorys with ChangeNotifier {
  List<DebtorUserHistory> _debtoruserHistorys = [];

  List<DebtorUserHistory> get debtorUserHistorys => [..._debtoruserHistorys];

  void addDebtorUserHistory(String debtorUserId, String name, String koment,
      int summ, DateTime dateTime) {
    DebtorUserHistory newDebtorUser = DebtorUserHistory(
        id: UniqueKey().toString(),
        koment: koment,
        dateTime: dateTime,
        name: name,
        summ: summ,
        debtorUserId: debtorUserId);
    _debtoruserHistorys.add(newDebtorUser);
    DbExpenseBook.insert("debetoruser", {
      "id": newDebtorUser.id,
      "name": newDebtorUser.name,

    });
    notifyListeners();
  }

  List<DebtorUserHistory> selectrday(DateTime dateTime) {
    return _debtoruserHistorys
        .where((element) => element.dateTime.day == dateTime.day)
        .toList();
  }

  int Summkirim(DateTime dateTime) {
    int summ = 0;
    _debtoruserHistorys.forEach((element) {
      if (element.dateTime.day == dateTime.day) {
        if(element.summ>0){
          summ += element.summ;
        }
      }
    });
    return summ;
  }
  int sumChiqim(DateTime dateTime){
    int summ = 0;
    _debtoruserHistorys.forEach((element) {
      if(element.dateTime.day == dateTime.day){
        if(element.summ < 0 ){
          summ += element.summ;
        }
      }
    });
    return summ;
  }
  List<DebtorUserHistory> getDebtorUsers(String debtorUserId){
    return _debtoruserHistorys.where((element) => element.debtorUserId == debtorUserId).toList();
  }
  int summDeb(String debtorId){
    int sum = 0;
    getDebtorUsers(debtorId).forEach((element) {
      sum+=element.summ;
    });
    return sum;
  }

  int sumKirim(){
    return _debtoruserHistorys.fold(0, (previousValue, element)=> element.summ>0?previousValue+element.summ:previousValue);
  }
  int sumchiqim(){
    return _debtoruserHistorys.fold(0, (previousValue, element) => element.summ<0?previousValue+ element.summ :previousValue);
  }
  int ummuiy(){
    return sumKirim()+sumchiqim();
  }

}

