import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class TrianglePage extends StatefulWidget {
  @override
  _TrianglePageState createState() => _TrianglePageState();
}

class _TrianglePageState extends State<TrianglePage> {
  TextEditingController _sideALengthController = TextEditingController();
  TextEditingController _sideBLengthController = TextEditingController();
  TextEditingController _sideCLengthController = TextEditingController();

  double _area = 0;
  double _perimeter = 0;

  void _calculate() {
    // Memeriksa apakah semua input telah diisi
    if (_sideALengthController.text.isEmpty ||
        _sideBLengthController.text.isEmpty ||
        _sideCLengthController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Peringatan'),
            content: Text('Semua sisi harus diisi.'),
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
      return;
    }

    double sideA = double.tryParse(_sideALengthController.text) ?? 0;
    double sideB = double.tryParse(_sideBLengthController.text) ?? 0;
    double sideC = double.tryParse(_sideCLengthController.text) ?? 0;

    // Memeriksa apakah sisi c digunakan
    if (sideC != 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Peringatan'),
            content: Text(
                'Luas hanya menggunakan sisi a dan b sebagai alas dan tinggi, sisi c tidak digunakan.'),
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
    }

    // Menghitung luas segitiga
    _area = 0.5 * sideA * sideB;

    // Menghitung keliling segitiga
    _perimeter = sideA + sideB + sideC;

    setState(() {});
  }

  void _reset() {
    _sideALengthController.clear();
    _sideBLengthController.clear();
    _sideCLengthController.clear();
    _area = 0;
    _perimeter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#1d3557"),
        title: Text('Luas dan Keliling Segitiga',
            style: TextStyle(color: HexColor("#f1faee"))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Container(
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
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _sideALengthController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9.]')), // Hanya izinkan angka dan titik
                  ],
                  style: TextStyle(
                      color: Colors.white), // Menetapkan warna teks putih
                  decoration: InputDecoration(
                    labelText: 'Panjang Sisi A',
                    labelStyle: TextStyle(
                        color: Colors.white), // Menetapkan warna label putih
                  ),
                ),
                SizedBox(height: 10), // Menambahkan jarak antara TextField
                TextField(
                  controller: _sideBLengthController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9.]')), // Hanya izinkan angka dan titik
                  ],
                  style: TextStyle(
                      color: Colors.white), // Menetapkan warna teks putih
                  decoration: InputDecoration(
                    labelText: 'Panjang Sisi B',
                    labelStyle: TextStyle(
                        color: Colors.white), // Menetapkan warna label putih
                  ),
                ),
                SizedBox(height: 10), // Menambahkan jarak antara TextField
                TextField(
                  controller: _sideCLengthController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9.]')), // Hanya izinkan angka dan titik
                  ],
                  style: TextStyle(
                      color: Colors.white), // Menetapkan warna teks putih
                  decoration: InputDecoration(
                    labelText: 'Panjang Sisi C',
                    labelStyle: TextStyle(
                        color: Colors.white), // Menetapkan warna label putih
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _calculate,
                      child: Text('Hitung'),
                    ),
                    ElevatedButton(
                      onPressed: _reset,
                      child: Text('Reset'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Luas Segitiga: $_area',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  'Keliling Segitiga: $_perimeter',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _sideALengthController.dispose();
    _sideBLengthController.dispose();
    _sideCLengthController.dispose();
    super.dispose();
  }
}
