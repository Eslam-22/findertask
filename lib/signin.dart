import 'package:findertask/favourite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:findertask/constantcolors.dart';
import 'package:findertask/customtext.dart';
import 'package:findertask/login.dart';

import 'models/emailresult.dart';

class Sign_in extends StatefulWidget {
  @override
  _Sign_inState createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  Future<EmailResult> emailfetch  ;
  final myController = TextEditingController();
  AnimationController animationController;

  void initState() {
    super.initState();


  }
  @override
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kmaincolor,
        body: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.38,
              child: Image(
                image: AssetImage('images/women.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 10, 0, 0),
                      child: Text(
                        'Welcome to Finders !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(65, 0, 5, 0),
                      child:
                          Image(image: AssetImage('images/downcircular.png')),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'First time on Finders App? You "ll need to create new',
                  textDirection: TextDirection.ltr,
                  // textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'account. if you "ve logged in before, we "ll find you.',
                  textDirection: TextDirection.ltr,
                  // textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 10, 0, 0),
              child: Text(
                'Email Address',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 40,
                      child: Form(
                          key: _globalKey,

                          child: CustomTextField('Email Adress', Icons.email,
                            myController
                          )
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 30,
                      child: FutureBuilder<EmailResult>(
                          builder: (context, snapshot) {
                            return FlatButton(
                              color: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              onPressed: (){
                                if (_globalKey.currentState.validate() ) {
                                  print(' fetch email ');
                                  print(myController.text);
                                  emailfetch = fetchemail(myController.text);
                                  emailfetch.then((data)=>{
                                    if (data.status.code == 200){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login( email : myController.text))),
                                    }
                                  });
                                  return CircularProgressIndicator();
                                }

                              },
                              child:Icon(
                                Icons.arrow_forward,
                                  color: Colors.white,

                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '_________________or continue with________________',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image(
                            image: AssetImage('images/facebook.png'),
                            width: 30,
                            height: 30,
                          ),
                          Text(
                            'FACEBOOK',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image(
                            image: AssetImage('images/google.png'),
                            width: 25,
                            height: 25,
                          ),
                          Text(
                            'GOOGLE',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'CONTINUE AS A GUEST',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Ubuntu', fontSize: 16, color: Colors.black),
            ),
          ],
        ));
  }
}
