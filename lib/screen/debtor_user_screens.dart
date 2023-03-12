import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qarzdaftar/provider/debtor_user_historys.dart';
import 'package:qarzdaftar/provider/debtor_users.dart';

import '../widget/debtor_user_info.dart';

class DebtorUserScreens extends StatelessWidget {
  const DebtorUserScreens({Key? key}) : super(key: key);
  static  const String  routName = "/xaridorlar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Xaridorlar Ro'yxati"),
      ),
      body: FutureBuilder(
        future: Provider.of<DebtorUsers>(context).getdebtoruserdatabase(), builder: ( context,  snapshot) {
          if(snapshot.connectionState ==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Consumer<DebtorUsers>(
            builder: (cnt, value,child){
              if(value.debtorUsers.isNotEmpty){
                return ListView.builder(itemBuilder: (cnt,index){
                  final debtoruser = value.debtorUsers[index];
                  final summDebtorUser = Provider.of<DebtorUserHistorys>(context).summDeb(debtoruser.id);
                  return  DebtorUserInfo( debtorUser: debtoruser, summ: summDebtorUser,);
                },
                  itemCount: value.debtorUsers.length,
                );
              }else {
                return const Center(child:Text("xaridorlar mavjud emas"));
              }

            }

          );
      },

      )
    );
  }
}
