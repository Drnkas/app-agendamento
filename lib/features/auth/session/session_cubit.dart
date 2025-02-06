import 'package:app_agendamento/di/di.dart';
import 'package:app_agendamento/features/auth/data/auth_repository.dart';
import 'package:app_agendamento/features/auth/data/results/sign_up_failed.dart';
import 'package:app_agendamento/features/auth/models/sign_up_dto.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/helpers/result.dart';
import '../data/results/login_failed.dart';
import '../data/results/validate_token_failed.dart';
import '../models/user.dart';

part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit({AuthRepository? authRepository})
      : _authRepository = authRepository ?? getIt(),
        super(const SessionState());

  final AuthRepository _authRepository;

  Future<Result<LoginFailed, User>> login({required String email, required String password}) async {
    final result = await _authRepository.login(email: email, password: password);

    if(result case Success(object: final user)){
      emit(state.copyWith(loggedUser: user));
    }

    return result;
  }

  Future<Result<SignUpFailed, User>> signUp(SignUpDto signUpDto) async {
    final result = await _authRepository.signUp(signUpDto);
    if(result case Success(object: final user)) {
      emit(state.copyWith(loggedUser: user));
    }
    return result;
  }

  Future<Result<ValidateTokenFailed, User>> validateToken() async {
    final result = await _authRepository.validateToken();

    if (result case Success(object: final user)){
      emit(state.copyWith(loggedUser: user));
    }

    return result;
  }

  Future<void> logout() async {
    // não utiliza copyWith pois se o estado é null considera como usuário logado,
    // sendo assim, é gerado um novo estado de SessionState
    await _authRepository.logout();
    emit(const SessionState(loggedUser: null));
  }
}
