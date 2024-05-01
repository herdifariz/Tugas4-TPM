import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tugas2/view/prima.dart';
import 'package:tugas2/view/segitiga.dart';
import 'package:tugas2/view/stopwatch.dart';
import 'package:tugas2/view/website_list_page.dart';
import 'data_kelompok.dart';
import 'favorite_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Halaman Utama',
          style: TextStyle(
            color: HexColor("#f1faee"),
          ),
        ),
        backgroundColor: HexColor("#1d3557"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildMenuItem(context, 'Daftar Anggota', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GroupDataPage()),
              );
            }),
            _buildMenuItem(context, 'Aplikasi Menampilkan Bilangan Prima', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrimeNumberPage()),
              );
            }),
            _buildMenuItem(
                context, 'Aplikasi Penghitung Luas dan Keliling Segitiga', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrianglePage()),
              );
            }),
            _buildMenuItem(context, 'Daftar Situs Rekomendasi', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WebsiteListPage()),
              );
            }),
            _buildMenuItem(context, 'Favorite', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritePage()),
              );
            }),
            _buildMenuItem(context, 'Stopwatch', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StopwatchPage()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          foregroundColor: HexColor("#f1faee"),
          backgroundColor: HexColor("#1d3557"),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size.fromHeight(80)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
