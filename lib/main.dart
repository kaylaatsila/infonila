import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/screens.dart';

void main() {
  runApp(const Infonila());
}

class Infonila extends StatefulWidget {
  const Infonila({super.key});

  @override
  State<Infonila> createState() => _Infonila();
}

class _Infonila extends State<Infonila> {
  int _selectedItemIndex = 0;

  final List pages = [
    const Home(),
    const Browse(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Infonila',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: Colors.white, secondary: const Color(0xff5f2498), tertiary: const Color(0xffFFBC50)),
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: Scaffold(
            // ignore: prefer_const_literals_to_create_immutables
            bottomNavigationBar: BottomNavigationBar(
                elevation: 0,
                unselectedItemColor: Colors.grey,
                selectedItemColor: const Color(0xff5f2498),
                showUnselectedLabels: false,
                currentIndex: _selectedItemIndex,
                onTap: (int index) {
                  setState(() {
                    _selectedItemIndex = index;
                  });
                },
                items: const [
                  BottomNavigationBarItem(label: 'Home', icon: FaIcon(FontAwesomeIcons.house)),
                  BottomNavigationBarItem(label: 'Browse', icon: FaIcon(FontAwesomeIcons.magnifyingGlass))
                ]),
            body: pages[_selectedItemIndex]));
  }
}
