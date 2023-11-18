import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mnotes/data/repositories/authentication_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  // retrieve the authentication repository instance
  final AuthenticationRepository _authenticationRepository = AuthenticationRepository();

  // login in the current user
  void logIn(Map<String, dynamic> credentials) async {

    try {

      // set loading
      emit(AuthenticationLoading());

      // get the backend response
      Map<String, dynamic>? response = await _authenticationRepository.logIn(credentials);

      // check the response is not empty
      if(response != null && response.isNotEmpty) {

        // check the reponse result
        if(response["success"] == false) {
          emit(AuthenticationError(title: "Errore", message: response["data"]["detail"]));
        } else {
          emit(const AuthenticationSuccess(title: "Successo", message: "Login andato a buon fine!"));
        }

      } else {
        emit(const AuthenticationError(title: "Errore", message: "Qualcosa è andato storto"));
      }

    } catch (e) {
      emit(const AuthenticationError(title: "Errore", message: "Qualcosa è andato storto!"));
    }
  }

  void checkAccessToken() async {

    bool response = await _authenticationRepository.checkAccessToken();

    if(response) {
      emit(AuthenticationCheckAccessTokenValid());
    }

    emit(AuthenticationCheckAccessTokenError());
  }
}
