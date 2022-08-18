import 'package:flutter/material.dart';

class JobDetailRow extends StatelessWidget {
  final String title;
  final String value;

  const JobDetailRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
