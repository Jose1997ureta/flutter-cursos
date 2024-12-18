import 'package:flutter/material.dart';
import 'package:flutter_main/config/theme/app_theme.dart';
import 'package:flutter_main/presentation/providers/discover_provider.dart';
import 'package:flutter_main/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false, create: (_) => DiscoverProvider()..loadNextPage())
      ],
      child: MaterialApp(
        title: "Toktik",
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
