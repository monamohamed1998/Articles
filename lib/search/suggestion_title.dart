import 'package:flutter/material.dart';
import 'package:newsapp2/app_theme.dart';

class SuggestionTitle extends StatelessWidget {
  const SuggestionTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: AppTheme.Primary,
          thickness: 1,
          indent: 10, // Left spacing
          endIndent: 10, // Right spacing
        ),
      ],
    );
  }
}
