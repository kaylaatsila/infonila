import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  static const String prefSelectedIndexKey = '_selectedItemIndex';

  final List pages = [
    const Home(),
    const Browse(),
  ];

  @override
  void initState() {
    super.initState();
    getCurrentIndex();
  }

  void getCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefSelectedIndexKey)) {
      setState(() {
        final index = prefs.getInt(prefSelectedIndexKey);
        if (index != null) {
          _selectedItemIndex = index;
        }
      });
    }
  }

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
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedItemIndex,
                elevation: 0,
                unselectedItemColor: Colors.grey,
                selectedItemColor: const Color(0xff5f2498),
                showUnselectedLabels: false,
                onTap: (int index) {
                  setState(() {
                    _selectedItemIndex = index;
                  });

                  saveCurrentIndex();
                },
                items: const [
                  BottomNavigationBarItem(label: 'Home', icon: FaIcon(FontAwesomeIcons.house)),
                  BottomNavigationBarItem(label: 'Browse', icon: FaIcon(FontAwesomeIcons.compass))
                ]),
            body: pages[_selectedItemIndex]));
  }

  void saveCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(prefSelectedIndexKey, _selectedItemIndex);
  }
}
