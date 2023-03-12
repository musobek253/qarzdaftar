import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qarzdaftar/model/debtor_user_history.dart';

import '../provider/debtor_user_historys.dart';

class ExpenseHistory extends StatelessWidget {
  const ExpenseHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var debtorUserHistorys = Provider.of<DebtorUserHistorys>(context).debtorUserHistorys;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xarajatlar tarixi"),
      ),
      body: ListView.builder(itemBuilder: (cnt,i){
        final debtorUserHistory = debtorUserHistorys[i];
        return ExpenseHistoryUi(debtorUserHistory:debtorUserHistory);
      },
        itemCount: debtorUserHistorys.length,),
    );
  }
}

class ExpenseHistoryUi extends StatelessWidget {
  const ExpenseHistoryUi({Key? key, required this.debtorUserHistory}) : super(key: key);
  final DebtorUserHistory debtorUserHistory;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: debtorUserHistory.summ>0?Colors.green:Colors.red,
      child: ListTile(
        title: Text("${debtorUserHistory.name}",style: const TextStyle(fontSize: 30),),
        subtitle: Text("${DateFormat("dd MMMM yyyy").format(debtorUserHistory.dateTime)}, ${debtorUserHistory.koment}"),
        trailing: Text("${debtorUserHistory.summ}"),
      ),
    );
  }
}

