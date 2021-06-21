import 'package:dartz/dartz.dart';
import 'package:pokedex/core/app_errors.dart';
import 'package:pokedex/models/pokemon_model.dart';

abstract class PokeRepository {
  Future<Either<Failure, List<PokemonModel>>> fetch(
      {int offset = 0, int limit = 20});

  Future<PokemonModel> fetchByUrl(String url);
}
