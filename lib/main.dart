import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_exam/config/database.dart';
import 'package:flutter_exam/config/injection.dart';
import 'package:flutter_exam/data/models/books/book_local_model.dart';
import 'package:flutter_exam/presentation/providers/book_provider.dart';
import 'package:flutter_exam/router/router.dart';
import 'package:flutter_exam/theme/app_theme.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  // final database =
  //     await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  // final dao = database.bookDao;
  // final person = BookLocalModel(
  //     author: "Ibraham", coverUrl: "", title: "Mi titulo", id: 3);
  // await dao.insertBook(person);

  // final people = await dao.getAllBooks();
  // for (var p in people) {
  //   print("ID: ${p.id}, Name: ${p.author}, Age: ${p.title}");
  // }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    initializeDateFormatting('en', null);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BookProvider()),
        ],
        builder: (context, _) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            title: 'Flutter Demo',
            theme: ThemeClass.lightTheme,
            themeMode: ThemeMode.light,
            routerConfig: appRouter.config(),
          );
        });
  }
}
