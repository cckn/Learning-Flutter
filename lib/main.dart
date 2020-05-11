import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class Todo {
  bool isDone;
  String title;

  Todo(this.title, {this.isDone = false});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData.dark(),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  var _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Remain ToDos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('todo').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  final documents = snapshot.data.documents;
                  return Expanded(
                      child: ListView(
                    children:
                        documents.map((doc) => _buildItemWidget(doc)).toList(),
                  ));
                }),
            Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                  controller: _todoController,
                )),
                RaisedButton(
                  child: Text("Add"),
                  onPressed: () => _addTodo(Todo(_todoController.text.trim())),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemWidget(DocumentSnapshot doc) {
    final todo = Todo(doc['title'], isDone: doc['isDone']);

    return ListTile(
        onTap: () {
          _toggleTodo(doc);
        },
        title: Text(todo.title,
            style: todo.isDone
                ? TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontStyle: FontStyle.italic,
                    color: Colors.white54)
                : null),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () {
            // RemoveBtn 누를 시 To-do 삭제
            _removeTodo(doc);
          },
        ));
  }

  void _addTodo(Todo todo) {
    Firestore.instance
        .collection('todo')
        .add({"title": todo.title, "isDone": todo.isDone});
    _todoController.text = ""; // Reset to-do input form
  }

  void _removeTodo(DocumentSnapshot doc) {
    Firestore.instance.collection('todo').document(doc.documentID).delete();
  }

  void _toggleTodo(DocumentSnapshot doc) {
    Firestore.instance.collection('todo').document(doc.documentID).updateData({
      'isDone': !doc['isDone'],
    });
  }
}
