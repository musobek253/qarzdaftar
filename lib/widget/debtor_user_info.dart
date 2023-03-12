import 'package:flutter/material.dart';
import 'package:qarzdaftar/model/debtor_user.dart';
import 'package:qarzdaftar/widget/add_history_user_Modal.dart';

class DebtorUserInfo extends StatefulWidget {
  const DebtorUserInfo({Key? key, required this.debtorUser, required this.summ}) : super(key: key);
  final DebtorUser debtorUser;
  final int summ;

  @override
  State<DebtorUserInfo> createState() => _DebtorUserInfoState();
}

class _DebtorUserInfoState extends State<DebtorUserInfo> {
  void showmodalechange(BuildContext context){
     showModalBottomSheet(context: context, builder: (cnt){
      return AddHistoryUserModal(debtorUser:widget.debtorUser);
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    backgroundColor: Colors.white,
    isScrollControlled: true,
    isDismissible: true,
    ).then((value){
      if(value==null){
        setState(() {
          value = null;
        });
      }
     });
     
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.all(),
      child: ListTile(
        onTap: (){
           showmodalechange(context);

        },
        leading: CircleAvatar(
          backgroundColor: widget.debtorUser.summ < 0 ? Colors.red : Colors.green,
        ),
        title: Text(widget.debtorUser.name),
        subtitle: Text(widget.debtorUser.phoneNumber),
        trailing: Text("${widget.summ}"),
      ),
    );
  }

}
