import 'package:flutter/material.dart';
import 'package:infonila/screens/detail_alumni.dart';
import '/models/models.dart';

class AlumniList extends StatefulWidget {
  final List<ExploreAlumni> alumnus;
  const AlumniList({Key? key, required this.alumnus}) : super(key: key);

  @override
  State<AlumniList> createState() => _AlumniList();
}

class _AlumniList extends State<AlumniList> {
  late List<ExploreAlumni> alumniList;

  @override
  void initState() {
    super.initState();
    alumniList = widget.alumnus;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        // itemCount: data.length,
        itemCount: alumniList.length,
        itemBuilder: (context, index) {
          final alumni = alumniList[index];
          return alumniTile(alumni);
        },
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Widget alumniTile(ExploreAlumni alumni) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
          return AlumniDetail(alumnus: alumni);
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
                      alumni.nama_alumni.toString(),
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(alumni.NPM.toString())
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
