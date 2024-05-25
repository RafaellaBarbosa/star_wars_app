class SpeciesEntity {
  final String name;
  final String classification;
  final String designation;
  final String averageHeight;
  final String skinColors;
  final String hairColors;
  final String eyeColors;
  final String averageLifespan;
  final String homeworld;
  final String language;
  final String url;

  SpeciesEntity(
      {required this.name,
      required this.classification,
      required this.designation,
      required this.averageHeight,
      required this.skinColors,
      required this.hairColors,
      required this.eyeColors,
      required this.averageLifespan,
      required this.homeworld,
      required this.language,
      required this.url});
}
