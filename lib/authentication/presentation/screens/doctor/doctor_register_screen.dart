import 'package:flutter/material.dart';
import 'package:health_care/authentication/presentation/widgets/default_form_field.dart';
import 'package:health_care/authentication/presentation/widgets/default_text_button.dart';
import 'package:health_care/authentication/presentation/widgets/horizontal_or_line.dart';
import 'package:health_care/core/assets/app_assets.dart';
import 'package:health_care/core/global/resources/strings_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/utils/functions.dart';
import 'package:health_care/patient/presentation/widgets/app_bar_widget.dart';

class DoctorRegisterScreen extends StatelessWidget {
  DoctorRegisterScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>(); // create validation

  final TextEditingController _userNameEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordEditingController =
      TextEditingController();
  final TextEditingController _specializationEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBarWidget(isBack:  true,title: '',),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  fit: BoxFit.fitHeight,
                  height: AppSize.s150,
                  image: AssetImage(
                    ImageAssets.splashLogo,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  AppStrings.signUpForFree,
                  style: TextStyle(
                    fontSize: AppSize.s15,
                    color: ColorManager.black,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  AppStrings.signUpAnnotation,
                  style: TextStyle(
                    fontSize: AppSize.s15,
                    color: ColorManager.grey,
                  ),
                ),
                DefaultFormField(
                  headText: AppStrings.userNameHeadText,
                  hintText: AppStrings.userNameHint,
                  controller: _userNameEditingController,
                  type: TextInputType.name,
                  validator: (String? s) {
                    if (s!.length < Constants.three) {
                      return AppStrings.userNameError;
                    }
                    return null;
                  },
                  prefix: Icons.person_outline_rounded,
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                DefaultFormField(
                  headText: AppStrings.emailHeadText,
                  hintText: AppStrings.emailHint,
                  controller: _emailEditingController,
                  type: TextInputType.emailAddress,
                  validator: (input) =>
                      input!.isValidEmail() ? null : AppStrings.emailError,
                  prefix: Icons.mail_outline_rounded,
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                DefaultFormField(
                  headText: AppStrings.passwordHeadText,
                  hintText: AppStrings.passwordHint,
                  controller: _passwordEditingController,
                  type: TextInputType.number,
                  validator: (input) => input!.isValidPassword()
                      ? null
                      : AppStrings.passwordError,
                  prefix: Icons.lock_outline_rounded,
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                DefaultFormField(
                  headText: AppStrings.confirmPasswordHeadText,
                  hintText: AppStrings.confirmPasswordHint,
                  controller: _confirmPasswordEditingController,
                  type: TextInputType.number,
                  validator: (String? s) {
                    if (_passwordEditingController.text !=
                        _confirmPasswordEditingController.text) {
                      return AppStrings.passwordConfirmationError;
                    }
                    return null;
                  },
                  prefix: Icons.lock_outline_rounded,
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                DefaultFormField(
                  headText: AppStrings.specializationHeadText,
                  hintText: AppStrings.specializationHint,
                  controller: _specializationEditingController,
                  type: TextInputType.text,
                  validator: (String? s) {
                    if (s!.length < Constants.five) {
                      return AppStrings.specializationError;
                    }
                    return null;
                  },
                  prefix: Icons.local_hospital_outlined,
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                DefaultFormField(
                  headText: AppStrings.phoneNumberHeadText,
                  hintText: AppStrings.phoneNumberHint,
                  controller: _passwordEditingController,
                  type: TextInputType.text,
                  validator: (input) =>
                      input!.isValidPhone() ? null : AppStrings.phoneError,
                  prefix: Icons.phone_iphone_outlined,
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                DefaultTextButton(
                  icon: Container(
                    width: AppSize.s30,
                  ),
                  borderColor: ColorManager.primary,
                  backGroundColor: ColorManager.primary,
                  textColor: ColorManager.white,
                  width: AppSize.s330,
                  height: AppSize.s52,
                  text: AppStrings.signUp,
                  fontWeight: FontWeight.bold,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                const HorizontalOrLine(
                  label: AppStrings.or,
                  height: AppSize.s60,
                ),
                DefaultTextButton(
                  borderColor: ColorManager.grey,
                  backGroundColor: ColorManager.white,
                  textColor: ColorManager.black,
                  width: AppSize.s330,
                  height: AppSize.s52,
                  text: AppStrings.signUpWithGoogle,
                  icon: const SizedBox(
                    height: AppSize.s33,
                    child: Image(
                      image: AssetImage(
                        ImageAssets.googleLogoIcon,
                      ),
                    ),
                  ),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                const SizedBox(
                  height: AppSize.s18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(AppStrings.haveAccount),
                    TextButton(
                      child: Text(
                        AppStrings.signIn,
                        style: TextStyle(
                          fontSize: AppSize.s18,
                          color: ColorManager.primary,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.userLoginRoute,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
