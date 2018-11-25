import 'package:cloud_firestore/cloud_firestore.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    List<Listmodel> todos = null;
    _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
      todos = snapshot
          .map((documentsnapshot) => Listmodel.fromSnapshot(documentsnapshot))
          .toList();
      return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Listcard(todos[index]),
            );
          });
    }

    void _composeEmail() async {
      final String result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Add(),
        ),
      );
      setState(() {
        var data = new Map<String, dynamic>();
        data['title'] = result;
        data['isDone'] = false;
        Firestore.instance.collection('todo').add(data);

        todos.add(Listmodel(result));
      });
    }

    _buildRow(BuildContext context) {
      Firestore.instance.collection('todo');
      return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('todo').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return _buildList(context, snapshot.data.documents);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildRow(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _composeEmail,
        tooltip: 'Compose Email',
        child: Icon(Icons.add),
      ),
    );
  }
}
