import 'package:flutter/material.dart';
import 'package:newsapp2/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItemDetails extends StatelessWidget {
  const NewsItemDetails({super.key});
  static const String routeName = "News_details";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage(
            "assets/images/pattern.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Title"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed,
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
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Why are football's biggest clubs starting a new tournament Why are football’s biggest clubs starting a new tournamentWhy are football’s biggest clubs starting a new tournamentWhy are football’s biggest clubs starting a new tournamentWhy are football’s biggest clubs starting a new tournament.Why are football’s biggest clubs starting a newtournamentWhy are football’s biggest clubs startinga new tournamentWhy are football’s biggest clubs ",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppTheme.nevy, fontSize: 18),
                ),
                Spacer(
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "View Full Article",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppTheme.black),
                    ),
                    Icon(Icons.navigate_next),
                  ],
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    ;
  }
}
