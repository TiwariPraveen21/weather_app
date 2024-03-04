import 'package:flutter/material.dart';
import 'package:weather_app/infrastructure/utils/routes/routes_name.dart';
import 'package:weather_app/presentation/auth/login_screen.dart';
import 'package:weather_app/presentation/home/home_screen.dart';
import 'package:weather_app/presentation/auth/signup_screen.dart';
import 'package:weather_app/presentation/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignupScreen());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());      

      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

      // case RoutesName.otpVerification:
      //   Map<String, dynamic> otp = settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => OTPVerificationPage(
      //             email: otp['email'],
      //           ));

      // case RoutesName.completeProfile:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const CompleteProfile());

      // case RoutesName.forgotpassword:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const ForgotPassword());

      // case RoutesName.forgotOtpverify:
      //   Map<String, dynamic> forgetotp =
      //       settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => ForgotOTPVerification(
      //             email: forgetotp["email"],
      //           ));

      // case RoutesName.createPasword:
      //   Map<String, dynamic> forgettoken =
      //       settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => CreateNewPassword(
      //             forgetToken: forgettoken["forgetToken"],
      //           ));

      // case RoutesName.userProfile:
      //   Map<String, dynamic> userId =settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(builder: (BuildContext context) => UserProfileScreen(userid: userId["userId"],
      //           ));

      // case RoutesName.tutorial:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const TutorialScreen());

      // case RoutesName.bottomTabs:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const BottomTabsScreen());


      // case RoutesName.intro:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const IntroScreen());

      // case RoutesName.searchUser:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const SearchUser());

      // case RoutesName.followerScreen:
      //  Map<String,dynamic> userflwId = settings.arguments as Map<String,dynamic>;
      //  return MaterialPageRoute(builder: (BuildContext context) =>FollowerFollowing(initialPageIndex: 0,userId: userflwId["userId"],));

      // case RoutesName.followingScreen:
      // Map<String,dynamic> userflrId = settings.arguments as Map<String,dynamic>;
      //   return MaterialPageRoute(builder: (BuildContext context) =>FollowerFollowing(initialPageIndex: 1,userId: userflrId["userId"]));

      // case RoutesName.notificationScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const NotificationScreen());

      // case RoutesName.userPost:
      //   Map<String, dynamic> userPostData =
      //       settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => UserPostScreen(
      //           posturl: userPostData["posturl"],
      //           postdesc: userPostData["description"],
      //           username: userPostData["username"],
      //           profileurl: userPostData["profilepic"]));

      //  case RoutesName.specificpost:
      // Map<String,dynamic> postId = settings.arguments as Map<String,dynamic>;
      //   return MaterialPageRoute(builder: (BuildContext context) =>MySpecificPost(postId: postId["postId"],index: postId["index"]));
          

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });
    }
  }
}
