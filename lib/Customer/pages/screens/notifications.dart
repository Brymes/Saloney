import 'package:flutter/material.dart';
import 'package:starter_project/Customer/pages/utils/TextStyles.dart';
import 'package:starter_project/Customer/pages/utils/consts.dart';

class CustomerNotifications extends StatefulWidget {
  @override
  _CustomerNotificationsState createState() => _CustomerNotificationsState();
}

class _CustomerNotificationsState extends State<CustomerNotifications> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
        appBar: AppBar(
        // backgroundColor: kwhite,
         backgroundColor: Colors.red,
         leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: ()=>Navigator.pop(context),
        ),
        title: BoldText("My Notifications", 25, kblack),
    centerTitle: true,
    elevation: 0.0,
    ),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          notification(),
          notification(),
          notification(),
          notification()
        ],
      ),
    ));
  }

  Padding notification() {
    return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      height: 100,
      child: Card(

        elevation: 1,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BoldText("Lorem ipsum", 20.0, kblack),
                  Icon(Icons.more_horiz,size: 20.0,color: kblack,)
                ],
              ),
              NormalText("Lorem ipsum dolor sit amet, consectetur.",kgreyDark,16),
              NormalText("07,Mar at 15:30 pm",kdarkBlue,12),


            ],
          ),
        ),
      ),
    ),
  );
  }
}