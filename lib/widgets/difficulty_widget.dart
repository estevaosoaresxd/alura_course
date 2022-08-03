import 'package:flutter/material.dart';

class DifficultyWidget extends StatelessWidget {
  final int difficulty;

  const DifficultyWidget({
    Key? key,
    required this.difficulty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: difficulty >= 1 ? Colors.purple : Colors.purple.shade100,
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficulty >= 2 ? Colors.purple : Colors.purple.shade100,
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficulty >= 3 ? Colors.purple : Colors.purple.shade100,
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficulty >= 4 ? Colors.purple : Colors.purple.shade100,
        ),
        Icon(
          Icons.star,
          size: 15,
          color: difficulty >= 5 ? Colors.purple : Colors.purple.shade100,
        ),
      ],
    );
  }
}
