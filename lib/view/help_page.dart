import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            MenuItem(
              title: "Daftar Anggota",
              description: "Jika di klik akan memunculkan daftar nama anggota.",
            ),
            MenuItem(
              title: "Aplikasi Bilangan Prima",
              description:
                  "Terdapat Kolom untuk menginputkan bilangan, lalu klik tombol cek untuk menentukan bilangan prima atau bukan.",
            ),
            MenuItem(
              title: "Aplikasi Luas dan Keliling Segitiga",
              description:
                  "Terdapat 3 kolom untuk menginputkan ketiga sisi segitiga. Terdapat tombol hitung untuk menghitung luas dan keliling berdasarkan Panjang sisi yang diinputkan. Terdapat tombol reset untuk menghapus inputan.",
            ),
            MenuItem(
              title: "Daftar Situs Rekomendasi",
              description:
                  "Terdapat beberapa situs yang memiliki tombol open dan ikon love. Jika tombol open diklik maka akan diarahkan ke website sesuai dengan situs yang di klik. Jika ikon love ditekan maka akan menambahkan situs tersebut ke dalam daftar situs favorit.",
            ),
            MenuItem(
              title: "Favorite",
              description:
                  "Situs yang telah ditambahkan ke favorit akan masuk ke sini.",
            ),
            MenuItem(
              title: "Stopwatch",
              description:
                  "Terdapat 2 button untuk start atau pause dan untuk mereset timer.",
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final String description;

  const MenuItem({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
