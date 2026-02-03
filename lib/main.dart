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
    double circleRadius = 50.0;
    double hoverText = 20.0;
    double belowText = 15.0;
        return Scaffold(   //for the whole page


        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                   Stack( alignment: AlignmentDirectional.center,
                     children: <Widget>[
                     CircleAvatar(
                      backgroundImage: AssetImage("images/beef.jpg"), radius: circleRadius),
                       Text("BEEF", style: TextStyle(fontSize: hoverText, color: Colors.white),)
                     ]),
                    Stack( alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage("images/chicken.jpg"), radius: circleRadius),
                          Text("CHICKEN", style: TextStyle(fontSize: hoverText, color: Colors.white),)
                        ]),
                    Stack( alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage("images/pork.jpg"), radius: circleRadius),
                          Text("PORK", style: TextStyle(fontSize: hoverText, color: Colors.white),)
                        ]),
                    Stack( alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: AssetImage("images/seafood.jpeg"), radius: circleRadius),
                          Text("SEAFOOD", style: TextStyle(fontSize: hoverText, color: Colors.white),)
                        ]),
                      ],
                  ),
              Text("BY COURSE", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column( mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/main-dishes.jpg"), radius: circleRadius),
                        Text("Main Dishes", style: TextStyle(fontSize: belowText, fontWeight: FontWeight.bold, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
                      ]),
                  Column( mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/salad.jpeg"), radius: circleRadius),
                        Text("Salad Recipes", style: TextStyle(fontSize: belowText, fontWeight: FontWeight.bold, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
                      ]),
                  Column( mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/side-dishes.jpeg"), radius: circleRadius),
                        Text("Side Dishes", style: TextStyle(fontSize: belowText, fontWeight: FontWeight.bold, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
                      ]),
                  Column( mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/crockpot.jpg"), radius: circleRadius),
                        Text("Crockpot", style: TextStyle(fontSize: belowText, fontWeight: FontWeight.bold, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
                      ]),
                ],
              ),
              Text("BY DESSERT", style: TextStyle(backgroundColor: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column( mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/icecream.jpeg"), radius: circleRadius),
                        Text("Ice Cream", style: TextStyle(fontSize: belowText, fontWeight: FontWeight.bold, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
                      ]),
                  Column( mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/brownies.jpeg"), radius: circleRadius),
                        Text("Brownies", style: TextStyle(fontSize: belowText, fontWeight: FontWeight.bold, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
                      ]),
                  Column( mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/pies.jpeg"), radius: circleRadius),
                        Text("Pies", style: TextStyle(fontSize: belowText, fontWeight: FontWeight.bold, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
                      ]),
                  Column( mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                            backgroundImage: AssetImage("images/cookies.jpg"), radius: circleRadius),
                        Text("Cookies", style: TextStyle(fontSize: belowText, fontWeight: FontWeight.bold, color: Colors.black, backgroundColor: Color.fromRGBO(255, 255, 255, 0.3)),)
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
