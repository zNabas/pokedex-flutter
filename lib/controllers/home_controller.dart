import 'package:pokedex/core/app_errors.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repositories/poke_repository.dart';

class HomeController {
  final PokeRepository _repository;

  HomeController(this._repository);

  List<PokemonModel> pokemons = <PokemonModel>[];

  int get length => pokemons.length;

  Failure? failure;

  int _offset = 0;

  int limit = 20;

  Future<void> fetch() async {
    failure = null;
    final result = await _repository.fetch(offset: _offset, limit: limit);
    result.fold((l) => failure = l, (r) => pokemons.addAll(r));
  }

  Future<PokemonModel> filterPokemon(String name) async {
    return await _repository
        .fetchByUrl('https://pokeapi.co/api/v2/pokemon/?name=$name');
  }

  Future<void> next() async {
    _offset += limit;
    await fetch();
  }
}
