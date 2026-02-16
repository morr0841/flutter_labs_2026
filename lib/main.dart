import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 2',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Lab 02'),
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
  late SharedPreferences prefs;
  late TextEditingController _passwordController;
  String _imagePath = 'images/question-mark.png';


  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    SharedPreferences.getInstance().then((result) {
      prefs = result;
      var passwordExists = prefs.getString("UserPassword");
      if (passwordExists != null) {
        _passwordController.text = passwordExists;
      }
    });

    Future.delayed(Duration(seconds: 0), (){
      //TODO make this snackbar ONLY show if the user has chosen to load strings from shared preferences. if/then statement?
      var snackBar =
      SnackBar( content: Text('Your saved settings have been loaded.'),
        action: SnackBarAction(label: 'Understood', onPressed: ( ){ }),
      );
      //this displays it:
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });

  }

  @override
  void dispose() {
    super.dispose();
    //free memory:
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
              child: TextField(
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
              //TODO make these encrypted
              setState((){
                var txt = _passwordController.value.text;
                if (txt == "ASDF") {
                  _imagePath = 'images/idea.png';

                  showDialog<String>(
                    context:context,
                    builder: (context) => AlertDialog(
                      title: const Text('Attention'),
                      content: const Text("Would you like to save your login and password?"),
                      actions: [
                        OutlinedButton(child:const Text("Yes"), onPressed: (){
                          prefs.setString("UserPassword", _passwordController.value.text);
                          Navigator.pop(context);}),

                        OutlinedButton(child:const Text("No"), onPressed: (){
                          prefs.remove("UserPassword");
                          Navigator.pop(context);})
                      ]
                    )
                  );

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

