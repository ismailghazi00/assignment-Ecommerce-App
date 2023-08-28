import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';
import 'log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController nameSignUpController = TextEditingController();
TextEditingController emailSignUpController = TextEditingController();
TextEditingController passwordSignUpController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  bool isNameValidate = false;
  bool isEmailValidate = false;
  bool isPasswordValidate = false;

  Future<void> signup() async {
    // try{} what coed we put inside of tray will execut if there is an errror
    // catch(e){} the error will be cathc in 'e' and the we would do perform acton with e like to print it or show it on screen
    try {
      http.Response response = await http.post(
          //post api is to post data on server
          //http.post need twoperametres to work
          //01 is uri/url to post data on it
          //02 the body/data what to post on the server
          Uri.parse('https://ecommerce.salmanbediya.com/users/register'),
          body: {
            'name': nameSignUpController.text,
            'email': emailSignUpController.text,
            'password': passwordSignUpController.text,
          });
      print('-----------statusCode= $response.statusCode------------');
    } catch (eror) {
      print('Error Error Error $eror');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        resizeToAvoidBottomInset: false, //to ovied overflow when keborde isused

        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Text("Sign up",
                      style: Theme.of(context).textTheme.headlineLarge),
                ],
              ),
              const SizedBox(height: 85),
              //---------------------- Text Fields
              Form(
                key: formKey,
                //to use validation we first rape the text fileds with Form Widget
                //then add this line
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(children: [
                  //than we change TextField to TextFormField
                  //and add validator
                  TextFormField(
                      validator: (value) {
                        if (value != null && value.length < 3) {
                          return 'Please Enter Correct name';
                        }
                        //  else {
                        //   setState(() {
                        //     isNameValidate = !isNameValidate;
                        //   });
                        // }
                        return null;
                      },
                      controller: nameSignUpController,
                      style: Theme.of(context).textTheme.bodyMedium,
                      cursorColor: Theme.of(context).colorScheme.onBackground,
                      decoration: textFieldDecoration('Name', isNameValidate)),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (email) {
                        if (email != null && email.length < 6
                            // && EmailValidator.validate(email)
                            // &&  email.contains('@')
                            //&& email.endsWith('.com')

                            ) {
                          return 'Please Enter Correct email address';
                        }
                        // else {
                        //   setState(() {
                        //     isEmailValidate = true;
                        //   });
                        // }
                        return null;
                      },
                      controller: emailSignUpController,
                      style: Theme.of(context).textTheme.bodyMedium,
                      cursorColor: Theme.of(context).colorScheme.onBackground,
                      decoration:
                          textFieldDecoration('Email', isEmailValidate)),
                  const SizedBox(height: 10),
                  TextFormField(
                      validator: (value) {
                        if (value != null && value.length < 8) {
                          return 'password should be minimum 8 characters';
                        }
                        //  else {
                        //   setState(() {
                        //     print('callllllllllllllllllllll');
                        //     isPasswordValidate = true;
                        //   });
                        // }
                        return null;
                      },
                      controller: passwordSignUpController,
                      style: Theme.of(context).textTheme.bodyMedium,
                      cursorColor: Theme.of(context).colorScheme.onBackground,
                      decoration:
                          textFieldDecoration('Password', isPasswordValidate)),
                ]),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  'Already have an account?',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                //-------------------Forget Button
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInScreen()));
                    },
                    icon: Icon(
                      Icons.arrow_right_alt,
                      color: Theme.of(context).colorScheme.primary,
                    ))
              ]),
              const SizedBox(height: 30),
              //----------------------Sign Up Button
              ElevatedButton(
                  onPressed: () {
                    final isValidForm = formKey.currentState!.validate();
                    if (isValidForm) {
                      signup();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInScreen()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(343, 48),
                      shadowColor: Theme.of(context).colorScheme.primary,
                      elevation: 8, //Shadow radius
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text('SIGN UP',
                      style: Theme.of(context).textTheme.bodyMedium)),
              const Spacer(),
              Text("Or sign up with social account",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onBackground,
                            fixedSize: const Size(92, 64),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Image.asset("assets/GoogleLogo.png")),
                    const SizedBox(width: 20),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onBackground,
                            fixedSize: const Size(92, 64),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Image.asset("assets/fbLogo.png")),
                  ],
                ),
              ),
              const SizedBox(height: 35)
            ])));
  }

  InputDecoration textFieldDecoration(lableText, boolValue) {
    return InputDecoration(
        suffixIcon: boolValue == true
            ? const Icon(
                Icons.done,
                color: Colors.green,
              )
            : const SizedBox(),
        label: Text(lableText, style: Theme.of(context).textTheme.titleMedium),
        contentPadding:
            const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 25),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onSecondary,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.error)));
  }

  Padding textContainer(String lableText, controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextField(
              controller: controller,
              style: Theme.of(context).textTheme.bodyMedium,
              cursorColor: Theme.of(context).colorScheme.onBackground,
              decoration: InputDecoration(
                label: Text(lableText,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 15)),
                contentPadding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 10, vertical: 25),
                filled: true,
                fillColor: Theme.of(context).colorScheme.onSecondary,
                border: const OutlineInputBorder(),
                enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).colorScheme.error)),
              )),
        ),
      ),
    );
  }
}
