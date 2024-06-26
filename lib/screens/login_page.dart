import 'package:authentication_ui/common/common.dart';
import 'package:authentication_ui/router/router.dart';
import 'package:authentication_ui/widgets/custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color(0xFFE8ECF4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    GoRouter.of(context)
                        .pushNamed(Routers.authenticationpage.name);
                  },
                  icon: const Icon(
                    CupertinoIcons.back,
                    size: 35,
                  )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back! Glad ",
                      style: Common().titelTheme,
                    ),
                    Text(
                      "to see you, Again!",
                      style: Common().titelTheme,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hinttext: 'Enter your email',
                        obsecuretext: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: flag ? true : false,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(18),
                            hintText: "Enter your password",
                            hintStyle: Common().hinttext,
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(12)),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.remove_red_eye_outlined))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                GoRouter.of(context)
                                    .pushNamed(Routers.forgetpassword.name);
                              },
                              child: const Text(
                                "Forget Password?",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Urbanist-SemiBold",
                                ),
                              ))),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomElevatedButton(
                        message: "Login",
                        function: () {
                          if (flag) {
                            setState(() {
                              flag = false;
                            });
                          } else {
                            setState(() {
                              flag = true;
                            });
                          }
                        },
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Or Log with",
                        style: Common().semiboldblack,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, right: 30, left: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                                "assets/images/facebook_ic (1).svg"),
                            SvgPicture.asset("assets/images/google_ic-1.svg"),
                            Image.asset(
                              "assets/images/Vector.png",
                              color: const Color.fromARGB(255, 0, 0, 0),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: Common().hinttext,
                    ),
                    TextButton(
                        onPressed: () {
                          GoRouter.of(context)
                              .pushNamed(Routers.signuppage.name);
                        },
                        child: Text(
                          "Register Now",
                          style: Common().mediumTheme,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
