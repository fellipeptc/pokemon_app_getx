import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokemon_app_getx/app/data/models/pokemon.dart';
import '../../services/auth_status.dart';
import '../providers/i_firebase_provider.dart';
import 'i_firebase_repository.dart';

class FirebaseRepository implements IFirebaseRepository {
  final IFirebaseProvider firebaseProvider;

  FirebaseRepository({required this.firebaseProvider});

  @override
  Future<User?> loginUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    return await firebaseProvider.loginUsingEmailPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future logoutAccount() async {
    await firebaseProvider.logoutAccount();
  }

  @override
  Future<User?> createAccount({
    required String email,
    required String password,
  }) async {
    return await firebaseProvider.createAccount(
      email: email,
      password: password,
    );
  }

  @override
  Future<AuthStatus> resetPassword({required String email}) async {
    return await firebaseProvider.resetPassword(email: email);
  }

  @override
  Future<void> savePokemon({required Pokemon pokemon}) async {
    return await firebaseProvider.savePokemon(pokemon: pokemon);
  }

  @override
  Future<DocumentSnapshot?> readPokemon({required Pokemon pokemon}) async {
    return await firebaseProvider.readPokemon(pokemon: pokemon);
  }
}
