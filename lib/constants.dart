import 'package:explore_app/objects/book.dart';
import 'package:explore_app/objects/book_info.dart';
import 'package:explore_app/objects/category.dart';
import 'package:explore_app/objects/option.dart';

const sliderImages = [
  'assets/events/img1.jpeg',
  'assets/events/img2.jpeg',
];

final List<Book> books = [
  Book(
    imagePath: 'assets/events/img3.jpeg',
    title: 'Gala muzyki filmowej',
    city: 'Spodek, Katowice',
    date: '3.09.2024 r.',
    isFavourite: false,
    bookInfo: BookInfo(
      title: 'Gala muzyki filmowej',
      subTitle: 'Cerwicka | Ziółko | Talarczyk | Sztor | Chór',
      date: '03.09.24 r.',
      time: '18:00',
      address: 'Hala widowiskowo-sportowa Spodek al. Korfantego 35, Katowice',
      authors: """Wykonawcy:
      Katarzyna Cerekwicka
      Mateusz Ziółko
      Robert Talarczyk – prowadzenie
      Maciej Sztor – dyrygent
      Jarosław Wolanin – przygotowanie Chóru
      Mateusz Kokot – animacje
      Katarzyna Kroczek-Wasińska – animacje
      Wojciech Kukuczka – animacje
      Witold Suchoń – animacje
      Tomasz Olszewski – wizualizacje
      Orkiestra Symfoniczna Filharmonii Śląskiej
      Chór Filharmonii Śląskiej
      Program:
      John Williams – Star Wars
      John Williams – Szczęki
      John Williams – Harry Potter
      James Horner – Titanic
      Hans Zimmer – Batman vs Superman
      Hans Zimmer – Incepcja
      Hans Zimmer – Piraci z Karaibów
      Harry Gregson-Williams – Opowieści z Narnii
      John Powell – Jak Wytresować Smoka
      David Arnold – James Bond
      Ryszard Strauss – Odyseja Kosmiczna
      James Newton Howard – Igrzyska Śmierci
      Angelo Badalamenti – Twin Peaks
    """,
      program: """
      Program:
      John Williams – Star Wars
      John Williams – Szczęki
      John Williams – Harry Potter
      James Horner – Titanic
      Hans Zimmer – Batman vs Superman
      Hans Zimmer – Incepcja
      Hans Zimmer – Piraci z Karaibów
      Harry Gregson-Williams – Opowieści z Narnii
      John Powell – Jak Wytresować Smoka
      David Arnold – James Bond
      Ryszard Strauss – Odyseja Kosmiczna
      James Newton Howard – Igrzyska Śmierci
      Angelo Badalamenti – Twin Peaks

      """,
      isFree: true,
    ),
  ),
  Book(
      imagePath: 'assets/events/img4.jpeg',
      title: 'Stanisław Bober fotografia',
      city: 'Miejski ośrodek Kultury, Katowice',
      date: '23.09-12.10.2024 r.',
      isFavourite: false,
      bookInfo: BookInfo(
          date: '',
          time: '',
          address: '',
          authors: '',
          program: '',
          isFree: true,
          title: '',
          subTitle: '')),
  Book(
    imagePath: 'assets/events/img5.png',
    title: 'Dziedzictwo kultury a proces inwestycyjny',
    city: 'Muzeum Śląskie, Katowice',
    date: '23.09-12.10.2024 r.',
    isFavourite: false,
    bookInfo: BookInfo(
        date: '',
        time: '',
        address: '',
        authors: '',
        program: '',
        isFree: true,
        title: '',
        subTitle: ''),
  ),
  Book(
    imagePath: 'assets/events/img6.jpeg',
    title: 'Gala muzyki filmowej',
    city: 'Młodzieżowy Dom Kultury, Bielsko-Biała',
    date: '12.10.2024 r.',
    isFavourite: false,
    bookInfo: BookInfo(
        date: '',
        time: '',
        address: '',
        authors: '',
        program: '',
        isFree: true,
        title: '',
        subTitle: ''),
  ),
  Book(
    imagePath: 'assets/events/img7.jpeg',
    title: 'Gala muzyki filmowej',
    city: 'Młodzieżowy Dom Kultury, Bielsko-Biała',
    date: '12.10.2024 r.',
    isFavourite: false,
    bookInfo: BookInfo(
        date: '',
        time: '',
        address: '',
        authors: '',
        program: '',
        isFree: true,
        title: '',
        subTitle: ''),
  ),
];

final List<Category> kategorie = [
  Category(
      name: 'Kultura',
      isSelected: false,
      options: [
        Option(
            name: 'Sztuki wizualne', isSelected: false, isDropDownMenu: false),
        Option(name: 'Muzyka', isSelected: false, isDropDownMenu: false),
        Option(name: 'Muzeum', isSelected: false, isDropDownMenu: false),
        Option(name: 'Teatr', isSelected: false, isDropDownMenu: false),
        Option(name: 'Kino', isSelected: false, isDropDownMenu: false),
      ],
      isDropDownMenu: true),
  Category(
      name: 'Oświata', isSelected: false, options: [], isDropDownMenu: false),
  Category(
      name: 'Ochrona zdrowia',
      isSelected: false,
      isDropDownMenu: false,
      options: []),
  Category(
      name: 'Sport', isSelected: false, isDropDownMenu: false, options: []),
  Category(
      name: 'Turystyka', isSelected: false, isDropDownMenu: false, options: []),
  Category(
      name: 'Gospodarka',
      isSelected: false,
      isDropDownMenu: false,
      options: []),
  Category(
      name: 'Ekologia', isSelected: false, isDropDownMenu: false, options: []),
  Category(
      name: 'Fundusze Europejskie',
      isSelected: false,
      isDropDownMenu: false,
      options: []),
  Category(
      name: 'Rodzaj wydarzenia',
      isSelected: false,
      isDropDownMenu: true,
      options: [
        Option(name: 'Warsztaty', isSelected: false, isDropDownMenu: false),
        Option(name: 'Targi', isSelected: false, isDropDownMenu: false),
        Option(name: 'Pikniki', isSelected: false, isDropDownMenu: false),
        Option(name: 'Kongresy', isSelected: false, isDropDownMenu: false),
        Option(name: 'Koncerty', isSelected: false, isDropDownMenu: false),
        Option(name: 'Spektakle', isSelected: false, isDropDownMenu: false),
        Option(name: 'Wystawy', isSelected: false, isDropDownMenu: false),
        Option(name: 'Konferencje', isSelected: false, isDropDownMenu: false),
        Option(name: 'Rajdy', isSelected: false, isDropDownMenu: false),
      ]),
  Category(
      name: 'Według wieku',
      isSelected: false,
      isDropDownMenu: true,
      options: [
        Option(name: 'Dla dzieci', isSelected: false, isDropDownMenu: false),
        Option(name: 'Dla Seniora', isSelected: false, isDropDownMenu: false)
      ]),
];
