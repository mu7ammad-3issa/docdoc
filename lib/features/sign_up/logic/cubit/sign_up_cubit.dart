import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:flutter_complete_project/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:flutter_complete_project/features/sign_up/logic/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(SignUpState.initial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  void emitSignUpStates() async {
    emit(const SignUpState.signupLoading());
    final response = await _signUpRepo.signup(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phoneNumber: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        gender: 0,
      ),
    );
    response.when(
      success: (signupResponse) {
        emit(SignUpState.signupSuccess(signupResponse));
      },
      failure: (error) {
        emit(SignUpState.signupError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
