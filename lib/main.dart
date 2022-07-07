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


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  child: const TextField(
                    decoration: InputDecoration(
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
                  child: const TextField(
                    decoration: InputDecoration(
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
        ],
      ),
    );
  }
}


