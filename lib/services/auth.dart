import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? currentUser;

  Stream<User?> get user => _auth.authStateChanges();

  AuthService() {
    _auth.authStateChanges().listen((event) {
      currentUser = event;
    });
  }

  Future<User?> googleLogin() async {
    try {
      // Trigger the Google Authentication flow.
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      // Obtain the auth details from the request.
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleAuth =
            await googleSignInAccount.authentication;
        // Create a new credential.
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google [UserCredential].
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        return userCredential.user;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> signOut() {
    return _auth.signOut();
  }
}
