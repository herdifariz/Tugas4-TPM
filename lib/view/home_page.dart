import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'help_page.dart';
import 'login_page.dart';
import 'main_page.dart';

class HomePage extends StatefulWidget {
  final bool isLoggedIn;
  const HomePage({required this.isLoggedIn, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences logindata;
  late bool newuser;

  bool log = false;
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
      log = true;
      setState(() {});
    } else {
      logindata.setBool('login', true);
    }
  }

  void login() {}

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } else if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HelpPage()),
      );
    } else if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(loginCallback: login)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              'img/logo.jpg',
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      // _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: log ? 'Logout' : 'Login',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (!log && index == 0) {
            final snackBar = SnackBar(
              content: Text('Silakan login dahulu'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            setState(() {
              _selectedIndex = index;
            });
            _onItemTapped(index);
          }
        },
      ),
    );
  }
}
