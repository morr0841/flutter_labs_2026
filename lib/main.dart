import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_labs/DataRepository.dart';
import 'package:my_flutter_labs/ProfilePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/" : (context) => MyHomePage(title: "Home page"),
        "/profilePage" : (context) => ProfilePage()
      },
      title: 'Lab 5',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late EncryptedSharedPreferences prefs;
  late TextEditingController _passwordController;
  late TextEditingController _userController;
  String _imagePath = 'images/question-mark.png';


  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _userController = TextEditingController();
    prefs = EncryptedSharedPreferences();

    var userLoaded = false;
    var passwordLoaded = false;

    prefs.getString("UserPassword").then((passwordThere){
      if (passwordThere.isNotEmpty) {
        _passwordController.text = passwordThere;
        passwordLoaded = true;
      }

      if (userLoaded && passwordLoaded) {
        _showSnackBar();
      }
    });
    prefs.getString("Username").then((userThere){
      if (userThere.isNotEmpty) {
        _userController.text = userThere;
        userLoaded = true;
      }

      if (userLoaded && passwordLoaded) {
        _showSnackBar();
      }
    });

  }
  void _showSnackBar() {
      var snackBar =
      SnackBar(content: Text('Your saved settings have been loaded.'),
        action: SnackBarAction(label: 'Understood', onPressed: () {}),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    super.dispose();
    //free memory:
    _passwordController.dispose();
    _userController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          ElevatedButton(child: Text("Profile Page"), onPressed: (){
            DataRepository.loginName = _userController.text;
            Navigator.pushNamed(context, "/profilePage");
          }),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
              child: TextField(
                controller: _userController,
                decoration: InputDecoration(
                hintText: 'Login',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                ),
              ),
            ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
                child:
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                  ),
                ),
              ),


            ElevatedButton(onPressed: () {
              setState((){
                var txt = _passwordController.value.text;
                showDialog<String>(
                    context:context,
                    builder: (context) => AlertDialog(
                        title: const Text('Attention'),
                        content: const Text("Would you like to save your username and password?"),
                        actions: [
                          OutlinedButton(child:const Text("Yes"), onPressed: (){
                            prefs.setString("UserPassword", _passwordController.value.text);
                            prefs.setString("Username", _userController.value.text);
                            Navigator.pop(context);}),

                          OutlinedButton(child:const Text("No"), onPressed: (){
                            prefs.remove("UserPassword");
                            prefs.remove("Username");
                            Navigator.pop(context);})
                        ]
                    )
                );
                if (txt == "ASDF") {
                  _imagePath = 'images/idea.png';

                  ;

                } else {
                  _imagePath = 'images/stop.png';
                }
              });
            },
               child: Text('Login', style: TextStyle(color: Colors.blue, fontSize: 20),),
            ),
            Semantics(
              label: _imagePath == 'images/idea.png'
              ? 'image: lightbulb. Correct password.'
              : _imagePath == 'images/stop.png'
              ? 'image: stop sign. Wrong password.'
              : 'image: Question marks. Default image. Please enter your Password',
              child: Image.asset(_imagePath, width: 100, height: 100,),
            )
          ],
        ),
      ),
    );
  }
}

