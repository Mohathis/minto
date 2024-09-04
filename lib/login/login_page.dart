import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minto_app/Table/table_selection.dart';
import 'package:minto_app/login/registration.dart';
import 'package:minto_app/splash.dart';

void main(){
  runApp(MaterialApp(home: LoginPage(),));
}


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formkey = GlobalKey<FormState>();
  bool passvisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('Login with validation'),
      // ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    'assets/images/login.png', // Replace with your image path
                    height: 300, // Adjust height as needed
                    width: 300,  // Adjust width as needed
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (uname) {
                    if (uname!.isEmpty || !uname.contains('@')) {
                      return 'Fields are empty or invalid';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 15),
                child: TextFormField(
                  obscuringCharacter: '*',
                  obscureText: passvisibility,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passvisibility = !passvisibility;
                        });
                      },
                      icon: Icon(
                        passvisibility
                            ? Icons.visibility_off_sharp
                            : Icons.visibility,
                      ),
                    ),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (pass) {
                    if (pass!.isEmpty || pass.length < 6) {
                      return 'Password must contain 6 characters';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final valid = formkey.currentState!.validate();
                  if (valid) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => tableSelection()),
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: "username or password incorrect",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),

                  child: Text('Login'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => registration()),
                  );
                },
                child: Text('Not a user?? Register here'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
