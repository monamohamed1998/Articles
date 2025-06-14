import 'package:flutter/material.dart';
import 'package:newsapp2/shared/app_theme.dart';
import 'package:newsapp2/News/data/models/article.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItemDetails extends StatelessWidget {
  const NewsItemDetails({super.key});
  static const String routeName = "News_details";

  @override
  Widget build(BuildContext context) {
    final Article articles =
        ModalRoute.of(context)?.settings.arguments as Article;

    _launchURL() async {
      final Uri url = Uri.parse(
        articles.url ?? "",
      );
      if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
        throw Exception('Could not launch ${articles.url}');
      }
    }

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
          title: Text(articles.source!.name ?? ""),
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
                    child: CachedNetworkImage(
                      imageUrl: articles.urlToImage?.isNotEmpty == true
                          ? articles.urlToImage!
                          : "https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-15.png",
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) => Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: double.infinity,
                        color: Colors.grey[200],
                        child: Center(
                          child: Text('No Image'),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 7,
                ),
                Text(
                  articles.source!.name ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppTheme.nevy),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  articles.title ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppTheme.black, fontSize: 21),
                ),
                SizedBox(
                  height: 4,
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Text(
                    timeago.format(articles.publishedAt ?? DateTime.now()),
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
                  articles.description ?? '',
                  overflow: TextOverflow
                      .ellipsis, // Adds "..." at the end if text exceeds maxLines
                  softWrap: true,
                  maxLines: 8,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppTheme.nevy, fontSize: 20),
                ),
                Spacer(
                  flex: 6,
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "View Full Article",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppTheme.black, fontSize: 15),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
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
  }
}
