import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tugas2/data/website_list.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Website> favoriteList =
        WebsiteList.where((website) => website.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Situs Favorit',
            style: TextStyle(
              color: HexColor("#f1faee"),
            )),
        backgroundColor: HexColor("#1d3557"),
      ),
      body: favoriteList.isNotEmpty
          ? ListView.builder(
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    favoriteList[index].imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(favoriteList[index].name),
                  // onTap: () {
                  //   _launchURL(favoriteList[index].siteUrl);
                  // },
                );
              },
            )
          : Center(
              child: Text('Tidak ada situs favorit.'),
            ),
    );
  }
}
