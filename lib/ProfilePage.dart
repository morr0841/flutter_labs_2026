import 'package:flutter/material.dart';
import 'package:my_flutter_labs/DataRepository.dart';
import 'package:url_launcher/url_launcher.dart';


class ProfilePage extends StatefulWidget{

  @override
  State<ProfilePage> createState() => ProfilePageState();

}

class ProfilePageState extends State<ProfilePage> {
  late TextEditingController _fNameController;
  late TextEditingController _lNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;


  @override
  void initState() {
    super.initState();
    _fNameController = TextEditingController();
    _lNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
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
    _fNameController.dispose();
    _lNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
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
              controller: _fNameController,
              decoration: InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
              ),
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
            child: TextField(
              controller: _lNameController,
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
                controller: _phoneController,
                decoration: InputDecoration(
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                ),
              ),
            ),),
            IconButton(onPressed: () async {
              var number = Uri.parse("tel:$_phoneController");
              var canCall = await canLaunchUrl(number);

              if(canCall)
              launchUrl(number);
              else
              {
              //SnackBar.messenger("You can't make phone calls from this device");
              }
            }, icon: Icon(Icons.phone)),
            IconButton(onPressed: () async {
              var number = Uri.parse("sms:${_phoneController}");
              var canCall = await canLaunchUrl(number);

              if(canCall)
              launchUrl(number);
              else
              {
              //SnackBar.messenger("You can't text from this device");
              }
              }, icon: Icon(Icons.textsms))
          ],
          ),
          Row(children: [
            Flexible(child:
            Padding(padding: EdgeInsets.fromLTRB(25, 10, 0, 10),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: 'Email address',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                ),
              ),
            ),),
            IconButton(onPressed: () async {
              var email = Uri.parse("mailto:${_emailController}");
              var canCall = await canLaunchUrl(email); //bool if your device handles the protocol

              if(canCall)
              launchUrl(email);
              else
              {
              //SnackBar.messenger("You can't make phone calls from this device");
              }
            }, icon: Icon(Icons.email))
          ],),

        OutlinedButton(child: Text("Back to Login"), onPressed: (){
          Navigator.pop(context);
        })
        ],
      ))
    );
  }

}