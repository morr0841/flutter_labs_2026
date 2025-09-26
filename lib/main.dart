import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //this hides the debug banner
      title: 'Lab 03',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Lab 03'),
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

  @override
  Widget build(BuildContext context) {
        return Scaffold(   //for the whole page

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("BROWSE CATEGORIES", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),

              Padding(padding: EdgeInsets.all(26.0),
              child:
                Text("Not sure what you're looking for? Do a search or dive into our most popular categories.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Text("BY MEAT", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                   Stack( alignment: AlignmentDirectional.center,
                     children: <Widget>[
                     CircleAvatar(
                      backgroundImage: AssetImage("images/beef.jpg"), radius: 60),
                       Text("BEEF", style: TextStyle(fontSize: 30.0, color: Colors.white),)
                     ]),
                    Stack( alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage("images/chicken.jpg"), radius: 60),
                          Text("CHICKEN", style: TextStyle(fontSize: 30.0, color: Colors.white),)
                        ]),
                    Stack( alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage("images/pork.jpg"), radius: 60),
                          Text("PORK", style: TextStyle(fontSize: 30.0, color: Colors.white),)
                        ]),
                    Stack( alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage("images/seafood.jpeg"), radius: 60),
                          Text("SEAFOOD", style: TextStyle(fontSize: 30.0, color: Colors.white),)
                        ]),
                      ],
                  ),
              Text("BY COURSE", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Stack( alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/main-dishes.jpg"), radius: 60),
                        Text("Main Dishes", style: TextStyle(fontSize: 30.0, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
                      ]),
                  Stack( alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/salad.jpeg"), radius: 60),
                        Text("Salad Recipes", style: TextStyle(fontSize: 30.0, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
                      ]),
                  Stack( alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/side-dishes.jpeg"), radius: 60),
                        Text("Side Dishes", style: TextStyle(fontSize: 30.0, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
                      ]),
                  Stack( alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/crockpot.jpg"), radius: 60),
                        Text("Crockpot", style: TextStyle(fontSize: 30.0, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
                      ]),
                ],
              ),
              Text("BY DESSERT", style: TextStyle(backgroundColor: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Stack( alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/icecream.jpeg"), radius: 60),
                        Text("Ice Cream", style: TextStyle(fontSize: 30.0, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
                      ]),
                  Stack( alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/brownies.jpeg"), radius: 60),
                        Text("Brownies", style: TextStyle(fontSize: 30.0, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
                      ]),
                  Stack( alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/pies.jpeg"), radius: 60),
                        Text("Pies", style: TextStyle(fontSize: 30.0, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
                      ]),
                  Stack( alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/cookies.jpg"), radius: 60),
                        Text("Cookies", style: TextStyle(fontSize: 30.0, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
                      ]),
                ],
              ),
            ],
          ),
        )
    );
  }

  void buttonClicked()
  {

  }
}
