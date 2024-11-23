import 'package:explore_app/widgets/book_widet.dart';
import 'package:explore_app/widgets/event_info.dart';
import 'package:explore_app/widgets/filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:explore_app/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
  bool _isSearchButtonVisible = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              appBar(),
              const SizedBox(height: 20.0),
              _isSearchButtonVisible ? searchBar() : const SizedBox(),
              eventsSlider(size),
              bookList()
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNav(),
    );
  }

  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                child: SvgPicture.asset(
                  'assets/wstecz.svg',
                  width: 25.0,
                  height: 25.0,
                ),
                onTap: () {}),
            const SizedBox(
              width: 15.0,
            ),
            Text(
              'Wydarzenia',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold, fontSize: 23.0),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
                child: SvgPicture.asset(
                  'assets/wyszukaj.svg',
                  width: 25.0,
                  height: 25.0,
                ),
                onTap: () {
                  setState(() {
                    _isSearchButtonVisible = !_isSearchButtonVisible;
                    print(_isSearchButtonVisible);
                  });
                }),
            const SizedBox(
              width: 15.0,
            ),
            GestureDetector(
                child: SvgPicture.asset(
                  'assets/filtruj.svg',
                  width: 25.0,
                  height: 25.0,
                ),
                onTap: () {
                  showModalBottomSheet(
                      useSafeArea: true,
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return const Filters();
                      });
                }),
          ],
        ),
      ],
    );
  }

  Widget searchBar() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      const BorderSide(color: Colors.black, width: 1.0))),
        ),
      ),
    );
  }

  Widget eventsSlider(Size size) {
    return SizedBox(
      height: 250,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: sliderImages.map((image) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget bookList() {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        children: books.map((book) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: GestureDetector(
              child: BookWidget(book: book),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventInfo(
                              book: book,
                            )));
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget bottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/dom.svg'),
          label: 'Śląskie',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/aktualnosci.svg'),
          label: 'Aktualności',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/wydarzenia.svg'),
          label: 'Wydarzenia',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/eksploruj.svg'),
          label: 'Eksploruj',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      unselectedFontSize: 14,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      onTap: _onItemTapped,
    );
  }
}
