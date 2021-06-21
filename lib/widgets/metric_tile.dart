import 'package:flutter/material.dart';

class MetricTile extends StatelessWidget {
  final String? label;
  final num? value;
  final String? unit;

  const MetricTile({
    Key? key,
    this.label,
    this.value,
    this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            '$value $unit',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 4.0),
          Text(label!),
        ],
      ),
    );
  }
}
