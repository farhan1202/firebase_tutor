import 'package:firebase_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String pass) async {
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      if (userCredential.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: "Kesalahan",
          middleText: "Harap verifikasi email",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        getMessage('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        getMessage('Wrong password provided for that user.');
      }
    }
  }

  void signup(String email, String pass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      await userCredential.user!.sendEmailVerification();
      Get.defaultDialog(
          title: "Email Verification",
          middleText: "Harap verifikasi email",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "Yes");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        getMessage('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        getMessage('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void resetPassword(String email) async {
    if (GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        getMessage("Silahkan cek email");
        Get.back();
      } catch (e) {
        print(e);
      }
    } else {
      getMessage("Email tidak valid");
    }
  }
}

void getMessage(String msg) {
  Get.defaultDialog(
    title: "warning",
    middleText: msg,
  );
}
