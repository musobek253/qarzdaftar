import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qarzdaftar/model/debtor_user.dart';
import 'package:qarzdaftar/model/debtor_user_history.dart';
import 'package:qarzdaftar/provider/debtor_user_historys.dart';

class DebtorUserHistoryScreens extends StatefulWidget {
  const DebtorUserHistoryScreens({Key? key}) : super(key: key);
  static const String routname = "/debtoruserhistory";

  @override
  State<DebtorUserHistoryScreens> createState() =>
      _DebtorUserHistoryScreensState();
}

class _DebtorUserHistoryScreensState extends State<DebtorUserHistoryScreens> {
  @override
  Widget build(BuildContext context) {
    var debetorUser = ModalRoute.of(context)!.settings.arguments as DebtorUser;
    var summ = Provider.of<DebtorUserHistorys>(context).summDeb(debetorUser.id);
    var debtorUserHistorys = Provider.of<DebtorUserHistorys>(context).getDebtorUsers(debetorUser.id);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("${debetorUser.name}ning xarajatlari",style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$summ",style:  TextStyle(color: summ>0?Colors.green:Colors.red,fontWeight: FontWeight.w600),)
              ],
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final debtorUserHistory = debtorUserHistorys[index];
          return DebtorUserHistoryUi(debtorUserHistory: debtorUserHistory);
        },
        itemCount: debtorUserHistorys.length,
      ),
    );
  }
}

class DebtorUserHistoryUi extends StatelessWidget {
  const DebtorUserHistoryUi({Key? key, required this.debtorUserHistory})
      : super(key: key);
  final DebtorUserHistory debtorUserHistory;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              debtorUserHistory.summ > 0 ? Colors.green : Colors.red,
        ),
        title: Text("${debtorUserHistory.summ}"),
        subtitle: Text(
            "${DateFormat("dd.MM.yyyy, hh:mm").format(debtorUserHistory.dateTime)}"),
        trailing: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${debtorUserHistory.summ}"),
            PopupMenuButton(
              position:  PopupMenuPosition.under,
              itemBuilder: (BuildContext contex) => [
                PopupMenuItem(
                  value: 'search',
                  child: Text('Search'),
                ),
                PopupMenuItem(
                  value: 'settings',
                  child: Text('Settings'),
                ),
                PopupMenuItem(
                  value: 'help',
                  child: Text('Help'),
                ),
              ],
              onSelected: (selectedValue) {
                switch (selectedValue) {
                  case 'search':
                    // Perform action for search
                    break;
                  case 'settings':
                    // Perform action for settings
                    break;
                  case 'help':
                    // Perform action for help
                    break;
                }
              },
              icon: const Icon(Icons.more_vert),
            )
          ],
        ),
      ),
    );
  }
}
