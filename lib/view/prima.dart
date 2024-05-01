import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PrimeNumberPage extends StatefulWidget {
  @override
  _PrimeNumberPageState createState() => _PrimeNumberPageState();
}
class _PrimeNumberPageState  extends State<PrimeNumberPage> {

  TextEditingController _numberController = TextEditingController();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Icon(Icons.check, color: Colors.red),
            SizedBox(width: 8),
            Text(
              'Pengecek Bilangan Prima',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: HexColor("#1d3557"),
      ),

      body: Center(
        child: Container(
          width: screenSize.width * 0.8,
          height: screenSize.height * 0.6,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: HexColor("#1d3557"),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
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
              Text(
                "Pengecek Bilangan Prima",
                style: TextStyle(
                  color: HexColor("#f1faee"),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukan Angka',
                  prefixIcon: Icon(Icons.format_list_numbered),
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  String inputNumber = _numberController.text;
                  if (_isNumeric(inputNumber)) {
                    int number = int.tryParse(inputNumber) ?? 0;
                    setState(() {
                      _result = isPrime(number) ? 'Prima' : 'Bukan Prima';
                    });
                  }   else {
                    // Menampilkan pesan kesalahan jika input tidak valid
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Masukan hanya dapat berupa angka.'),
                          actions: [
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
                    // Mengosongkan input
                    _numberController.clear();
                  }
                },
                child: Text(
                  'Cek',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'Hasil: $_result',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isPrime(int number) {
    if (number <= 1) return false;
    if (number == 2 || number == 3) return true;
    if (number % 2 == 0 || number % 3 == 0) return false;
    int i = 5;
    while (i * i <= number) {
      if (number % i == 0 || number % (i + 2) == 0) return false;
      i += 6;
    }
    return true;
  }

  // Fungsi untuk memeriksa apakah sebuah string adalah angka
  bool _isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }
}
