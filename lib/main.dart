import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 06',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Lab 06: Shopping List'),
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
  List<String> list1 = [];

  var list2 = <String>[];

  var isChecked = false;
  var myFontSize = 0.0;
  late TextEditingController _controller;
  late TextEditingController _qtyController;
  late TextEditingController _freshController;

  //you're visible
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _qtyController = TextEditingController();
    _freshController = TextEditingController();
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
      body: ListPage(),

    );
  }

  Widget ListPage()
  {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Row( mainAxisAlignment: MainAxisAlignment.start, children:[

            Flexible( flex:2, child:
            Padding(padding: EdgeInsets.fromLTRB(8, 10, 0, 8),
                child:
                TextField(controller: _controller,
                    decoration: InputDecoration(
                        hintText: "Item Name",
                        border: OutlineInputBorder(),
                        labelText: "Type item name here"
                    )
                ))),
            Flexible( flex:2, child:
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 8, 8),
                child:
                TextField(controller: _qtyController,
                    decoration: InputDecoration(
                        hintText: "Quantity",
                        border: OutlineInputBorder(),
                        labelText: "Type the quantity here"
                    )
                ))),
            Flexible( flex:2, child:
            Padding(padding: EdgeInsets.fromLTRB(8, 10, 0, 8),
                child:
                TextField(controller: _freshController,
                    decoration: InputDecoration(
                        hintText: "Freshness",
                        border: OutlineInputBorder(),
                        labelText: "How fresh is this?"
                    )
                ))),

            Flexible(
                flex:1,
                child: ElevatedButton( child:Text("Add item"), onPressed:() {
                  setState(() {
                    list1.add(_controller.value.text + " Quantity: " + _qtyController.value.text + " Freshness: " + _freshController.value.text);
                    _controller.text = "";
                    _qtyController.text = "";
                    _freshController.text = "";
                  });
                } )
            ),
          ]),

          Expanded(child:
          ListView.builder(
              itemCount: list1.length,
              itemBuilder:(context, rowNum) {
                return
                  GestureDetector(
                    onLongPress: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Delete this?'),
                          content: const Text('are you sure?'),
                          actions: <Widget>[
                            FilledButton(child:Text("Yes"), onPressed:() {
                              setState(() {
                                list1.removeAt(rowNum);
                              });

                              Navigator.pop(context);
                            }),
                            FilledButton(child:Text("Cancel"), onPressed:() {
                              Navigator.pop(context);
                            },),],),);},
                    child:
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                        children:[ Text("${rowNum + 1}: ${list1[rowNum]}")]),
                  );




              })
          ),
        ]);
  }
}
