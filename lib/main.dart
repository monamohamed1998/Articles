import 'package:flutter/material.dart';
import 'package:newsapp2/News/view/widgets/news_item_details.dart';
import 'package:newsapp2/News/view_model/news_view_model.dart';
import 'package:newsapp2/shared/app_theme.dart';
import 'package:newsapp2/home/view/screens/home_page.dart';
import 'package:newsapp2/settings/view_model/settings_provider.dart';
import 'package:newsapp2/sources/view_model/source_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => SettingsProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => NewsViewModel()),
          BlocProvider(create: (_) => SourceViewModel()),
          // أضف المزيد من Cubits لو عندك
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        NewsItemDetails.routeName: (context) => const NewsItemDetails(),
      },
      initialRoute: HomePage.routeName,

      // ____________Localization______________
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.language),
      theme: AppTheme.lightmode,
    );
  }
}
