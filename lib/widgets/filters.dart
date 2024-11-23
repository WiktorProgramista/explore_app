import 'package:explore_app/constants.dart';
import 'package:explore_app/objects/category.dart';
import 'package:explore_app/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  double _sliderValue = 0.0;

  List<Category> _selectedFilters = []; // Lista wybranych filtrów

  // Funkcja, która aktualizuje listę wybranych filtrów
  void _updateSelectedFilters() {
    setState(() {
      // Filtrowanie kategorii, których isSelected == true
      _selectedFilters = [
        ...kategorie.where((kategoria) => kategoria.isSelected)
      ];
      // Możesz sprawdzić na konsoli, jakie kategorie zostały wybrane
      print(_selectedFilters.map((x) => x.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          header(),
          categoryOptions(),
          const SizedBox(height: 15.0),
          locationDistance()
        ],
      ),
    );
  }

  Widget header() {
    return Row(
      children: [
        GestureDetector(
          child:
              SvgPicture.asset('assets/zamknij.svg', width: 25.0, height: 25.0),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(width: 15.0),
        Text(
          'Filtruj',
          style:
              GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 23.0),
        ),
      ],
    );
  }

  Widget categoryOptions() {
    return Column(
      children: kategorie.map((kategoria) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomCheckbox(
                    object: kategoria,
                    onChanged: (value) {
                      setState(() {
                        // Aktualizujemy stan kategorii
                        kategorie[kategorie.indexOf(kategoria)].isSelected =
                            value!;
                        // Po każdej zmianie aktualizujemy listę wybranych filtrów
                        _updateSelectedFilters();
                      });
                    },
                  ),
                  kategoria.isSelected
                      ? Column(
                          children: kategoria.options.map((opcja) {
                            return CustomCheckbox(
                              object: opcja,
                              onChanged: (value) {
                                setState(() {
                                  // Zmiana stanu dla wybranej opcji
                                  kategorie[kategorie.indexOf(kategoria)]
                                      .options[kategorie[
                                              kategorie.indexOf(kategoria)]
                                          .options
                                          .indexOf(opcja)]
                                      .isSelected = value!;
                                  // Po każdej zmianie aktualizujemy listę wybranych filtrów
                                  _updateSelectedFilters();
                                });
                              },
                            );
                          }).toList(),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            Divider(height: 2.0, color: Colors.grey.withOpacity(0.2)),
          ],
        );
      }).toList(),
    );
  }

  Widget locationDistance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Szukaj w odległości od swojej lokalizacji',
          style: TextStyle(fontSize: 10.0, color: Colors.black26),
        ),
        Slider(
            label: '$_sliderValue km',
            divisions: 10,
            value: _sliderValue,
            onChanged: (newVal) {
              setState(() {
                _sliderValue = newVal;
              });
            }),
        Divider(height: 2.0, color: Colors.grey.withOpacity(0.2)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Wyczyść',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
              ),
              onPressed: () {},
              child: const Text(
                'Pokaź wyniki (24)',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            )
          ],
        )
      ],
    );
  }
}
