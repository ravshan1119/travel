part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthSuccess extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthError extends AuthState {
  final String error;

  AuthError({required this.error});

  @override
  List<Object?> get props => [error];
}
