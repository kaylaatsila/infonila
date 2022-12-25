import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infonila/screens/screens.dart';

class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => _Browse();
}

class _Browse extends State<Browse> {
  final List pages = [
    const Students(),
    const Alumni(),
    const Lessons(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
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
                    'Browse',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Apa yang ingin kamu tahu?',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      browseItem(FontAwesomeIcons.school, 'Mahasiswa', const Color(0xff9E63C3), 0),
                      browseItem(FontAwesomeIcons.graduationCap, 'Alumni', const Color(0xffFEB44A), 1),
                      browseItem(FontAwesomeIcons.bookOpen, 'Mata Kuliah', const Color(0xffEF7260), 2),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]));
  }

  GestureDetector browseItem(IconData icon, String title, Color color, int index) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pages[index]),
        );
      }),
      child: Container(
        margin: const EdgeInsets.all(12),
        height: MediaQuery.of(context).size.width - 240,
        width: MediaQuery.of(context).size.width - 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              color: color,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              title,
              style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
