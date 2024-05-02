import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:opacity/src/features/auth/data/supabase_auth_repository.dart';
import 'package:opacity/src/routing/route_paths.dart';
import 'package:opacity/src/utils/expandable_fab.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userDetailsProvider);
    return Scaffold(
      floatingActionButton: ExpandableFab(
        distance: 100,
        children: [
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.badge),
            onPressed: () => context.pushNamed(RoutePaths.kycScreenRoute),
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.support_agent),
            onPressed: () {},
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                ref.read(supabaseAuthProvider).signOut().then((_) =>
                    context.pushReplacementNamed(RoutePaths.loginScreenRoute));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text(
            'Home Page + ${user?.userMetadata?['displayName'] ?? "Unavailable"}'),
      ),
    );
  }
}
