import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/auth_status.dart';
import '../models/pokemon.dart';
import 'i_firebase_provider.dart';

class FirebaseProvider implements IFirebaseProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User? currentUser;

  @override
  Future<User?> loginUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
    currentUser = user;
    return user;
  }

  Future logoutAccount() async {
    await FirebaseAuth.instance.signOut();
    currentUser = null;
  }

  @override
  Future<User?> createAccount({
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return null;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return null;
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  @override
  Future<AuthStatus> resetPassword({required String email}) async {
    late AuthStatus status;
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => status = AuthStatus.successful)
        .catchError(
            (e) => status = AuthExceptionHandler.handleAuthException(e));
    return status;
  }

  @override
  Future<void> savePokemon({required Pokemon pokemon}) async {
    try {
      await _firestore
          .collection('users')
          .doc(currentUser?.uid)
          .collection('pokemons')
          .doc(pokemon.name!)
          .set(pokemon.toJson())
          .onError((error, _) => print("Erro ao salvar pokemon: $error"));
    } on FirebaseException catch (e) {
      print(e.code);
    }
  }

  @override
  Future<DocumentSnapshot?> readPokemon({required Pokemon pokemon}) async {
    final docRef = _firestore
        .collection('user')
        .doc(currentUser?.uid)
        .collection('pokemons')
        .doc(pokemon.name!);

    DocumentSnapshot? snapshot;
    snapshot = await docRef.get().then(
          (DocumentSnapshot? doc) => doc,
          onError: (error) => print("Erro ao buscar pokemon: $error"),
        );
    return snapshot;
  }
}
