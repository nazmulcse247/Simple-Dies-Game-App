import 'dart:math';

import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _score = 0;
  int _highestScore = 0;
  int _diesSum = 0;
  var _diesList = <String>[
    'assets/images/d1.png',
    'assets/images/d2.png',
    'assets/images/d3.png',
    'assets/images/d4.png',
    'assets/images/d5.png',
    'assets/images/d6.png',
  ];
  int _firstIndex = 0;
  int _secondIndex = 0;
  var _randomNumber = Random.secure();
  bool _isGameOver = false;
  bool _isRestart = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
           Text(
            'Score:$_score',
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Highest Score:$_highestScore',
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                _diesList[_firstIndex],
                height: 100,
                width: 100,
              ),
              Image.asset(
                _diesList[_secondIndex],
                height: 100,
                width: 100,
              )

            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Dies Sum: $_diesSum',
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),
          ),
          const SizedBox(
            height: 30,
          ),
          if(_isGameOver)
            Text(
              'Game over:',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, color: Colors.red),
            ),

          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: rollTheDies,
                      child: Text(
                          'Roll',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)
                      )
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),

              if(_isRestart)
                InkWell(
                onTap: restartBtn,
                child: Icon(
                  Icons.restart_alt,
                  size: 40,

                ),
              )
            ],
          )

        ],
      ),
    );
  }

  void rollTheDies() {

    setState(() {
      _firstIndex = _randomNumber.nextInt(6);
      _secondIndex = _randomNumber.nextInt(6);

      _diesSum = _firstIndex + _secondIndex + 2;
      _score += _diesSum;




      if(_diesSum == 8){
        _isGameOver = true;
        _isRestart = true;


        if(_highestScore < _score){
          _highestScore = _score;
          //_highestScore = _score;
        }
      }
    });
  }

  void restartBtn() {

   setState(() {
     _isRestart = false;
     _score = 0;
     _firstIndex = 0;
     _secondIndex = 0;
     _diesSum = 0;
     _isGameOver = false;
   });

  }
}
