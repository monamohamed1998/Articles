import 'package:flutter/material.dart';
import 'package:newsapp2/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key, required this.onItemSelected});
  void Function(DrawerItem) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppTheme.Primary,
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
                GestureDetector(
                  onTap: () => onItemSelected(DrawerItem.categories),
                  child: Row(
                    children: [
                      Icon(Icons.category_outlined),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Categories",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppTheme.nevy),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () => onItemSelected(DrawerItem.setting),
                  child: Row(
                    children: [
                      Icon(Icons.settings_outlined),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Settings",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppTheme.nevy),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum DrawerItem {
  categories,
  setting;
}
