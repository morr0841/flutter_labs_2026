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

  //you're visible
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _qtyController = TextEditingController();
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

          Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:[

            Flexible( flex:2, child:TextField(controller: _controller,
              decoration: InputDecoration(
              hintText: "Item Name",
              border: OutlineInputBorder(),
              labelText: "Item field"
              )
            )),
            Flexible( flex:2, child:TextField(controller: _qtyController,
              decoration: InputDecoration(
              hintText: "Quantity",
              border: OutlineInputBorder(),
              labelText: "Quantity field"
              )
            )),

            Flexible(
              flex:1,
              child: ElevatedButton( child:Text("Add item"), onPressed:() {
                setState(() {
                  list1.add(_controller.value.text + ": Quantity: " + _qtyController.value.text);
                  _controller.text = "";
                  _qtyController.text = "";
                });
              } )
            ),
          ]),

          Expanded(child:
          ListView.builder(
              itemCount: list1.length,
              itemBuilder:(context, rowNum) =>
                  GestureDetector(child:Text("Row $rowNum is: ${list1[rowNum]}") ,
                      onHorizontalDragUpdate: (details) {

                        if(details.primaryDelta!*details.primaryDelta! > 50.0) {
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

                                  }),
                                ],
                              )
                          );
                        }

                      })
          )
          )
        ]);
  }
}
