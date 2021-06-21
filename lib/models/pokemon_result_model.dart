class PokemonResultModel {
  final String? name;
  final String? url;

  const PokemonResultModel({this.name, this.url});

  factory PokemonResultModel.fromMap(Map<String, dynamic> map) {
    return PokemonResultModel(
      name: map['name'],
      url: map['url'],
    );
  }
}
