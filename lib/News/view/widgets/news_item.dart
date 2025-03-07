import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp2/News/view/widgets/news_item_details.dart';
import 'package:newsapp2/shared/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../data/models/article.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.articles});
  final Article articles;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, NewsItemDetails.routeName,
            arguments: articles),
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
                  placeholder: (context, url) => Container(
                      width: 40,
                      height: 40,
                      child: Center(child: const CircularProgressIndicator())),
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
              articles.source?.name ?? "",
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
          ],
        ),
      ),
    );
  }
}
