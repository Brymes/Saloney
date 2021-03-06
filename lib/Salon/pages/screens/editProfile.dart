import 'package:flutter/material.dart';
import 'package:starter_project/Salon/pages/screens/profile.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:starter_project/Salon/pages/screens/service_provider.dart';
import 'package:starter_project/ui_helpers/widgets/image_picker_ui_assets.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  //  File _image;
  String _selected;
  List<Map> _myJson = [
    {'value': false, "name": "Hair"},
    {'value': false, "name": "Beauty"},
    {'value': false, "name": "Spa"},
  ];
  bool showPassword = false;
  bool checkboxValue = false;

  // FIXME New Code
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController salonName = TextEditingController();
  TextEditingController salonDescription = TextEditingController();
  TextEditingController salonLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ServiceProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ProfilePage()));
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Text(
                  "Edit Salon Profile",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/customer.png",
                                ))),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Color(0xff9477cb),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                TabBar(
                  indicatorColor: Color(0xff9477cb),
                  labelColor: Color(0xff9477cb),
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    Tab(
                      text: 'GENERAL',
                    ),
                    Tab(text: 'SALON'),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * .5,
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              buildTextField("Username", false, username),
                              buildTextField("E-mail", false, email),
                              buildTextField(
                                  "Phone Number ", false, phoneNumber),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //FIXME
                                  OutlineButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed:
                                        () {}, // FIXME Return to profile page
                                    child: Text("CANCEL",
                                        style: TextStyle(
                                            fontSize: 14,
                                            letterSpacing: 2.2,
                                            color: Colors.black)),
                                  ),
                                  //FIXME
                                  RaisedButton(
                                    onPressed: () {},
                                    color: Color(0xff9477cb),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      "SAVE GENERAL",
                                      style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 2.2,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTextField(
                                  "Name of Salon ", false, salonName),
                              buildTextField(
                                  "Description", false, salonDescription),
                              buildTextField("Location", false, salonLocation),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Select Images for Products:",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(16),
                                child: Center(
                                  child: Wrap(
                                    children: [
                                      for (int i = 0;
                                          i <= model.salonProfileImages.length;
                                          i++)
                                        i == model.salonProfileImages.length
                                            ? AddImageButton(
                                                onTap: () => model
                                                    .addSaloonProfileImage(),
                                              )
                                            : ImageView(
                                                image:
                                                    model.salonProfileImages[i],
                                                onTap: () => model
                                                    .deleteSaloonProfileImage(
                                                        index: i),
                                              ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                "Select Category(ies)",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _myJson.length,
                                itemBuilder: (context, i) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(_myJson[i]["name"])),
                                    Checkbox(
                                        value: _myJson[i]["value"],
                                        onChanged: (val) {
                                          setState(() {
                                            _myJson[i]["value"] = val;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OutlineButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed:
                                        () {}, // FIXME Return to profile page
                                    child: Text("CANCEL",
                                        style: TextStyle(
                                            fontSize: 14,
                                            letterSpacing: 2.2,
                                            color: Colors.black)),
                                  ),
                                  RaisedButton(
                                    onPressed: () {},
                                    color: Color(0xff9477cb),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      "SAVE SALON",
                                      style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 2.2,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),

                // buildTextField("Password", "****", true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, bool isPasswordTextField,
      TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            // hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
