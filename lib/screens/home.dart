import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListView(
                    children: const [
                      Text(
                        'Home',
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Selamat datang!',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}
