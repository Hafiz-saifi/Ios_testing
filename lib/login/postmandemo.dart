// main.dart
import 'package:demo_9july/login/service.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(child: Text('Login')),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              Container(
                width: 270,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.pink,
                      borderRadius:BorderRadius.circular(30),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink
                  ),
                  onPressed: () async {
                    try {
                      UserModel user = await ApiService.login(
                        emailController.text,
                        passwordController.text,
                      );
                      // Show alert dialog on successful login
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Login Successful'),
                            content: Text('Token: ${user.token}'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Navigate to another screen or perform other actions
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } catch (e) {
                      // Handle error, e.g., show error message
                      print('object');
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Login Successful'),
                            content: Text('Token'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Navigate to another screen or perform other actions
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Login',style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
