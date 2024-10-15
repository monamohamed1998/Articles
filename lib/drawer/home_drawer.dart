import 'package:flutter/material.dart';
import 'package:newsapp2/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppTheme.babyblue,
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 2,
              ),
              CircleAvatar(
                child: Icon(Icons.newspaper_outlined),
              ),
              Spacer(),
              Text(
                "News App",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Spacer(
                flex: 2,
              ),
            ],
          )),
        ),
        Container(
          color: AppTheme.white,
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.75,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.category_outlined),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Categories",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppTheme.nevy),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.settings_outlined),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Settings",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppTheme.nevy),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
