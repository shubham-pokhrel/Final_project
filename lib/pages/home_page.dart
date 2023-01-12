import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  var _phone;

  @override
  void initState() {
    // TODO: implement initState
    get_data();
    super.initState();
  }

  void get_data() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _phone = _prefs.getString("phone") ?? "";
    print(_phone);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 23, 22, 22),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Container(
              child: Row(
                children: [
                  Text(
                    'Good Afternoon, $_phone',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 23, 22, 22),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
