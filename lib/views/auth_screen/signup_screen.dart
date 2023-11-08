import 'package:flutter/material.dart';
import 'package:flutter_final/consts/consts.dart';
import 'package:flutter_final/controllers/auth_controller.dart';
import 'package:flutter_final/views/home_screen/home.dart';
import 'package:flutter_final/widgets_common/applogo_widgets.dart';
import 'package:flutter_final/widgets_common/bg_widget.dart';
import 'package:flutter_final/widgets_common/custom_textfield.dart';
import 'package:flutter_final/widgets_common/our_button.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Join the $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Obx(() => Column(
                children: [
                  customTextField(
                      hint: nameHint, title: name, controller: nameController, isPass: false),
                  customTextField(
                      hint: emailHint, title: email, controller: emailController, isPass: false),
                  customTextField(
                      hint: passwordHint,
                      title: password,
                      controller: passwordController,
                      isPass: true),
                  customTextField(
                      hint: passwordHint,
                      title: retypePassword,
                      controller: passwordRetypeController,
                      isPass: true),
                  5.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        activeColor: redColor,
                        checkColor: whiteColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        },
                      ),
                      10.widthBox,
                      Expanded(
                        child: RichText(
                            text: const TextSpan(
                          children: [
                            TextSpan(
                                text: "I agree to the ",
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey,
                                )),
                            TextSpan(
                                text: termAndCond,
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: redColor,
                                )),
                            TextSpan(
                                text: " & ",
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey,
                                )),
                            TextSpan(
                              text: privacyPolicy,
                              style: TextStyle(
                                fontFamily: regular,
                                color: redColor,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                  10.heightBox,
                  controller.isloading.value? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ): ourButton(
                          color: isCheck == true ? redColor : lightGrey,
                          title: signUp,
                          textColor: whiteColor,
                          onPress: () async {
                            if (isCheck != false) {
                              controller.isloading(true);
                              try {
                                await controller.signupMethod(
                                  context: context, email: emailController.text, password: passwordController.text
                                ).then((value) {
                                  return controller.storeUserData(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text
                                  );
                                }).then((value) {
                                  VxToast.show(context, msg: loggedIn);
                                  Get.offAll(() => const Home());
                                });
                              } catch (e) {
                                auth.signOut();
                                // ignore: use_build_context_synchronously
                                VxToast.show(context, msg: e.toString());
                                controller.isloading(false);
                              }
                            }
                          }
                        )
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                  10.heightBox,
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: alreadyHaveAccount,
                          style: TextStyle(
                            fontFamily: bold,
                            color: fontGrey,
                          ),
                        ),
                        TextSpan(
                          text: logIn,
                          style: TextStyle(
                            fontFamily: bold,
                            color: redColor,
                          ),
                        ),
                      ],
                    ),
                  ).onTap(
                    () {
                      Get.back();
                    },
                  ),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            )
          ],
        ),
      ),
    ));
  }
}
