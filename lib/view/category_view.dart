import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper/data/data.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper/view/widget/widget.dart';

class Kategori extends StatefulWidget {
  const Kategori({ Key? key,required this.namaKategori }) : super(key: key);

  final String namaKategori;

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {

    List<wallpaperModel> wpmodel = [];

      SearchWallpaper(String query) async {
      var response = await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=15&page=1"),
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
    SearchWallpaper(widget.namaKategori);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget> [
                SizedBox(
                  height: 16,
                ),
                ListWallpaper(wpmodel: wpmodel, context: context)
            ],
          ),
        ),
      ),
    
    );
  }
}