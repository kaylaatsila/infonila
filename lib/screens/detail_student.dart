import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infonila/models/explore_student.dart';

class StudentDetail extends StatelessWidget {
  final ExploreStudent student;

  const StudentDetail({Key? key, required this.student}) : super(key: key);

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
                  student.nama.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  student.NPM.toString(),
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    width: 360,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            studentItem(
                                context, student.program_studi.toString(), 'Program Studi', const Color(0xff5F2498)),
                            studentItem(context, student.ipk.toString(), 'IPK', const Color(0xff9E63C3)),
                            studentItem(context, student.total_sks.toString(), 'Total SKS', const Color(0xffE46986)),
                            studentItem(
                                context, student.semester_sekarang.toString(), 'Semester', const Color(0xffEF7260)),
                            studentItem(
                                context, student.periode_masuk.toString(), 'Periode Masuk', const Color(0xffF67C47)),
                            studentItem(context, student.status_sekarang.toString(), 'Status', const Color(0xffFE9336)),
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

  Widget studentItem(BuildContext context, String value, String title, Color color) {
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
