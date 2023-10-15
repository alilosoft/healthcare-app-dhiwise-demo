import 'bloc/signup_bloc.dart';
import 'models/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_demo_app/core/app_export.dart';
import 'package:healthcare_demo_app/core/utils/validation_functions.dart';
import 'package:healthcare_demo_app/widgets/custom_elevated_button.dart';
import 'package:healthcare_demo_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignupBloc>(
        create: (context) =>
            SignupBloc(SignupState(signupModelObj: SignupModel()))
              ..add(SignupInitialEvent()),
        child: SignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.cyan300,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 35.v),
                    child: Column(children: [
                      SizedBox(height: 70.v),
                      _buildPageTitle(context),
                      SizedBox(height: 29.v),
                      _buildFullName(context),
                      SizedBox(height: 8.v),
                      _buildEmail(context),
                      SizedBox(height: 8.v),
                      _buildPassword(context),
                      SizedBox(height: 8.v),
                      _buildPassword1(context),
                      SizedBox(height: 39.v),
                      _buildSignUp(context),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            onTapTxtHaveanaccount(context);
                          },
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_have_an_account2".tr,
                                    style: CustomTextStyles.bodySmallPrimary_1),
                                TextSpan(text: " "),
                                TextSpan(
                                    text: "lbl_sign_in".tr,
                                    style:
                                        CustomTextStyles.labelLargePrimaryBold)
                              ]),
                              textAlign: TextAlign.left))
                    ])))));
  }

  /// Section Widget
  Widget _buildPageTitle(BuildContext context) {
    return Column(children: [
      CustomImageView(
          imagePath: ImageConstant.imgHiDocLogo42x115,
          height: 42.v,
          width: 115.h),
      SizedBox(height: 27.v),
      Text("msg_let_s_get_started".tr,
          style: CustomTextStyles.titleMediumOnPrimaryContainer),
      SizedBox(height: 10.v),
      Text("msg_create_an_new_account".tr,
          style: CustomTextStyles.labelLargeGray50)
    ]);
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return BlocSelector<SignupBloc, SignupState, TextEditingController?>(
        selector: (state) => state.fullNameController,
        builder: (context, fullNameController) {
          return CustomTextFormField(
              controller: fullNameController,
              hintText: "lbl_full_name".tr,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgUser,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 48.v),
              validator: (value) {
                if (!isText(value)) {
                  return "Please enter valid text";
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return BlocSelector<SignupBloc, SignupState, TextEditingController?>(
        selector: (state) => state.emailController,
        builder: (context, emailController) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "lbl_your_email".tr,
              textInputType: TextInputType.emailAddress,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgMail,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 48.v),
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "Please enter valid email";
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return BlocSelector<SignupBloc, SignupState, TextEditingController?>(
        selector: (state) => state.passwordController,
        builder: (context, passwordController) {
          return CustomTextFormField(
              controller: passwordController,
              hintText: "lbl_password".tr,
              textInputType: TextInputType.visiblePassword,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgLock,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 48.v),
              validator: (value) {
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "Please enter valid password";
                }
                return null;
              },
              obscureText: true);
        });
  }

  /// Section Widget
  Widget _buildPassword1(BuildContext context) {
    return BlocSelector<SignupBloc, SignupState, TextEditingController?>(
        selector: (state) => state.passwordController1,
        builder: (context, passwordController1) {
          return CustomTextFormField(
              controller: passwordController1,
              hintText: "lbl_password_again".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgLock,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 48.v),
              validator: (value) {
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "Please enter valid password";
                }
                return null;
              },
              obscureText: true);
        });
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_sign_up".tr,
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.titleSmallTeal300);
  }

  /// Navigates to the loginScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the loginScreen.
  onTapTxtHaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
