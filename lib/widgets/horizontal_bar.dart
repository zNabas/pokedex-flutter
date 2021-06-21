import 'package:flutter/material.dart';

class HorizontalBar extends StatelessWidget {
  final String? label;
  final int? value;
  final int maxValue;
  final Color backgroundColor;
  final Color? foregroundColor;
  final double height;

  const HorizontalBar({
    Key? key,
    this.label,
    this.value,
    this.foregroundColor,
    this.height = 22,
    this.maxValue = 300,
    this.backgroundColor = Colors.black12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          _buildLabel(),
          Expanded(
            flex: 8,
            child: Stack(
              children: [
                _buildBar(color: backgroundColor, value: maxValue),
                _buildBar(color: foregroundColor!, value: value!),
                _buildBarText(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildLabel() {
    return Expanded(
      child: Text(
        label!.toUpperCase(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildBar({Color? color, required int value}) {
    return FractionallySizedBox(
      widthFactor: (value / maxValue),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(height),
        ),
      ),
    );
  }

  _buildBarText() {
    return Container(
      height: height,
      alignment: Alignment.center,
      child: Text(
        '$value / $maxValue',
        style: TextStyle(
          fontSize: height * 0.6,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
