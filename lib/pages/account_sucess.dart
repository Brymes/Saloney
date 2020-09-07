import 'package:flutter/material.dart';
class AccountSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: SafeArea(
              child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,  
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        
                           
                            Text(
                              "Account created successfully",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                        SizedBox(
                          height: 300,
                        ),
                      
                            Text(
                              "We just sent you a verification email",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[700]),
                            ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      // child: Column(
                      //   children: <Widget>[
                      //     makeInput(hint: "Email Address"),
                          
                      //     Container(
                      //         child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: <Widget>[
                      //         ],
                      //     ))
                      //   ],
                      // ),
                    ),
                         Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        height: 60,
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                color: Color(0xfff3236e),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "Get Started",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white),
              ),
                      ),
                    ),
                  
                  
                  ],
                ),
              ),
            
            ],
          ),
        ),
      ));
    
  }
}