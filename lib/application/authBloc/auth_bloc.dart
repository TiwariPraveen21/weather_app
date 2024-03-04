import 'package:bloc/bloc.dart';
import 'package:weather_app/application/authBloc/auth_event.dart';
import 'package:weather_app/application/authBloc/auth_state.dart';
import 'package:weather_app/infrastructure/repo_impl/auth_repository_impl.dart';

class AuthProviderBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseApi _api = FirebaseApi();

 AuthProviderBloc() : super(InitialState()) {
    on<RegisterEvent>((event, emit) async {
      try {
        bool? success = await _api.registerUserWithEmailPassword(
          event.email,
          event.password,
        );
        if (success == true) {
          emit(AuthSuccessState("Register Success"));
        } else {
          emit(AuthErrorState("Registration Failed"));
        }
      } catch (e) {
        emit(AuthErrorState("An error occurred during registration"));
      }
    });

    on<LoginEvent>((event, emit) async {
      try {
        bool? success = await _api.loginUsingEmailAndPassword(
          event.email,
          event.password,
        );
        if (success == true) {
          emit(AuthSuccessState("Logged in Successfully"));
        } else {
          emit(AuthErrorState("Login Failed"));
        }
      } catch (e) {
        emit(AuthErrorState("An error occurred during login"));
      }
    });

    on<LogoutEvent>((event, emit) async {
      try {
        await _api.logOut();
        emit(AuthSuccessState("Logout Successfully"));
      } catch (e) {
        emit(AuthErrorState("An error occurred during logout"));
      }
    });
  }
}
