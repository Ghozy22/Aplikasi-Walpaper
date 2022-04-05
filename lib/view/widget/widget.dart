import 'package:flutter/material.dart';
import 'package:wallpaper/model/wallpaper_model.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.black87, fontFamily: 'Overpass'),
      ),
      Text(
        "Hub",
        style: TextStyle(color: Colors.blue, fontFamily: 'Overpass'),
      )
    ],
  );
}

Widget ListWallpaper({required List<wallpaperModel> wpmodel, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: wpmodel.map((wallpaper){
        return GridTile(
          child: Container(
            child: Image.network(wallpaper.src!.portrait!),
          )
        );
      }).toList(),
    ),
  );
}