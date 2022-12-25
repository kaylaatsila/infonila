import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/models/models.dart';
import '/components/components.dart';
import '/apis/infonila_service.dart';

class Lessons extends StatefulWidget {
  const Lessons({super.key});

  @override
  State<Lessons> createState() => _Lessons();
}

class _Lessons extends State<Lessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
            icon: const FaIcon(FontAwesomeIcons.chevronLeft),
            padding: const EdgeInsets.symmetric(horizontal: 24),
          ),
          // actions: [
          //   IconButton(
          //     icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          //     color: Colors.black,
          //     padding: const EdgeInsets.symmetric(horizontal: 24),
          //     onPressed: () async {},
          //   )
          // ],
        ),
        body: Column(
          children: [
            Column(
              children: const [
                Text(
                  'Mata Kuliah',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Cari tahu informasi mata kuliah di sini',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            FutureBuilder<List<ExploreLesson>>(
              future: InfonilaService.getAllLesson(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return LessonList(lesson: snapshot.data ?? []);
                } else {
                  return const Center(
                      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xff5f2498))));
                }
              }),
            )
          ],
        ));
  }
}
