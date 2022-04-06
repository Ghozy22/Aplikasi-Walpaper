import 'package:flutter/material.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/view/showImage_view.dart';


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
          child: GestureDetector(
            onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => showImage(
                        imageURL: wallpaper.src!.portrait!,
                      )),
            );
            },
            child: Hero(
              tag:  wallpaper.src!.portrait! ,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(wallpaper.src!.portrait!, fit: BoxFit.cover,)
                ),
              ),
            ),
          )
        );
      }).toList(),
    ),
  );
}