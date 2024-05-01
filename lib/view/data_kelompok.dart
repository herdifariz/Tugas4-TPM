import 'package:flutter/material.dart';

class GroupDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data Kelompok
    List<String> kelompokData = [
      'Herdi Andra Fata Rizqi (123210005)',
      'Rovino Alana Herlantoro (123210086)',
      'Vincentius Batista Rahma Bujana(123210179)',
      // Tambahkan nama kelompok lainnya di sini
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Icon kembali
          onPressed: () {
            Navigator.pop(context); // Kembali ke layar sebelumnya
          },
        ),
        title: Row(
          children: [
            Icon(Icons.call, color: Colors.red), // Icon kalkulator
            SizedBox(width: 8), // Jarak antara ikon dan teks
            Text(
              'Data Kelompok',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),

      backgroundColor: Colors.grey, // Warna latar belakang halaman
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/logo.jpg'), // Path ke gambar
            fit: BoxFit.cover, // Menutupi seluruh background
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6), // Memberi transparansi pada latar belakang
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 30, // Spasi antar kolom
                columns: [
                  DataColumn(
                    label: Container(
                      width: 100, // Lebar kolom
                      child: Text(
                        'No.',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 400, // Lebar kolom
                      child: Text(
                        'Nama Kelompok',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
                rows: List.generate(
                  kelompokData.length,
                      (index) => DataRow(cells: [
                    DataCell(
                      Text(
                        (index + 1).toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataCell(
                      Text(
                        kelompokData[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
