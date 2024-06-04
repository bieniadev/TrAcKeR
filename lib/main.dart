import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tracker/box.dart';
import 'package:tracker/screens/home.dart';
import 'package:tracker/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box localStorage;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // var path = Directory.current.path;
  // await Hive.initFlutter(path);
  await Hive.initFlutter();
  boxExpences = await Hive.openBox('Expences');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) => runApp(const ProviderScope(child: App())));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrAcKeR',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const HomeScreen(),
    );
  }
}
