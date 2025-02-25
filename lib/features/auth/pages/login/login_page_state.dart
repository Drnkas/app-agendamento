part of 'login_page_cubit.dart';


class LoginPageState extends Equatable {
  const LoginPageState({
    required this.email,
    required this.password,
    required this.isLoading,
  });

  const LoginPageState.empty()
      : email = const Email.pure(),
        password = const Password.pure(validateLength: false),
        isLoading = false;

  final Email email;
  final Password password;
  final bool isLoading;

  bool get isValid => Formz.validate([
    email,
    password
  ]);

  @override
  List<Object?> get props => [email, password, isLoading];

  // faz com que copie o objeto alterando o valor, caso não passe aqui a propiedade ela não será alterada
  LoginPageState copyWith({
    Email? email,
    Password? password,
    bool? isLoading,
  }) {
    return LoginPageState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}