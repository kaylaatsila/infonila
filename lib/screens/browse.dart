import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infonila/screens/alumni.dart';
import 'package:infonila/screens/lecturers.dart';
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
    const Lecturers(),
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
                    'Apa yang ingin kamu cari?',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildActivityButton(FontAwesomeIcons.school, 'Mahasiswa',
                          const Color(0xff9E63C3).withOpacity(0.2), const Color(0xff9E63C3), 0),
                      buildActivityButton(FontAwesomeIcons.graduationCap, 'Alumni',
                          const Color(0xffFEB44A).withOpacity(0.2), const Color(0xffFEB44A), 1),
                      buildActivityButton(FontAwesomeIcons.chalkboardUser, 'Dosen',
                          const Color(0xffEF7260).withOpacity(0.2), const Color(0xffEF7260), 2),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]));
  }

  GestureDetector buildActivityButton(IconData icon, String title, Color backgroundColor, Color iconColor, int index) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pages[index]),
        );
      }),
      child: Container(
        margin: const EdgeInsets.all(14),
        height: MediaQuery.of(context).size.width - 240,
        width: MediaQuery.of(context).size.width - 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              color: iconColor,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
