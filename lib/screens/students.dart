import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/apis/infonila_service.dart';
import '/components/components.dart';
import '/models/explore_student.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<Students> createState() => _Students();
}

class _Students extends State<Students> {
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
                  'Mahasiswa',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Cari tahu informasi mahasiswa di sini',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            FutureBuilder<List<ExploreStudent>>(
              future: InfonilaService.getAllStudent(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return StudentList(studentList: snapshot.data ?? []);
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
