import 'package:final_project/models/login_post.dart';
import 'package:final_project/pages/home.dart';
import 'package:final_project/pages/signup.dart';
import 'package:final_project/services/network.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  bool pwstate = true;
  bool remem_state = false;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final ;

  @override
  void initState() {
    _loadUserPhonePassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: //use SingleChildScrollView or ListView
            Form(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 16),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/mountainelogo 3.png'),
                Container(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  height: 50,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      prefixIcon: Icon(Icons.person),
                      labelStyle: TextStyle(
                        fontSize: 15,
                      ),
                      labelText: 'Email',
                    ),
                  ),
                ),
                //2nd row
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  height: 50,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: pwstate,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            pwstate = !pwstate;
                          });
                        },
                        icon: Icon(
                            pwstate ? Icons.visibility : Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      labelStyle: TextStyle(
                        fontSize: 15,
                      ),
                      labelText: 'Password',
                      hintText: '*************',
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        child: Row(
                      children: [
                        Theme(
                          data: ThemeData(
                              unselectedWidgetColor: Color.fromARGB(
                                  255, 123, 126, 126) // Your color
                              ),
                          child: Checkbox(
                              activeColor: Color.fromARGB(255, 86, 86, 86),
                              value: remem_state,
                              onChanged: _handleRememberme),
                        ),
                        Text(
                          "Remember Me",
                          //textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 23, 22, 22),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 35,
                      child: TextButton(
                        //or OutlinedButton
                        onPressed: () {},
                        child: Text(
                          "Forget Password?",
                          //textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 23, 22, 22),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    //or OutlinedButton
                    onPressed: () async {
                      var phoneData = phoneController.text.toString();
                      var passwordData = passwordController.text.toString();
                      //9849203704
                      //Nepal@12344

                      Login logindata = await NetworkHelper().getLogin(
                        phone: phoneData,
                        password: passwordData,
                      );

                      var status = logindata.status;
                      print(status);

                      if (status == 'success') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Homepage();
                        }));
                      } else {
                        print('error');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 4, 21, 250),
                      //minimumSize:  ,
                    ),
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(
                  height: 50,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 10, 10, 10),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: TextButton(
                        //or OutlinedButton
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Signup();
                            }),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 0, 115, 255)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        backgroundColor: Colors.black,
        //tooltip: 'Increment',
        child: Icon(Icons.message),
      ),
    );
  }

  void _loadUserPhonePassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _phone = _prefs.getString("phone") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      print(_remeberMe);
      print(_phone);
      print(_password);
      if (_remeberMe) {
        setState(() {
          remem_state = true;
        });
        phoneController.text = _phone;
        passwordController.text = _password;
      }
    } catch (e) {
      print(e);
    }
  }

  void _handleRememberme(bool? value) {
    remem_state = value!;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('phone', phoneController.text);
        
        prefs.setString('password', passwordController.text);
      },
    );
    setState(() {
      remem_state = value;
      print(phoneController.text);
    });
  }
}
