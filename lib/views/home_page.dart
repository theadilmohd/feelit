import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_back,color: Colors.transparent,),
              Column(
                children: [
                  Text('sng Name',style: TextStyle(color: Colors.black),),
                ],
              ),
              Icon(Icons.close)
            ],
          )
        ],
      ),
    );
  }
}
