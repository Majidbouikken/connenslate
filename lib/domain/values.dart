List<Country> countries = [
  Country('assets/flags/afghn.png', 'Afghanistan', [
    'پښتو',
    'فارسی دری',
  ]),
  Country('assets/flags/albn.png', 'Afghanistan',
      ['shqip', 'Ελληνικά', 'Македонски јазик', 'Armãnji']),
  Country('assets/flags/algr.png', 'Algeria',
      ['العربية', 'دارجة', 'ⵜⴰⵇⴱⴰⵢⵍⵉⵜ', 'Tachawit', 'تونژابت']),
  Country('assets/flags/andr.png', 'Andorra', ['Català']),
  Country('assets/flags/angl.png', 'Angola',
      ['Português', 'Wuchokwe', 'Kikongo', 'Kimbundu', 'Owambo']),
  Country('assets/flags/argnt.png', 'Argentina', ['Español']),
];

List<Country> languages = [
  Country('assets/flags/afghn.png', 'پښتو', null),
  Country('assets/flags/afghn.png', 'فارسی دری', null),
  Country('assets/flags/albn.png', 'Shqiptare', null),
  Country('assets/flags/algr.png', 'عربي', null),
  Country('assets/flags/algr.png', 'ⵜⴰⵇⴱⴰⵢⵍⵉⵜ', null),
  Country('assets/flags/algr.png', 'Tachawit', null),
  Country('assets/flags/algr.png', 'تونژابت', null),
  Country('assets/flags/angl.png', 'Wuchokwe', null),
  Country('assets/flags/angl.png', 'Kikongo', null),
  Country('assets/flags/angl.png', 'Kimbundu', null),
  Country('assets/flags/angl.png', 'Owambo', null),
];

List<Country> dialects = [
  Country('assets/flags/algr.png', 'العربية', null),
  Country('assets/flags/algr.png', 'دارجة', null),
  Country('assets/flags/algr.png', 'ⵜⴰⵇⴱⴰⵢⵍⵉⵜ', null),
  Country('assets/flags/algr.png', 'Tachawit', null),
  Country('assets/flags/algr.png', 'تونژابت', null),
];

class Country {
  String _flag;
  String _name;
  List<String> _languages;

  String get flag => _flag;

  String get name => _name;

  List<String> get languages => _languages;

  Country(this._flag, this._name, this._languages);
}
