class LoginState {
  final bool passwordContentVisible;
  final String email;
  final String password;
  final String? passwordError;

  LoginState({
    this.passwordContentVisible = true,
    this.email = '',
    this.password = '',
    this.passwordError,
  });

  LoginState copyWith({
    bool? passwordFieldVisible,
    bool? passwordContentVisible,
    String? email,
    String? password,
    String? passwordError,
  }) {
    return LoginState(
      passwordContentVisible: passwordContentVisible ?? this.passwordContentVisible,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordError: passwordError ?? this.passwordError,
    );
  }
}
