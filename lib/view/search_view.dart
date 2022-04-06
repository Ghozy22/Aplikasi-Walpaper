import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper/data/data.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/view/widget/widget.dart';
import 'package:http/http.dart' as http;


class Search extends StatefulWidget {
  const Search({ Key? key,required this.searchKey }) : super(key: key);

  final String searchKey;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  List<wallpaperModel> wpmodel = [];

  TextEditingController searchController = new TextEditingController();

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
    SearchWallpaper(widget.searchKey);
    super.initState();
    searchController.text = widget.searchKey;
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
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: (){
                            SearchWallpaper(searchController.text);
                          },
                        child: Container(
                          child: Icon(Icons.search)
                        )
                      )
                    ],
                  ),
                ),
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