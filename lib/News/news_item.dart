import 'package:flutter/material.dart';
import 'package:newsapp2/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "assets/images/NewsTest.png",
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            "BBC News",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppTheme.nevy),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "BBC News BBC NewsBBC NewsBBC NewsBBC News",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppTheme.black, fontSize: 21),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              timeago.format(DateTime.now()),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppTheme.nevy),
            ),
          ),
        ],
      ),
    );
  }
}
