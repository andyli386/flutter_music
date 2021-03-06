import 'package:flutter/material.dart';
import 'package:flutter_music/common/music_store.dart';

class MusicPlaySliderWidget extends StatefulWidget {
  @override
  _MusicPlaySliderWidgetState createState() => _MusicPlaySliderWidgetState();
}

class _MusicPlaySliderWidgetState extends State<MusicPlaySliderWidget> {

  double changeValue = 0.0;
  bool startSlider = false;
  MusicGlobalPlayListState musicGlobalPlayListState;
  @override
  Widget build(BuildContext context) {
    musicGlobalPlayListState =  MusicStore.MusicPlayList(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
      child: Column(
        children: <Widget>[
          _slider(context),
          _time(context)
        ],
      ),
    );
  }
  
  Widget _time(context){

    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          /// 当前时间
          Selector<MusicGlobalPlayListState,String>(
            builder: (context,positionText,_){

              return Text(positionText,style: TextStyle(fontSize: 12,color: Color.fromRGBO(165, 171, 191, 1.0)));
            },
            selector: (context,state){
              return state.positionText;
            },
            shouldRebuild: (pre,next){
              return pre != next;
            },
          ),
        /// 总时长
          Selector<MusicGlobalPlayListState,String>(
            builder: (context,durationText,_){

              return Text(durationText,style: TextStyle(fontSize: 12,color: Color.fromRGBO(165, 171, 191, 1.0)));
            },
            selector: (context,state){
              return state.durationText;
            },
            shouldRebuild: (pre,next){
              return pre != next;
            },

          )

        ],
      ),
    );
  }

  Widget _slider(context){
    return SliderTheme(

      data: SliderTheme.of(context).copyWith(
        activeTrackColor: MusicStore.Theme(context).sliderColor,
        inactiveTrackColor: MusicStore.Theme(context).bottomShadowColor,
        trackHeight: 3,
        overlayColor:MusicStore.Theme(context).sliderOverlayColor,
        thumbColor:MusicStore.Theme(context).sliderThemeColor,
        overlayShape:RoundSliderOverlayShape(//可继承SliderComponentShape自定义形状
          overlayRadius: 10, //滑块外圈大小

        ),
        thumbShape: RoundSliderThumbShape(//可继承SliderComponentShape自定义形状
          disabledThumbRadius: 5, //禁用是滑块大小
          enabledThumbRadius: 5, //滑块大小
        ),

      ),
      child: Selector<MusicGlobalPlayListState,double>(
        builder: (context,progress,_){

         if(startSlider == false){
           changeValue = progress;
         }

          return  Slider(
            onChangeStart: (double){
              startSlider = true;

            },
            onChangeEnd: (double value){

              musicGlobalPlayListState.music_seek(value);

              startSlider = false;

            },
            onChanged: (double value) {

              setState(() {
                changeValue = value;
              });


            },
            value: changeValue,
          );
        },
        selector: (context,state){
          return state.playProgress;
        },
        shouldRebuild: (pre,next){
          return pre != next;
        },
      )

    );
  }
}

