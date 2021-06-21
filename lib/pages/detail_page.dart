import 'package:flutter/material.dart';
import 'package:pokedex/helpers/poke_helper.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/widgets/horizontal_bar.dart';
import 'package:pokedex/widgets/metric_tile.dart';
import 'package:pokedex/widgets/poke_header.dart';
import 'package:pokedex/widgets/poke_type_chip.dart';

class DetailPage extends StatefulWidget {
  final PokemonModel? pokemon;

  const DetailPage({
    Key? key,
    this.pokemon,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon!.name),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: PokeHelper.getColor(widget.pokemon!.type1),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            width: 80,
            height: 52,
            child: Center(
              child: Text(
                '#${widget.pokemon!.id.toString().padLeft(3, '0')}',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PokeHeader(
              imageUrl: widget.pokemon!.imageUrl,
              backgroundColor: PokeHelper.getColor(widget.pokemon!.type1),
            ),
            _buildMetrics(),
            _buildTypeChips(),
            Padding(padding: const EdgeInsets.all(20)),
            _buildGif(),
            _buildStatistics(),
            Padding(padding: const EdgeInsets.all(10)),
          ],
        ),
      ),
    );
  }

  _buildGif(){
    return Container(
      height: 80,
      width: 80,
      child: Image.network(widget.pokemon!.gifUrl, fit: BoxFit.fitHeight),
    );
  }

  _buildStatistics() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(),
          ),
          Text(
            'Statistics',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          HorizontalBar(
            label: 'HP',
            value: widget.pokemon!.health,
            foregroundColor:
                PokeHelper.getColor(widget.pokemon!.type1).withOpacity(1.0),
          ),
          HorizontalBar(
            label: 'ATK',
            value: widget.pokemon!.attack,
            foregroundColor:
                PokeHelper.getColor(widget.pokemon!.type1).withOpacity(0.8),
          ),
          HorizontalBar(
            label: 'DEF',
            value: widget.pokemon!.defense,
            foregroundColor:
                PokeHelper.getColor(widget.pokemon!.type1).withOpacity(0.7),
          ),
          HorizontalBar(
            label: 'SPD',
            value: widget.pokemon!.speed,
            foregroundColor:
                PokeHelper.getColor(widget.pokemon!.type1).withOpacity(0.6),
          ),
          HorizontalBar(
            label: 'SATK',
            value: widget.pokemon!.specialAttack,
            foregroundColor:
                PokeHelper.getColor(widget.pokemon!.type1).withOpacity(0.5),
          ),
          HorizontalBar(
            label: 'SDEF',
            value: widget.pokemon!.specialDefense,
            foregroundColor: 
            PokeHelper.getColor(widget.pokemon!.type1).withOpacity(0.4),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  _buildTypeChips() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PokeTypeChip(type: widget.pokemon!.type1),
        widget.pokemon!.type2 != null ? SizedBox(width: 20) : SizedBox(),
        widget.pokemon!.type2 != null ? PokeTypeChip(type: widget.pokemon!.type2): SizedBox(),
      ],
    );
  }

  _buildMetrics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MetricTile(
          label: 'Weight',
          unit: 'kg',
          value: widget.pokemon!.weight / 10.0,
        ),
        MetricTile(
          label: 'Height',
          unit: 'm',
          value: widget.pokemon!.height / 10.0,
        ),
      ],
    );
  }
}
