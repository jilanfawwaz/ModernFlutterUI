import 'package:flutter/material.dart';
import 'package:modern_flutter_ui/shared/theme.dart';

class CobaAutheticationLogin extends StatelessWidget {
  const CobaAutheticationLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    var _appBar = AppBar(
      title: Text("Authentication Login Page"),
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
                          controller: usernameController,
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
                            Navigator.pushNamed(
                                context, '/cobaauthenticationhome');
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
