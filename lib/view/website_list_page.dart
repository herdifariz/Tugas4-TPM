import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tugas2/data/website_list.dart';
import 'package:url_launcher/url_launcher.dart';

class WebsiteListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Situs Rekomendasi',
          style: TextStyle(
            color: HexColor("#f1faee"),
          ),
        ),
        backgroundColor: HexColor("#1d3557"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(WebsiteList.length, (index) {
          return GridItem(
            website: WebsiteList[index],
          );
        }),
      ),
    );
  }
}

class GridItem extends StatefulWidget {
  final Website website;

  const GridItem({Key? key, required this.website}) : super(key: key);

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              widget.website.imageUrl,
              // fit: BoxFit.fitHeight,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  widget.website.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _launchURL(widget.website.siteUrl);
                  },
                  child: Text('Open'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    widget.website.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: widget.website.isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.website.toggleFavorite();
                    });
                  },
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Tidak Bisa Membuka $url';
  }
}
