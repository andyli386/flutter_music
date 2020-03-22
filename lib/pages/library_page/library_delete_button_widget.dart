import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';



class LibraryDeleteButtonWidget extends StatelessWidget {
  LibraryDeleteButtonWidget({
    Key key,
    this.selected : false,

  }): super(key : key);

  final  selected;
  @override
  Widget build(BuildContext context) {
    print("LibraryDeleteButtonWidget");
    return Container(
      color: MusicStore.Theme.of(context).theme,
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: ScreenAdapter.setHeight(180),
      margin: EdgeInsets.only(left: 0,right: 20,top: 10,bottom: 10),
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Container(
        width: ScreenAdapter.setWidth(30),
        height:  ScreenAdapter.setHeight(30),
        margin: EdgeInsets.only(left: 5),
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Container(
          width: ScreenAdapter.setWidth(20),
          height: ScreenAdapter.setWidth(20),
          decoration: BoxDecoration(
              color: selected == false ? Colors.white : Colors.red,
              borderRadius: BorderRadius.circular(5)
          ),

        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenAdapter.setWidth(15)),
            color: MusicStore.Theme
                .of(context)
                .theme,
            boxShadow: [
              BoxShadow(color: MusicStore.Theme.of(context).shadowColor,
                  spreadRadius: 2,
                  offset: Offset(3, 3), blurRadius: 7),
              BoxShadow(
                  color: Colors.white, offset: Offset(-3, -3), blurRadius: 7)

            ],
            gradient:LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                MusicStore.Theme.of(context).shadowColor,
                Colors.white
              ],

            )
        ),
      ),
    );
  }
}


