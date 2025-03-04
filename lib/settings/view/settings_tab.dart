import 'package:flutter/material.dart';
import 'package:newsapp2/shared/app_theme.dart';
import 'package:newsapp2/settings/view_model/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingTab extends StatelessWidget {
  static const String routeName = "/setting_tab";
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  border: Border.all(color: AppTheme.Primary, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: AppTheme.white,
                    borderRadius: BorderRadius.circular(12),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 18),
                    value: settingsProvider.language,
                    icon: Icon(Icons.language, color: AppTheme.nevy),
                    items: [
                      DropdownMenuItem(
                        value: 'en',
                        child: Row(
                          children: [
                            const SizedBox(width: 8),
                            Text("English",
                                style: TextStyle(color: AppTheme.nevy)),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'ar',
                        child: Row(
                          children: [
                            const SizedBox(width: 8),
                            Text("Arabic",
                                style: TextStyle(color: AppTheme.nevy)),
                          ],
                        ),
                      ),
                    ],
                    onChanged: (selectedvalue) {
                      if (selectedvalue == null) return;
                      settingsProvider.changeLanguage(selectedvalue);
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
