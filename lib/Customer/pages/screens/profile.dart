import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_project/Customer/pages/utils/TextStyles.dart';
import 'package:starter_project/Customer/pages/utils/consts.dart';
import 'package:starter_project/core/repositories/authentication_repository.dart';

import '../../../home_screen.dart';

class CustomerProfile extends StatefulWidget {
  @override
  _CustomerProfileState createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        title: BoldText("Profile", 25, kblack),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: kgreyDark,
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 50,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      BoldText("Naza Sudu", 20.0, kblack),
                      Row(
                        children: <Widget>[
                          NormalText("Lekki,Nigeria", kgreyDark, 16),
                          Icon(
                            Icons.location_on,
                            color: kgreyDark,
                            size: 15.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 2,
              color: kgreyFill,
            ),
            ProfileItem(Icons.person, "My Informations"),
            ProfileItem(Icons.credit_card, "Payment"),
            ProfileItem(Icons.settings, "Settings"),
            ProfileItem(Icons.help, "Help"),
            ProfileItem(Icons.favorite_border, "Favourite"),
            ProfileItem(Icons.library_books, "Terms and Conditions"),
            ProfileItem(Icons.info, "About Us "),
            ProfileItem(
              Icons.exit_to_app,
              "Sign Out",
              onPressed: () async {
                bool success =
                    await Provider.of<AuthRepository>(context).logout();

                if (success) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ProfileItem(IconData icon, String text, {Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 9),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: kdarkBlue,
              size: 40,
            ),
            SizedBox(
              width: 8,
            ),
            NormalText(text, kblack, 20.0)
          ],
        ),
      ),
    );
  }
}
