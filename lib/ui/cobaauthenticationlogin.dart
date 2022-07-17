import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';
import 'package:provider/provider.dart';

import '../Providers/cobaauthenticationloginprovider.dart';

class CobaAutheticationLogin extends StatelessWidget {
  const CobaAutheticationLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    var dataAuthentication =
        Provider.of<CobaAuthenticationLoginProvider>(context);

    var _appBar = AppBar(
      title: const Text("Authentication Login Page"),
    );
    return Scaffold(
      appBar: _appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.8,
              height: (MediaQuery.of(context).size.height -
                      _appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.5,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Text('Username'),
                        TextFormField(
                          autocorrect: false,
                          enableSuggestions: false,
                          textAlign: TextAlign.center,
                          controller: emailController,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,

                            //TIPS:menghilangkan underline pada textformfield
                            //border: InputBorder.none,

                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Text('Password'),
                        TextFormField(
                          autocorrect: false,
                          enableSuggestions: false,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          controller: passwordController,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,

                            //TIPS:menghilangkan underline pada textformfield
                            //border: InputBorder.none,

                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        height: 50,
                        width: constraints.maxWidth * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue,
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (emailController.text == "" ||
                                passwordController.text == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(milliseconds: 700),
                                  backgroundColor: Colors.blue,
                                  content: Text(
                                    "Pastikan data tidak kosong",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(emailController.text)) {
                              //NOTE:EMAIL VALIDATION menggunakan RegExp
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  //duration: Duration(milliseconds: 700),
                                  backgroundColor: Colors.blue,
                                  content: Text(
                                    "Check your email",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            } else if (passwordController.text.length < 8) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  //duration: Duration(milliseconds: 700),
                                  backgroundColor: Colors.blue,
                                  content: Text(
                                    "Password minimal 8 karakter",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            } else {
                              dataAuthentication
                                  .signIn(
                                      email: emailController.text,
                                      password: passwordController.text)
                                  .then(
                                    (value) => Navigator.pushNamed(
                                        context, '/cobaauthenticationhome'),
                                  )
                                  .catchError((onError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    //duration: Duration(milliseconds: 700),
                                    backgroundColor: Colors.blue,
                                    content: Text(
                                      "Error $onError",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              });
                            }
                          },
                          child: Text(
                            'Login',
                            style: cPoppinsWhiteMedium18,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cobaauthenticationsignup');
              },
              child: Text(
                'Don\'t have account? sign up',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
