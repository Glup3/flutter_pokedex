class Pokemon {
  final int id;
  final String name;
  final double weight;
  final int baseExperience;

  Pokemon({this.id, this.name, this.weight, this.baseExperience});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      weight: json['weight'],
      baseExperience: json['base_experience'],
    );
  }
}
