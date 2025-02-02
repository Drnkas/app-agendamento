import 'package:app_agendamento/features/auth/models/sign_up_dto.dart';
import 'package:app_agendamento/features/auth/pages/sign_up/sign_up_actions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../../core/helpers/result.dart';
import '../../../../core/widgets/alert/alert_area_cubit.dart';
import '../../../../di/di.dart';
import '../../data/auth_repository.dart';
import '../../models/cellphone.dart';
import '../../models/cpf.dart';
import '../../models/email.dart';
import '../../models/full_name.dart';
import '../../models/password.dart';

part 'signup_page_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._actions, {AuthRepository? authRepository, AlertAreaCubit? alertAreaCubit })
      : _authRepository = authRepository ?? getIt(),
        _alertAreaCubit = alertAreaCubit ?? getIt(),
        super(const SignUpState.empty());

  final SignUpActions _actions;

  final AuthRepository _authRepository;
  final AlertAreaCubit _alertAreaCubit;

  void onFullNameChanged(String s) {
    emit(state.copyWith(fullName: FullName.dirty(s)));
  }

  void onCpfChanged(String s) {
    emit(state.copyWith(cpf: Cpf.dirty(s)));
  }

  void onCellPhoneChanged(String s) {
    emit(state.copyWith(cellPhone: CellPhone.dirty(s)));
  }

  void onEmailChanged(String s) {
    emit(state.copyWith(email: Email.dirty(s)));
  }

  void onPasswordChanged(String s) {
    emit(state.copyWith(password: Password.dirty(s)));
  }

  Future<void> onSignUpPressed() async {
    emit(state.copyWith(isLoading: true));

    final result = await  _authRepository.signUp(
        SignUpDto(
          fullName: state.fullName.value,
          cpf: state.cpf.value,
          cellPhone: state.cellPhone.value,
          email: state.email.value,
          password: state.password.value,
        ));

    switch (result) {
      case Success():
        _actions.navToHome();
      case Failure():
        _alertAreaCubit.showAlert(
          const Alert.error(
            title:
            'Não foi possível criar sua conta. Por favor, tente novamente.',
            duration: Duration(seconds: 3),
          ),
        );
    }

    emit(state.copyWith(isLoading: false));
  }
}
