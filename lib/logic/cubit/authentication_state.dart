part of 'authentication_cubit.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {

  @override
  List<Object> get props => [];
}

class AuthenticationSuccess extends AuthenticationState {

  final String title;
  final String message;

  const AuthenticationSuccess({required this.title, required this.message});

  @override
  List<Object> get props => [];
}

class AuthenticationError extends AuthenticationState {

  final String title;
  final String message;

  const AuthenticationError({required this.title, required this.message});

  @override
  List<Object> get props => [];
}
