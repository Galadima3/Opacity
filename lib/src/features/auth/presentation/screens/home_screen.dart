import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opacity/src/features/auth/data/auth_repository.dart';
import 'package:opacity/src/features/auth/data/supabase_auth_repository.dart';
import 'package:opacity/src/features/kyc_feature/presentation/kyc_screen.dart';
import 'package:opacity/src/utils/expandable_fab.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supa = SupabaseAuthRepository();
    final user = ref.read(userDetailsProvider);
    return Scaffold(
      floatingActionButton: ExpandableFab(
        distance: 100,
        children: [
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.badge),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const KYCScreen();
              },));
            },
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
                supa.signOut().then((value) => Navigator.pop(context));
                // ref
                //     .read(authRepositoryProvider)
                //     .signOut()
                //     .then((value) => Navigator.of(context).pop());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        // child: Text('Home Page + ${user!.email}'),
        child: Text('Home Page + '),
      ),
    );
  }
}
