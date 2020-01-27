import 'package:administrador/User/services/auth_services_firebase.dart';
import 'package:administrador/User/services/auth_serviesFirebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'firebase_auth_api.dart';

class AuthRepositoryFirebase {
  //final _firebaseAuthAPI = FirebaseAuthAPI();
  final _firebaseAuthApiService = AuthServiceFirebaseApi();
  final _firebaseAuthApiService2 = Auth();

  //Flujo de datos - Streams
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  /////////////ESTATUS//////////
Stream<User> get onAuthStateChanged{
  return _firebaseAuthApiService.onAuthStateChanged;}


  /////////////SIGN IN ANONYMOUS//////////
  Future<User>signInAnonymously() => _firebaseAuthApiService.signInAnonymously();

  /////////////SIGN IN GOOGLE//////////
  Future<User>signInWithGoogle() => _firebaseAuthApiService.signInWithGoogle();

  /////////////SIGN UP GOOGLE//////////
  Future<User>registroWithPasswordAndEmail(String email, String password) =>
      _firebaseAuthApiService.createUserWithEmailAndPassword(email, password);

  /////////////SIGN IN USER AND PASSWORD//////////
   Future<User>signInWithPasswordAndEmail(String email, String password) =>
      _firebaseAuthApiService.signInWithEmailAndPassword(email, password);

  /////////////SIGN OUT GOOGLE//////////
  Future<void>signOut() => _firebaseAuthApiService.signOut();


  ///////////////////////////////////////OPCION 2//////////////////////////////////

   /////////////SIGN IN USER AND PASSWORD 2//////////

Future<String> signInWithEmailAndPassword2(String email, String password) =>
_firebaseAuthApiService2.signIn(email, password);

   /////////////CREATE USER AND PASSWORD 2//////////
Future<String> signUp2(String email, String password) =>
_firebaseAuthApiService2.signUp(email, password);

/////////////CURRENT USER 2//////////
 Future<FirebaseUser> getCurrentUser2() =>
 _firebaseAuthApiService2.getCurrentUser();

 /////////////CERRAR SESIÓN2//////////
 Future<void> signOut2()=>
_firebaseAuthApiService2.signOut();

 /////////////VERIFICACIÓN DE MAIL2//////////
  Future<void> sendEmailVerification2() =>
_firebaseAuthApiService2.sendEmailVerification();

 /////////////VERIFICACIÓN DE MAIL RESPUESTA2//////////
Future<bool> isEmailVerified2() =>
_firebaseAuthApiService2.isEmailVerified();


 /////////////CAMBIAR MAIL2 //////////
 Future<void> changeEmail2(String email) =>
 _firebaseAuthApiService2.changeEmail(email);


 /////////////CAMBIAR PASSWORD2 //////////
 Future<void> changePassword2(String password)=>
  _firebaseAuthApiService2.changePassword(password);

   /////////////ELIMINAR USUARIO //////////
 Future<void> deleteUser2() =>
 _firebaseAuthApiService2.deleteUser();

 /////////////ENVIAR MAIL RESET PASWOORD //////////
  Future<void> sendPasswordResetMail2(String email) =>
_firebaseAuthApiService2.sendPasswordResetMail(email);


}
