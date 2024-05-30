import 'package:firebase_auth/firebase_auth.dart';
import 'package:trackin_n_bingein/global/common/toast.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class FirebaseAuthentication {

  Future<User?> createUserwithEmailandPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password);
        return credential.user;
    } on FirebaseAuthException catch(e){
      if (e.code == 'email-already-in-use'){
        showToast(message: 'The email is already in use.');
      } else {
        // showToast(message: 'An error occurred: ${e.code}');
      }
    }
    return null;
  }

  Future<User?> signInwithEmailandPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password);
        return credential.user;
    } on FirebaseException catch(e){
      if (e.code == 'user-not-found' || e.code == 'wrong-password'){
        showToast(message: 'Invalid email or password.');
      } else {
        // showToast(message: 'An error occured: ${e.code}');
      }
    }
    return null;
  }

  //delete account

Future<void> deleteUserAccount() async {
  try {
    await _auth.currentUser!.delete();
  } on FirebaseAuthException catch (e) {
    if (e.code == "requires-recent-login") {
      await _reauthenticateAndDelete();
    } else {
      showToast(message: 'An error occurred: ${e.code}');
    }
  } catch (e) {
    showToast(message: 'An unexpected error occurred.');
  }
}

Future<void> _reauthenticateAndDelete() async {
  try {
    final User? user = _auth.currentUser;
    if (user == null) {
      showToast(message: 'No user is currently signed in.');
      return;
    }

    final providerData = user.providerData.first;

    if (providerData.providerId == AppleAuthProvider.PROVIDER_ID) {
      await user.reauthenticateWithProvider(AppleAuthProvider());
    } else if (providerData.providerId == GoogleAuthProvider.PROVIDER_ID) {
      await user.reauthenticateWithProvider(GoogleAuthProvider());
    } else {
      // Add support for other providers if needed
      showToast(message: 'Re-authentication method not supported.');
      return;
    }

    await user.delete();
    showToast(message: 'Account deleted successfully.');
  } catch (e) {
    showToast(message: 'Re-authentication failed: ${e.toString()}');
  }
}

}

