import 'package:flutter/material.dart';
import 'package:newsapp2/shared/app_theme.dart';

class SuggestionTitle extends StatelessWidget {
  const SuggestionTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.search,
              size: 30,
              color: AppTheme.nevy,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 0.1,
          endIndent: 1,
          indent: 1,
          // height: 1,
          color: AppTheme.nevy,
        ),
      ],
    );
  }
}
