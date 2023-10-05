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

      // check the response
      if(response != null && response.isNotEmpty) {
        emit(AuthenticationError(message: response["message"]));
      } else {
        emit(const AuthenticationSuccess(message: "Login effettuato con successo!"));
      }
    } catch (e) {
      emit(AuthenticationError(message: e.toString()));
    }
  }
}
