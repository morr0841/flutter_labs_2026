import 'package:flutter/material.dart';
import 'package:my_flutter_labs/Item.dart';
import 'package:my_flutter_labs/ItemDatabase.dart';
import 'package:sqflite/sqflite.dart';
import 'ItemDao.dart';
import 'Item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 8',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Week 8: Using SQL'),
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
  List<Item> list1 = [];

  var list2 = <String>[];
  Item? selectedItem = null;
  late ItemDao itemDao;
  var isChecked = false;
  var myFontSize = 0.0;
  late TextEditingController _controller;
  late TextEditingController _qtyController;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _qtyController = TextEditingController();

    //load whats in the DB
    final database = $FloorItemDatabase.databaseBuilder('ItemFile.db').build().then( (database) {
    itemDao = database.myDao;

    //query all data
    itemDao.getAllItems().then( ( listOfItems ) {
      setState(() { //redraw GUI
        list1 = listOfItems; //put the items in the list
      });
    });
    } );
  }

  @override
  void dispose() {
    super.dispose();
    //free memory:
    _controller.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: reactiveLayout(),

    );
  }

  Widget reactiveLayout(){

    var size = MediaQuery.of(context).size; ///how big is the screen?
    var height = size.height;
    var width = size.width;



    if( (width>height) && (width > 720)) {
      //tablet
      return Row( children:[
        Expanded(child: ListPage(),    flex:2), //Left side 40%
        Expanded(child: DetailsPage(), flex:3) //Right side, 60%
      ]);
    }
    else{ //Portrait mode / Phone
      if( selectedItem== null)
        return ListPage(); //show the list
      else
        return DetailsPage(); //show the details
    }
  }

  Widget DetailsPage() {
    if(selectedItem != null){
      return Center(child:Column( mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Name: ${selectedItem!.name}", style: TextStyle(fontSize: 40.0),),
        Text("Quantity: ${selectedItem!.quantity}", style: TextStyle(fontSize: 40.0)),
        Spacer(),
        OutlinedButton(onPressed: () async{
          Item deleteThisItem = selectedItem!;

          await itemDao.deleteItem(deleteThisItem);

          final updatedList = await itemDao.getAllItems();

          setState(() {
            list1 = updatedList;
            selectedItem = null;
          });
        }, child: Text("Delete")),


        OutlinedButton(onPressed: (){
          setState(() { selectedItem = null; });
        }, child: Text("Close"))

      ],)

      );
    }
    else{
      return Text("Please select an item from the list",style: TextStyle(fontSize: 30.0));
    }
  }

  Widget ListPage()
  {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Row( mainAxisAlignment: MainAxisAlignment.start, children:[

            Flexible( flex:2, child:
            Padding(padding: EdgeInsets.fromLTRB(25, 25, 0, 8),
                child:
                TextField(controller: _controller,
                    decoration: InputDecoration(
                        hintText: "Item Name",
                        border: OutlineInputBorder(),
                        labelText: "Type item name here"
                    )
                ))),
            Flexible( flex:2, child:
            Padding(padding: EdgeInsets.fromLTRB(0, 25, 8, 8),
                child:
                TextField(controller: _qtyController,
                    decoration: InputDecoration(
                        hintText: "Quantity",
                        border: OutlineInputBorder(),
                        labelText: "Type the quantity here"
                    )
                ))),

            Flexible(
                flex:1,
                child: ElevatedButton( child:Text("Add item"), onPressed:() async {
                  Item newItem = Item(Item.ID++, int.parse(_qtyController.value.text), _controller.value.text);
                  await itemDao.insertItem(newItem);
                  final updatedList = await itemDao.getAllItems();

                  setState(() {
                    list1 = updatedList;
                  });

                  _controller.clear();
                  _qtyController.clear();
                } )
            ),
          ]),

          Expanded(child:
          ListView.builder(
              itemCount: list1.length,
              itemBuilder:(context, rowNum) {
                return
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = list1[rowNum];
                      });
                    },
                    child:
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                        children:[ Text("Item ${rowNum + 1} - Name: ${list1[rowNum].name}, Quantity: ${list1[rowNum].quantity}")]),
                  );




              })
          ),
        ]);
  }
}
