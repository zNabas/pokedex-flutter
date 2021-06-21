import 'package:flutter/material.dart';

class PokeHelper{

  const PokeHelper._();

  static Color getColor(String type){
    type = type.toLowerCase();
      switch (type) {
        case 'fire':
          return Color(0xffea9029);
        case 'grass':
          return Color(0xff3aea57);
        case 'water':
          return Color(0xFF3370ea);
        case 'rock':
          return Color(0xffe8ea6e);
        case 'bug':
          return Color(0xffbed41c);
        case 'normal':
          return Color(0xffC6C6A7);
        case 'poison':
          return Color(0xffb570ea);
        case 'electric':
          return Color(0xffF7D02C);
        case 'ground':
          return Color(0xfff5d37d);
        case 'ice':
          return Color(0xffb8e6ff);
        case 'dark':
          return Color(0xffa37e65);
        case 'fairy':
          return Color(0xfffaa7d0);
        case 'psychic':
          return Color(0xffff80a6);
        case 'fighting':
          return Color(0xffff2500);
        case 'ghost':
          return Color(0xff9063c9);
        case 'flying':
          return Color(0xffbda8f7);
        case 'dragon':
          return Color(0xff9065f7);
        case 'steel':
          return Color(0xffa2b2c7);
        default:
          return Color(0xffdbd9d9);
      }
  }
}
