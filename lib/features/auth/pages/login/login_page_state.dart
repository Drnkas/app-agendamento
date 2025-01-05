part of 'login_page_cubit.dart';

enum LoginPageStatus{initial, loading, failure, success}

class LoginPageState extends Equatable {
  const LoginPageState({
    this.email = '',
    this.password = '',
    this.status = LoginPageStatus.initial,
  });

  final LoginPageStatus status;
  final String email;
  final String password;


  @override
  List<Object?> get props => [email, password, status];

  // faz com que copie o objeto alterando o valor, caso não passe aqui a propiedade ela não será alterada
  LoginPageState copyWith({
    LoginPageStatus? status,
    String? email,
    String? password,
  }) {
    return LoginPageState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

// final class LoginPageInitial extends LoginPageState {
//   @override
//   List<Object> get props => [];
// }
//
// final class LoginPageLoading extends LoginPageState {
//   @override
//   List<Object> get props => [];
// }
//
// final class LoginPageFailure extends LoginPageState {
//   @override
//   List<Object> get props => [];
// }
//
// final class LoginPageSuccess extends LoginPageState {
//   @override
//   List<Object> get props => [];
// }