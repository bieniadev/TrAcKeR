import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tracker/boxes.dart';
import 'package:tracker/providers/darkmode.dart';
import 'package:tracker/screens/home.dart';
import 'package:tracker/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // var path = Directory.current.path;
  // await Hive.initFlutter(path);
  await Hive.initFlutter();
  boxExpences = await Hive.openBox('Expences');
  boxIsDarkmode = await Hive.openBox('IsDarkmode');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) => runApp(const ProviderScope(child: App())));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkmode = ref.watch(isDarkmodeProvider);
    return MaterialApp(
      title: 'TrAcKeR',
      debugShowCheckedModeBanner: false,
      theme: isDarkmode ? darkMode : lightMode,
      home: const HomeScreen(),
    );
  }
}
