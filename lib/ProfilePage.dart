import 'package:flutter/material.dart';
import 'package:my_flutter_labs/DataRepository.dart';

class ProfilePage extends StatefulWidget{

  @override
  State<ProfilePage> createState() => ProfilePageState();

}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(
      title: Text("Profile Page")

    ),
      body:
      Center(child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text("Welcome ${DataRepository.loginName} to your profile page!"),
        OutlinedButton(child: Text("Back to Login"), onPressed: (){
          Navigator.pop(context);
        })
        ],
      ))
    );
  }

}