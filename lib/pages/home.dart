import 'package:flutter/material.dart';
import 'package:happyfamily/services/Todo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<String> createAlertDialog(BuildContext context) {

    TextEditingController customController = TextEditingController();

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('New To-do'),
        content: TextField(
          controller: customController,
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('SUBMIT'),
            onPressed: () {
              Navigator.of(context).pop(customController.text.toString());
            },
          )
        ],
      );
    });
  }

  List<Todo> todoItems = [
    Todo(author: 'me', content: 'absd')
  ];
  List<Todo> completedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createAlertDialog(context).then((task) {

            if(task.length > 0) {
              setState(() => todoItems.add(Todo(author: 'oi', content: task)));
            }
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                'Completed Items (${completedItems.length})',
                style: TextStyle(
                  color: Colors.grey[400],
                )
            ),
            SizedBox(height: 20),
            new Expanded(
                child: ListView.builder(
                    itemCount: todoItems.length,
                    itemBuilder: (context, index) {
                      return Ink(
                        color: Colors.grey[900],
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              completedItems.add(todoItems[index]);
                              return todoItems.remove(todoItems[index]);
                            });
                          },
                          title: Text(
                            todoItems[index].content,
                            style: TextStyle(
                              color: Colors.amberAccent[200],
                            ),
                          ),
                        ),
                      );
                    }),
            )

          ],
        ),
      ),
    );
  }
}
