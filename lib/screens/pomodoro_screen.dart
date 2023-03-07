import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({Key? key}) : super(key: key);

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {

  static const twentyFiveMinutes = 1500;
  //흘러갈 토탈 초
  int totalSeconds = twentyFiveMinutes;
  //현재 running 상태체크
  bool isRunning = false;
  //나중에 초기화시킨다 late
  late Timer timer;
  //카운터
  int totalPomodoros = 0;


  //실시간변동 total초가 1씩 마이너스된다.
  void onTick(Timer timer){
    //totalSeconds가 0으로 되었을 때
    if(totalSeconds == 0) {
      setState(() {
        //카운터1올리고, 런닝을 false로
        //그리고나서 초 초기화
        totalPomodoros = totalPomodoros +1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      //초기화 된것처럼 보이니 timer동작을 취소시켜줘야함..
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds-1;
      });
    }
  }

  //누르면 timer 가 Timer.periodic옵션으로
  //Duration seconds1 초씩 onTick이라는 메서드를 실행시킨다.
  void onStartPressed() {
    timer = Timer.periodic(
      Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed(){
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed(){
    setState(() {
    timer.cancel();
    totalSeconds=twentyFiveMinutes;
    isRunning = !isRunning;

    });
  }

  String format(int seconds){
    //duration을 담아주면 시간:분:초 로 나온다.
    var duration = Duration(seconds: seconds);
    //리턴값을 듀레이션에서 toString으로 리턴시켜주고
    //.split값을 짜른다. 그리고 짜른기점에서 앞에부분을 가져오고
    //앞에 부분에서 0,1번째는 필요가 없으니 2-7번째를 가져온다.
    print(duration.toString());
    return duration.toString().split(".").first.substring(2,7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          //flexible은 ui 비율에 따라 유연하게 해준다.
          Flexible(
            flex: 1,
            child:
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          //34줄 두번째 플렉시블
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: IconButton(
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Transform.scale(
                      scale: 7,
                      child: Icon(
                        isRunning
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outline,
                        size: 20,
                        color: Theme.of(context).cardColor,
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 70,),
                Center(
                  child: IconButton(
                    onPressed: onResetPressed,
                    icon: Transform.scale(
                      scale: 3,
                      child: Icon(
                        Icons.loop_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //53줄 3번째 플렉시블
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).textTheme.headline1?.color
                          ),
                        ),
                        Text('$totalPomodoros',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline1?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
