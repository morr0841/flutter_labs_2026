import 'package:flutter/material.dart';
import 'package:my_flutter_labs/DataRepository.dart';

class ProfilePage extends StatefulWidget{

  @override
  State<ProfilePage> createState() => ProfilePageState();

}

class ProfilePageState extends State<ProfilePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(); //doing your promise to initialize
    DataRepository.loadData();
    Future.delayed(Duration(seconds: 0), (){
      var snackBar =
      SnackBar( content: Text('Welcome to your profile page ${DataRepository.loginName}!'),
        action: SnackBarAction(label: 'Thanks!', onPressed: ( ){ }),
      );
      //this displays it:
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Profile Page"),
      ),
      body:
      Center(child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text("Welcome to your profile page ${DataRepository.loginName}!"),

          Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
              ),
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'Last Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
              ),
            ),
          ),

          Row(children: [
            Flexible(child:
            Padding(padding: EdgeInsets.fromLTRB(25, 10, 0, 10),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                ),
              ),
            ),),
            IconButton(onPressed: (){}, icon: Icon(Icons.phone)),
            IconButton(onPressed: (){}, icon: Icon(Icons.textsms))
          ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'Email address',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
              ),
            ),
          ),

        OutlinedButton(child: Text("Back to Login"), onPressed: (){
          Navigator.pop(context);
        })
        ],
      ))
    );
  }

}