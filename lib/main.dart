import 'package:easy_localization/easy_localization.dart';
import 'package:engrustutorial/constants/constants.dart';
import 'package:engrustutorial/generated/codegen_loader.g.dart';
import 'package:engrustutorial/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ru')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ru'),
        assetLoader: const CodegenLoader(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                if (context.locale == const Locale('en')) {
                  context.setLocale(const Locale('ru'));
                } else {
                  context.setLocale(const Locale('en'));
                }
              },
              icon: const Icon(Icons.language)),
          backgroundColor: appbarColor,
          title: Text(LocaleKeys.womens_shoes.tr()),
        ),
        backgroundColor: scaffoldBackgroundcolor,
        body: Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () {},
              child: Text(
                LocaleKeys.add_to_shopping_cart.tr(),
                style: const TextStyle(fontSize: 18),
              )),
        ));
  }
}
