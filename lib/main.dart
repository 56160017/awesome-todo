import 'package:flutter/material.dart';
import 'package:flutter_homework/detail/add.dart';
import 'package:flutter_homework/listcard.dart';
import 'package:flutter_homework/listmodel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Listmodel> lists = List<Listmodel>();


  @override
  void initState() {
    super.initState();
    lists.add(Listmodel(title: "ios"));
    lists.add(Listmodel(title: "web"));
    lists.add(Listmodel(title: "andoird"));
    lists.add(Listmodel(title: "backend"));
  }

  void _composeEmail()async{
    setState(() async {
     // lists.add(Listmodel(title: "aaaa"));
      final result = await  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Add(),
        ),
      );
      lists.add(Listmodel(title: result));
    });
  }

  @override
  Widget build(BuildContext context) {
    var child = Container(
      child: ListView.builder(
          itemCount: lists.length,
          itemBuilder: (buildContext, position) {
            return GestureDetector(
              //onTap: () => _viewEmailDetail(position),
              child: Listcard(lists[position]),
            );
          }),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
        ,
      ),
      body: child,
      floatingActionButton: FloatingActionButton(
        onPressed: _composeEmail,
        tooltip: 'Compose Email',
        child: Icon(Icons.add),
      ),
    );
  }
}
