import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';
import 'package:flutter_music/music_app_bar/music_app_bar.dart';

import 'package:flutter_music/library/new_library/new_library_title_widget.dart';

class NewLibraryPage extends StatefulWidget {
  @override
  _NewLibraryPageState createState() => _NewLibraryPageState();
}

class _NewLibraryPageState extends State<NewLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MusicStore.Theme.of(context).theme,
      appBar: MusicAppBar(
        leftIconData: Icons.arrow_back_ios,
        rightIconData: Icons.check,
        leftOnTap: (){
          Navigator.of(context).pop();
        },
        title: "新建歌单",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            _icon(context)
          ],
        ),
      )
    );
  }


  Widget _icon2(BuildContext context) {
    return Container(

      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MusicStore.Theme
              .of(context)
              .theme,
          boxShadow: [
            BoxShadow(color: MusicStore.Theme
                .of(context)
                .shadowColor,
                spreadRadius: 2,
                offset: Offset(10, 10), blurRadius: 20),
            BoxShadow(
                color: Colors.white, offset: Offset(-10, -10), blurRadius: 20)
          ]
      ),
      child: Icon(Icons.play_arrow, size: 20, color: MusicStore.Theme
          .of(context)
          .titleColor),
    );
  }

  Widget _icon(BuildContext context) {
    return Container(

      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      padding:EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: MusicStore.Theme.of(context).theme,width: 1),
          color: MusicStore.Theme
              .of(context)
              .theme,
        boxShadow: [
          BoxShadow(color: MusicStore.Theme
              .of(context)
              .shadowColor,
              spreadRadius: 2,
              offset: Offset(10, 10), blurRadius: 10),
          BoxShadow(
              color: Colors.white, offset: Offset(-10, -10), blurRadius: 10)
        ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
               MusicStore.Theme.of(context).shadowColor,

                Colors.white
              ],


          )
      ),
      child: Icon(Icons.play_arrow, size: 20, color: MusicStore.Theme
          .of(context)
          .titleColor),
    );
  }
}

