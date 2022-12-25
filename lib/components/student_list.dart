import 'package:flutter/material.dart';
import 'package:infonila/screens/detail_student.dart';
import '/models/models.dart';

class StudentList extends StatefulWidget {
  final List<ExploreStudent> studentList;
  const StudentList({Key? key, required this.studentList}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentList();
}

class _StudentList extends State<StudentList> {
  late List<ExploreStudent> studentList;

  @override
  void initState() {
    super.initState();
    studentList = widget.studentList;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        // itemCount: data.length,
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          final mahasiswa = studentList[index];
          return studentTile(mahasiswa);
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Widget studentTile(ExploreStudent student) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
          return StudentDetail(student: student);
        }));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      student.nama.toString(),
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(student.NPM.toString())
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
