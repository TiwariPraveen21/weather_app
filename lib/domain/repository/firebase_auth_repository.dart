// import 'package:flutter/material.dart';
// import 'package:weather_app/infrastructure/repo_impl/auth_repository_impl.dart';
// import 'package:weather_app/infrastructure/utils/app_utils.dart';
// import 'package:weather_app/infrastructure/utils/routes/routes_name.dart';

// class FirebaseAuthProvider extends ChangeNotifier {

//   bool _loginloading = false;
//   bool get loginloading => _loginloading;
//   setloginloading(bool val) async {
//     _loginloading = val;

//     notifyListeners();
//   }

//    bool _signuploading = false;
//   bool get signuploading => _signuploading;
//   setsignuploading(bool val) async {
//     _signuploading = val;

//     notifyListeners();
//   }

// // Created Object of class FireBaseAPI class
//   final FirebaseApi _api = FirebaseApi();

//   Future createAccount(BuildContext context,String email,String password) async {
//    setsignuploading(true);
//     bool? res;
//     debugPrint("Email is $email password is $password");
//     await _api.registerUserWithEmailPassword(email, password).then((value) {
//       if (value == true) {
//         res = value;
//         AppUtils.showSuccessMessage("Register Success");
//         Navigator.pushNamed(context, RoutesName.login);
//       }
//       else{
//         res = false;
//       }
//     }).onError((error, stackTrace) {
//       debugPrint("Register Failed!");
//       res = false;
//     });
//     setsignuploading(false);
//     return res;
//   }
  
// // Logout User
//   Future<void> logout(BuildContext context)async{
//     debugPrint("Going to logout Provider");
//     await _api.logOut().then((value) {
//       Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false);
//       AppUtils.showSuccessMessage("Logout Successfully"); 
//     }).onError((error, stackTrace) {
//       debugPrint("Error $error");
//     });
//   }

//   // Future<bool?> forgetPassword() async {
//   //   bool? res;
//   //   String email = emailCont.text.toString().trim();
//   //   setLoading(true);
//   //   await _api.forgetPassword(email).then((value) {
//   //     res = true;
//   //     debugPrint("Success in sending otp to the mail for forget password");
//   //   }).onError((error, stackTrace) {
//   //     debugPrint("Error while sending forget Password otp send");
//   //   });
//   //   setLoading(false);
//   //   return res;
//   // }

//   Future<bool?> loginUsingEmailAndPassword(BuildContext context,String email,String password) async {
//     setloginloading(true);
//     bool? res;
//     await _api.loginUsingEmailAndPassword(
//       email,
//       password,
//     ).then((value) {
//       if (value == true) {
//          res = value;
//         AppUtils.showSuccessMessage("Logged in Successsfully");
//         Navigator.pushNamed(context, RoutesName.home);
//       } else {
//         res = false;
//         debugPrint("Login failed! Using Email and Password");
//       }
//     }).onError((error, stackTrace) {});
//    setloginloading(false);
//     return res;
//   }

// }