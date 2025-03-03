import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_exam/config/injection.dart';
import 'package:flutter_exam/presentation/providers/book_provider.dart';
import 'package:flutter_exam/router/router.dart';
import 'package:flutter_exam/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    initializeDateFormatting('en', null);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<BookProvider>()),
      ],
      builder: (context, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          title: 'Flutter Demo',
          theme: ThemeClass.darkTheme,
          themeMode: ThemeMode.dark,
          routerConfig: appRouter.config(),
        );
      },
    );
  }
}
