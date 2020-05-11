import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Todo {
  bool isDone = false;
  String title;

  Todo(this.title);
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
  final _items = <Todo>[];

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
            Expanded(
                child: ListView(
              children: _items.map((todo) => _buildItemWidget(todo)).toList(),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildItemWidget(Todo todo) {
    return ListTile(
        onTap: () {
          //Todo: Todo 누를 시 isDone = !isDone
          _toggleTodo(todo);
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
            // TODO: RemoveBtn 누를 시 Todo 삭제
            _removeTodo(todo);
          },
        ));
  }

  void _addTodo(Todo todo) {
    setState(() {
      _items.add(todo);
      _todoController.text = ""; // Reset to-do input form
    });
  }

  void _removeTodo(Todo todo) {
    setState(() {
      _items.remove(todo);
    });
  }

  void _toggleTodo(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
}
