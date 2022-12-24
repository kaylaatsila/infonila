import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Alumni extends StatefulWidget {
  const Alumni({super.key});

  @override
  State<Alumni> createState() => _Alumni();
}

class _Alumni extends State<Alumni> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              onPressed: () async {
                // final results = await
                //     showSearch(context: context, delegate: CitySearch());

                // print('Result: $results');
              },
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListView(
                    children: [
                      Column(
                        children: const [
                          Text(
                            'Alumni',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Cari tahu informasi alumni di sini',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      )
                    ],
                  )),
            )
          ],
        ));
  }
}
