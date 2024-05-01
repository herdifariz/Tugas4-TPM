import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas2/view/home_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback loginCallback;

  LoginPage({Key? key, required this.loginCallback}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SharedPreferences logindata;
  late bool newuser;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    check_login();
  }

  void check_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      logindata.setBool('login', true);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomePage(isLoggedIn: true)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: new Icon(Icons.login),
          backgroundColor: HexColor("#1d3557"),
          title: new Center(
            child: new Text(
              "Login Bolo",
              style: new TextStyle(color: HexColor("#f1faee")),
            ),
          )),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Image.asset(
                  'img/logo.jpg',
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    prefixIcon: Icon(Icons.person),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: 300, // Menetapkan lebar maksimum form
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_usernameController.text == 'admin' &&
                      _passwordController.text == 'admin123') {
                    logindata.setBool(
                        'login', false); // Panggil callback di sini
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                isLoggedIn: true,
                              )),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Invalid username or password'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor("#1d3557"),
                    foregroundColor: HexColor("#f1faee")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
