import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opacity/src/features/auth/data/auth_repository.dart';
import 'package:opacity/src/features/auth/presentation/screens/landing_screen.dart';
import 'firebase_options.dart';
import 'package:opacity/src/features/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
//TODO: COmplete Auth Functionality
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
      //home: const LandingScreen(),
      home: showHome ? const LandingScreen() : const OnboardingScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userDetailsProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                ref
                    .read(authRepositoryProvider)
                    .signOut()
                    .then((value) => Navigator.of(context).pop());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('Home Page + ${user!.email}'),
      ),
    );
  }
}
