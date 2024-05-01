import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opacity/app.dart';
import 'package:opacity/env/env.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: Env.url,
    anonKey: Env.apiKey,
  );

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

//TODO: Complete Auth Functionality
  runApp(ProviderScope(
    child: MyApp(
      showHome: showHome,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({super.key, required this.showHome});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Opacity',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.urbanist().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF191970)),
          useMaterial3: true,
        ),
        home: App(showHome: showHome));
  }
}
