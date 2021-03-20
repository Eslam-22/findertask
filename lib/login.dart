import 'package:findertask/favourite.dart';
import 'package:findertask/models/passwordresult.dart';
import 'package:findertask/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:findertask/favourite.dart';
import 'package:findertask/customtext.dart';
import 'package:findertask/constantcolors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
  final String email;
   Login({Key key, @required this.email}) : super(key: key);   //recive email from sign in


}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool hidepassword = true;
  TextEditingController passController = new TextEditingController();
  Future<PasswordResult> passwordfetch;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kmaincolor,
      body: ListView(
        children: <Widget>[
          Row(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      child: Image(
                        image: AssetImage('images/xlogo.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 1),
                      child: Image(
                        image: AssetImage('images/finder.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nice to see you again',
                    style: TextStyle(
                      fontFamily: 'Ubuntu-Bold',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Ente your password to sign in',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, top: 30),
            child: Text(
              'Password',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Ubuntu-Bold',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
                height: 50,
                width: 150,
                child: Form(
                  key: _globalKey,
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passController,
                     obscureText: true,
                    validator: (value) {
                      if (value.length < 3) {
                        return 'passowrd is short';
                      }
                      if (value.isEmpty) {
                        return "password is empty";
                      }
                    },

                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Pacifico',
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.left,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(
                        hidepassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      hintText: 'Enter your password',
                      //prefixIcon: Icon(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  // child: CustomTextField('Password',
                  //
                  //     hidepassword ? Icons.visibility : Icons.visibility_off,
                  // ),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 80,
            width: 200,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: FutureBuilder<PasswordResult>(
                builder: (context, snapshot) {
                  return FlatButton(
                  onPressed: () {
                  if (_globalKey.currentState.validate()) {
                    print('done');
                    print(passController.text);
                    passwordfetch = fetchpassword(passController.text,widget.email);
                    passwordfetch.then((data)=>{
                      print(data.status.code),
                      if (data.status.code == 200){
                        print('done donee'),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Favourit())),

                      }
                      else {
                        print('invalid eeeeeeeeeeeeeeeeeeeemail')
                      }
                    });
                  }
                  return CircularProgressIndicator();
                },
                child: Text("Sign in",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                color: kbutton,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),
          ),
          Text(
            'FORGOT PASSWORD',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Ubuntu-Bold',
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
