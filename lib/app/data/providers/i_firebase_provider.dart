import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/auth_status.dart';
import '../models/pokemon.dart';

abstract class IFirebaseProvider {
  Future<User?> loginUsingEmailPassword({
    required String email,
    required String password,
  });
  Future logoutAccount();
  Future<User?> createAccount({
    required String email,
    required String password,
  });
  Future<AuthStatus> resetPassword({required String email});
  Future<void> savePokemon({required Pokemon pokemon});
  Future<DocumentSnapshot?> readPokemon({required Pokemon pokemon});
}
