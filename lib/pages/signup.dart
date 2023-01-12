import 'package:flutter/material.dart';

import 'Login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool pwstate = true;
  bool pwstate2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 16),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Image.asset('assets/mountainelogo 3.png'),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: '',
                    color: Color.fromARGB(255, 0, 42, 255),
                    //fontWeight: bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Color.fromRGBO(255, 255, 255, 1),
                height: 50,
                //padding: EdgeInsets.all(5),
                child: TextField(
                  //controller: _name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    prefixIcon: Icon(Icons.mail),
                    labelStyle: TextStyle(
                      fontSize: 15,
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.white,
                // padding: EdgeInsets.all(5),
                // margin: EdgeInsets.all(10),
                height: 50,
                child: TextField(
                  obscureText: pwstate,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          pwstate = !pwstate;
                          //print(pwstate);
                        });
                      },
                      icon: Icon(
                          pwstate ? Icons.visibility : Icons.visibility_off),
                    ),
                    // onPressed: () {
                    //   // setState(() {
                    //   //   pwstate = !pwstate;},)

                    //     }),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    labelStyle: TextStyle(
                      fontSize: 15,
                    ),
                    labelText: 'Password',
                    hintText: '********',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.white,
                // padding: EdgeInsets.all(5),
                // margin: EdgeInsets.all(10),
                height: 50,
                child: TextField(
                  obscureText: pwstate2,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          pwstate2 = !pwstate2;
                          //print(pwstate);
                        });
                      },
                      icon: Icon(
                          pwstate2 ? Icons.visibility : Icons.visibility_off),
                    ),
                    // onPressed: () {
                    //   // setState(() {
                    //   //   pwstate = !pwstate;},)

                    //     }),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    labelStyle: TextStyle(
                      fontSize: 15,
                    ),
                    labelText: 'Confirm Password',
                    hintText: '*********',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                // height: 50,
                // width: 300,
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    //or OutlinedButton
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Login1();
                        }),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 31, 75, 220),
                      //minimumSize:  ,
                    ),
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
