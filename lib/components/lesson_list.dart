import 'package:flutter/material.dart';
import '/models/models.dart';
import '/screens/screens.dart';

class LessonList extends StatefulWidget {
  final List<ExploreLesson> lesson;
  const LessonList({Key? key, required this.lesson}) : super(key: key);

  @override
  State<LessonList> createState() => _LessonList();
}

class _LessonList extends State<LessonList> {
  late List<ExploreLesson> lesson;

  @override
  void initState() {
    super.initState();
    lesson = widget.lesson;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        // itemCount: data.length,
        itemCount: lesson.length,
        itemBuilder: (context, index) {
          final mahasiswa = lesson[index];
          return studentTile(mahasiswa);
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Widget studentTile(ExploreLesson lesson) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
          return LessonDetail(lesson: lesson);
        }));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      lesson.nm_mk.toString(),
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      lesson.kode_mk.toString(),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
