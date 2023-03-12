import 'package:flutter/material.dart';
import 'package:qarzdaftar/db.dart';
import 'package:qarzdaftar/model/debtor_user_history.dart';

import '../model/debtor_user.dart';

class DebtorUsers with ChangeNotifier {
  List<DebtorUser> _debtorUsers = [];

  List<DebtorUser> get debtorUsers => [..._debtorUsers];

  String addDebtoruser(String name, String koment, int summ, DateTime dateTime,String phoneNumber) {
    DebtorUser debtorUser = DebtorUser(id: UniqueKey().toString(),
        name: name,
        koment: koment,
        summ: summ,
        dateTime: dateTime,
        phoneNumber: phoneNumber);
    _debtorUsers.add(debtorUser);
    notifyListeners();

    DbExpenseBook.insert("debtor_user", {
      "id": debtorUser.id,
      "name": debtorUser.name,
      "phonenumber": debtorUser.phoneNumber,
      "koment": debtorUser.koment,
      "summ": debtorUser.summ,
      "datetime": debtorUser.dateTime
    });

    return debtorUser.id;

  }

  Future<void> getdebtoruserdatabase() async {
    final getdatas = await DbExpenseBook.getdata("debtor_user");
    _debtorUsers = getdatas.map((e) => DebtorUser(id: e["id"], name: e["name"], koment: e["koment"], summ: e["summ"], dateTime: e["datetime"], phoneNumber: e["phonenumber"])).toList();
    notifyListeners();
  }

}
