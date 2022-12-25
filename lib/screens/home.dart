import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                children: [
                  const Text(
                    'Home',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Selamat datang!',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        width: MediaQuery.of(context).size.width - 60,
                        decoration: BoxDecoration(
                            color: const Color(0xff9B5078).withOpacity(0.1), borderRadius: BorderRadius.circular(16.0)),
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 8,
                            ),
                            FaIcon(
                              FontAwesomeIcons.info,
                              color: Color(0xff9B5078),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Aplikasi Infonila merupakan aplikasi yang menyediakan informasi terkait Prodi S1 Ilmu Komputer di Universitas Lampung.',
                              style: TextStyle(color: Color(0xff9B5078), fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
