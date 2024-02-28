import 'package:flutter/material.dart';

class TagsArea extends StatelessWidget {
  final List<String> tags;

  const TagsArea({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: tags
          .map((tag) => Chip(
                label: Text(
                  tag,
                  style: const TextStyle(fontSize: 14),
                ),
                backgroundColor: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ))
          .toList(),
    );
  }
}
