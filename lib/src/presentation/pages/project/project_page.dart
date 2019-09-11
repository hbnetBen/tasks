import 'package:flutter/material.dart';
import 'package:tasks/src/data/models/category_model.dart';
import 'package:tasks/src/data/models/project_model.dart';
import 'package:tasks/src/data/models/task_model.dart';
import 'package:tasks/src/presentation/pages/project/project_page_bloc.dart';
import 'package:tasks/src/presentation/pages/task/task_page.dart';
import 'package:tasks/src/presentation/shared/widgets/new_task_form.dart';

class ProjectPage extends StatefulWidget {
  final ProjectModel project;

  ProjectPage({@required this.project});

  @override
  State<StatefulWidget> createState() {
    return _ProjectPageState();
  }
}

class _ProjectPageState extends State<ProjectPage> {
  ProjectPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ProjectPageBloc(project: widget.project);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _headerPage(widget.project),
      body: _bodyPage(widget.project)
    );
  }

  Widget _headerPage(ProjectModel object) {
    Widget _title = Text(object.title);

    return AppBar(
      title: _title
    );
  }

  Widget _bodyPage(ProjectModel object) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: _buildContent()
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Icon(Icons.add),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return NewTaskForm(projectId: object.id);
                    }
                  ).then((task) {
                    _bloc.addTask(task);
                  });
                }
              )
            ]
          )
        ]
      )
    );
  }

  Widget _buildContent() {
    return StreamBuilder(
      stream: _bloc.streamTasks,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator()
          );
        } else {
          if (snapshot.hasData && snapshot.data.isNotEmpty) {
            return _buildListView(snapshot.data);
          } else {
            return Center(
              child: Text('Empty Task')
            );
          }
        }
      }
    );
  }

  Widget _buildListView(List<TaskModel> tasks) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, int index) {
        final task = tasks[index];
        return ListTile(
          leading: Checkbox(
            value: task.done,
            onChanged: (bool checked) {
              task.done = checked;
              _bloc.updateTask(task);
            }
          ),
          title: Text(task.title),
          trailing: PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'delete',
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Delete')
                  )
                )
              ];
            },
            onSelected: (action) {
              if (action == 'delete') {
                _bloc.deleteTask(task);
              }
            },
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskPage(task: task)
              )
            );
          },
        );
      }
    );
  }
}
