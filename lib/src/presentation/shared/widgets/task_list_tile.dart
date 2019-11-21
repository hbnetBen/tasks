import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasks/src/data/models/task_model.dart';
import 'package:tasks/src/presentation/shared/widgets/circle_checkbox.dart';
import 'package:tasks/src/utils/date_time_util.dart';

import 'icon_checkbox.dart';

class TaskListTile extends StatefulWidget {
  /// Create a TaskListTile widget.
  TaskListTile({
    Key key,
    @required this.data,
    @required this.onChanged,
  }): assert(data != null),
      assert(onChanged != null),
      super(key: key);
  
  final TaskModel data;
  final ValueChanged<TaskModel> onChanged;

  /// Creates the mutable state for this widget at a given location in the tree.
  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  TaskModel data;
  Color metaColor = Color(0xff878787);

  /// Called when this state first inserted into tree.
  @override
  void initState() {
    super.initState();
    this.data = this.widget.data;
  }

  /// Called when a dependency of this state object changes.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /// Called whenever the widget configuration changes.
  @override
  void didUpdateWidget(TaskListTile old) {
    super.didUpdateWidget(old);
  }

  /// Called when this state removed from the tree.
  @override
  void dispose() {
    super.dispose();
  }

  /// Build the TaskListTile widget with state.
  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[];

    children.add(
      Text(
        this.data.title,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    if (this.data.dueDate != null) {
      int days = DateTimeUtil.difference(this.data.dueDate).inDays;
      this.metaColor = days >= 0 ? Colors.blue : Colors.red;
      children.add(const SizedBox(height: 5.0));
      children.add(
        Row(
          children: <Widget>[
            Icon(
              Icons.calendar_today,
              size: 16.0,
              color: this.metaColor,
            ),
            const SizedBox(width: 4.5),
            Text(
              DateFormat('EEEE, y/M/d').format(this.data.dueDate),
              style: TextStyle(
                fontSize: 14.0,
                color: this.metaColor,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.all(0.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 5.0,
        ),
        leading: CircleCheckbox(
          value: this.data.done,
          onChanged: (bool checked) {
            this.data.done = checked;
            this.widget.onChanged(this.data);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
        trailing: IconCheckbox(
          value: this.data.important,
          icon: Icons.star,
          onChanged: (bool checked) {
            this.data.important = checked;
            this.widget.onChanged(this.data);
          },
        ),
        onTap: () {
          Navigator.of(this.context).pushNamed('/task', arguments: this.data);
        },
      ),
    );
  }
}
