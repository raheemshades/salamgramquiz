import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salamgramquiz/providers/multiplechoice.dart';
import 'package:salamgramquiz/providers/truefalseprovider.dart';
import 'package:salamgramquiz/screens/islamicquiz.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MultipleChoiceprovider()),
        ChangeNotifierProvider(create: (_) => truefalseprovider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MultipleChoiceprovider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const IslamicQuiz(),
        routes: const {},
      ),
    );
  }
}
