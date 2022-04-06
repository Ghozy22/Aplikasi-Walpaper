import 'dart:html';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';


class showImage extends StatefulWidget {
  const showImage({ Key? key,required this.imageURL }) : super(key: key);

  final String imageURL;

  @override
  State<showImage> createState() => _showImageState();
}

class _showImageState extends State<showImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          Hero(
            tag: widget.imageURL,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(widget.imageURL, fit: BoxFit.cover,)
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget> [

                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Stack(
                    children: <Widget>[
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width/2,
                      color: Color(0xff1C1B1B).withOpacity(0.8),
                    ),
                    Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54, width: 1),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(colors: [Color(0x36FFFFFF),Color(0x0FFFFFFF)],)
                    ),
                    child: Column(                
                      children: <Widget> [
                        Text("Gunakan Wallpaper", style: TextStyle(fontSize: 16, color: Colors.white),),
                        Text("Gambar Akan di Simpan di Galeri", style: TextStyle(fontSize: 10, color: Colors.white),)
                      ],
                    ),
                  )
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                Text("Cancel", style: TextStyle(color: Colors.white),),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}