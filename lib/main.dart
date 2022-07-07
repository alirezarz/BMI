import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(BMI());

class BMI extends StatelessWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _heightControler = TextEditingController();

  TextEditingController _weightControler = TextEditingController();

  double _bmiResult = 0;

  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.yellow, fontSize: 13.0),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black,
                  height: 90.0,
                  width: 130.0,
                  child: TextField(
                    controller: _heightControler,
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 35.0,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                        fontSize: 35.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  height: 90.0,
                  width: 130.0,
                  child: TextField(
                    controller: _weightControler,
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 35.0
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Weight',
                      hintStyle: TextStyle(
                        fontSize: 35.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: (){
                double height = double.parse(_heightControler.text);
                double weight = double.parse(_weightControler.text);
                setState((){
                  _bmiResult = weight / (height * height);
                  if(_bmiResult > 25){
                    _textResult = "Over Weight";
                  }else if(_bmiResult >= 18.5 && _bmiResult <= 25){
                    _textResult = "Normal Weight";
                  }else{
                    _textResult = "Under Weight";
                  }

                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: const Text('Calculate',style: TextStyle(color: Colors.yellow, fontSize: 25.0),)
          ),
          const SizedBox(  height: 50.0,),
          Text(_bmiResult.ceil().toString(), style: TextStyle(color: Colors.yellow, fontSize: 60.0),),
          const SizedBox(height: 40.0,),
          Visibility(
            visible: _textResult.isNotEmpty,
            child: Text(_textResult, style: TextStyle(color: Colors.yellow, fontSize: 30.0),)),
          const SizedBox( height: 40.0,),
          const RightBar(barWidth: 25.0),
          const RightBar(barWidth: 60.0),
          const RightBar(barWidth: 25.0),
          const LeftBar(barWidth: 35.0),
          const SizedBox(height: 46,),
          const LeftBar(barWidth: 35.0),

        ],
      ),
    );
  }
}

class RightBar extends StatelessWidget {
  final double barWidth ;
  const RightBar({Key? key,required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 26.0,
            width: barWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0)
              ),
              color: Colors.yellow
            ),
          ),
        ],
      ),
    );
  }
}

class LeftBar extends StatelessWidget {
  final double barWidth;
  const LeftBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 26.0,
            width: barWidth,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)
                ),
                color: Colors.yellow
            ),
          ),
        ],
      ),
    );
  }
}


