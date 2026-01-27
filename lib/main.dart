import 'package:flutter/material.dart';

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
  late TextEditingController _passwordController = TextEditingController();
  String _imagePath = 'images/question-mark.png';


  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
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
              setState((){
                var txt = _passwordController.value.text;
                if (txt == "ASDF") {
                  _imagePath = 'images/idea.png';
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

