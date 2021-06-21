import 'package:flutter/material.dart';
import 'package:infinite_widgets/infinite_widgets.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/core/app_const.dart';
import 'package:pokedex/pages/detail_page.dart';
import 'package:pokedex/repositories/poke_repository_impl.dart';
import 'package:pokedex/widgets/poke_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController(PokeRepositoryImpl());
  bool searchBar = false;
  List pokemons = [];
  List filteredPokemons = [];

  getPokemons() async {
    var data = await _controller.fetch();
    return data;
  }

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  Future<void> _initialize() async {
    await _controller.fetch();
    getPokemons().then((data) {
      setState(() {
        pokemons = filteredPokemons = data;
      });
    });
  }

  void _filterPokemon(String name) {
    setState(() {
      filteredPokemons = _controller.pokemons
          .where((element) =>
              element.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !searchBar
            ? _buildText()
            : TextField(
                onChanged: (value) {
                  _filterPokemon(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Search pokemon...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
        actions: <Widget>[
          searchBar
              ? IconButton(
                  icon: Icon(Icons.cancel, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      this.searchBar = false;
                      filteredPokemons = pokemons;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      this.searchBar = true;
                    });
                  },
                )
        ],
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: InfiniteGridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: _buildCard,
        itemCount: _controller.length,
        hasNext: _controller.length < 1118,
        nextData: _onNext,
      ),
    );
  }

  Future<void> _onNext() async {
    await _controller.next();
    setState(() {});
  }

  Widget _buildCard(BuildContext context, int index) {
    final pokemon = _controller.pokemons[index];
    return PokemonCard(
      pokemon: pokemon,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
              pokemon: pokemon,
            ),
          ),
        );
      },
    );
  }

  _buildText() {
    return Text(kAppTitle,
        style: TextStyle(color: Colors.white, fontFamily: 'Pokemon'));
  }
}
