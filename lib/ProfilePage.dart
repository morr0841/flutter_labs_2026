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
    _loadProfileData();
    Future.delayed(Duration(seconds: 0), (){
      var snackBar =
      SnackBar( content: Text('Welcome to your profile page ${DataRepository.loginName}!'),
        action: SnackBarAction(label: 'Thanks!', onPressed: ( ){ }),
      );
      //this displays it:
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  Future<void> _loadProfileData() async {
    await DataRepository.loadData();

    if (DataRepository.firstName.isNotEmpty) {
      _fNameController.text = DataRepository.firstName;
    }

    if (DataRepository.lastName.isNotEmpty) {
      _lNameController.text = DataRepository.lastName;
    }

    if (DataRepository.phone.isNotEmpty) {
      _phoneController.text = DataRepository.phone;
    }

    if (DataRepository.email.isNotEmpty) {
      _emailController.text = DataRepository.email;
    }

    setState(() {});
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
              var phone = _phoneController.text.trim();
              var number = Uri.parse("tel:$phone");
              var canCall = await canLaunchUrl(number);

              if(canCall)
              launchUrl(number);
              else
              {
                const snackBar = SnackBar( content: Text('You can not call from this device.') );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }, icon: Icon(Icons.phone)),
            IconButton(onPressed: () async {
              var text = _phoneController.text.trim();
              var number = Uri.parse("sms:$text");
              var canText = await canLaunchUrl(number);

              if(canText)
              launchUrl(number);
              else
              {
                const snackBar = SnackBar( content: Text('You can not text from this device.') );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
              var address = _emailController.text.trim();
              var email = Uri.parse("mailto:$address");
              var canEmail = await canLaunchUrl(email);

              if(canEmail)
              launchUrl(email);
              else
              {
                const snackBar = SnackBar( content: Text('You can not email from this device.') );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }, icon: Icon(Icons.email))
          ],),

        OutlinedButton(child: Text("Back to Login"), onPressed: (){
          Navigator.pop(context);
        }),
          OutlinedButton(child:const Text("Save Fields?"), onPressed: () {
            var firstName = _fNameController.value.text;
            var lastName = _lNameController.value.text;
            var phone = _phoneController.value.text;
            var email = _emailController.value.text;

            DataRepository.saveData(fName: firstName,
                lName: lastName,
                phoneField: phone,
                emailField: email);
            const snackBar = SnackBar( content: Text('Your fields have been saved.') );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },),
        ],
      ))
    );
  }

}