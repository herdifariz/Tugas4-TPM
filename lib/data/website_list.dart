class Website {
  String name;
  String imageUrl;
  String siteUrl;
  bool isFavorite;

  Website({
    required this.name,
    required this.imageUrl,
    required this.siteUrl,
    required this.isFavorite,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}

var WebsiteList = [
  Website(
    name: "YouTube",
    imageUrl:
    "https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png",
    siteUrl: "http://www.youtube.com",
    isFavorite: false,
  ),
  Website(
    name: "Netflix",
    imageUrl:
    "https://images.ctfassets.net/y2ske730sjqp/5QQ9SVIdc1tmkqrtFnG9U1/de758bba0f65dcc1c6bc1f31f161003d/BrandAssets_Logos_02-NSymbol.jpg?w=940",
    siteUrl: "http://www.netflix.com",
    isFavorite: false,
  ),
  Website(
    name: "Disney Plus",
    imageUrl:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNAoWbrAeFrSXtqCufzi1ZvlhJJ16KKj1g9kUvZga3kQ&s",
    siteUrl: "http://www.disneyplus.com",
    isFavorite: false,
  ),
  Website(
    name: "IMDb",
    imageUrl:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/IMDB_Logo_2016.svg/2560px-IMDB_Logo_2016.svg.png",
    siteUrl: "http://www.imdb.com",
    isFavorite: false,
  ),
  Website(
    name: "Prime Video",
    imageUrl:
    "https://static.vecteezy.com/system/resources/previews/019/766/188/non_2x/prime-video-logo-prime-video-icon-transparent-logo-free-png.png",
    siteUrl: "http://www.primevideo.com",
    isFavorite: false,
  ),
  Website(
    name: "Crunchyroll",
    imageUrl:
    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Crunchyroll_Logo.png/640px-Crunchyroll_Logo.png",
    siteUrl: "http://www.crunchyroll.com",
    isFavorite: false,
  ),
  Website(
    name: "Hulu",
    imageUrl:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQwyhlm7AmSsV6QWS1ubq6l50XZl4IxvMsDCpJm44d5w&s",
    siteUrl: "http://www.hulu.com",
    isFavorite: false,
  ),
];
