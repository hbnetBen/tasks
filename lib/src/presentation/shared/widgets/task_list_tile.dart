import 'package:flutter/material.dart';
import 'package:tasks/src/data/models/task_model.dart';
import 'package:tasks/src/presentation/ui_colors.dart';

class TaskListTile extends StatefulWidget {
  final TaskModel task;
  final ValueChanged<TaskModel> onChanged;

  TaskListTile({
    Key key,
    @required this.task,
    @required this.onChanged
  }): assert(task != null),
      assert(onChanged != null),
      super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  @override
  Widget build(BuildContext context) {
    final task = this.widget.task;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: UIColors.Grey,
            blurRadius: 8.0,
            spreadRadius: 1.0,
            offset: Offset(0.0, 1.0)
          )
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
        leading: Checkbox(
          value: task.done,
          onChanged: (bool check) {
            setState(() {
              task.done = check;
              this.widget.onChanged(task);
            });
          },
        ),
        title: Text(
          task.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w600
          )
        )
      )
    );
  }
}
