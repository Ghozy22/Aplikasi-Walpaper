import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper/data/data.dart';
import 'package:wallpaper/model/kategori_model.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/view/widget/widget.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<kategori> kategoris = [];

  List<wallpaperModel> wpmodel = [];

  TrendingWallpaper() async {
    var response = await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=1"),
      headers: {
        "Authorization" : apiKey
      }
    );
      
      //print(response.body.toString());

      Map<String, dynamic> jsonData = jsonDecode(response.body);
      jsonData["photos"].forEach((element){
      // print(element);
      wallpaperModel WallpaperModel = new wallpaperModel();
      WallpaperModel = wallpaperModel.fromMap(element);
      wpmodel.add(WallpaperModel);
    });

    setState(() {
      
    });

  }

  @override
  void initState() {
    TrendingWallpaper();
    kategoris = getKategori();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: <Widget> [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  Icon(Icons.search)
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 80,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: kategoris.length,
                itemBuilder: (context, index){
                  return TileKategori(
                    imageURL: kategoris[index].imagURL.toString(),
                    title: kategoris[index].NamaKategori.toString());
                }
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ListWallpaper(wpmodel: wpmodel, context: context)
          ],
        ),
      ),
    );
  }
}

class TileKategori extends StatelessWidget {

  final String imageURL, title; 

  TileKategori({required this.imageURL,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      child: Stack(
        children: <Widget> [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imageURL, height: 50, width: 100, fit: BoxFit.cover,)
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(8)
            ),
            height: 50, width: 100,
            alignment: Alignment.center,
            child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),),
          )
        ],
      ),
    );
  }
}

