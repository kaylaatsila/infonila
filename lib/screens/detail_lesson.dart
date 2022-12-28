import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infonila/models/models.dart';

class LessonDetail extends StatelessWidget {
  final ExploreLesson lesson;

  const LessonDetail({Key? key, required this.lesson}) : super(key: key);

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
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Text(
                  lesson.nm_mk.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  lesson.kode_mk.toString(),
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  // padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    width: 360,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            lessonItem(context, lesson.status.toString(), 'Status', const Color(0xff5F2498)),
                            // lessonItem(context, lesson.angkatan.toString(), 'IPK', const Color(0xff9E63C3)),
                            // lessonItem(context, lesson.lama_studi.toString(), 'Total SKS', const Color(0xffE46986)),
                            // lessonItem(context, lesson.tanggal_wisuda.toString(), 'Semester', const Color(0xffEF7260)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  Widget lessonItem(BuildContext context, String value, String title, Color color) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      elevation: 0,
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width - 60,
        decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              value,
              style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
