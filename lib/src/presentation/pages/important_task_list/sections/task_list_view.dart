part of '../important_task_list_layout.dart';

class _TaskListView extends StatelessWidget {
  /// Create a _TaskListView widget.
  _TaskListView({
    Key key,
    @required this.items,
  }) : super(key: key);

  final List<TaskEntity> items;

  /// Build the _TaskListView widget.
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ImportantTaskListController>(context);
    return ListView.separated(
      padding: const EdgeInsets.all(0),
      itemCount: this.items.length,
      itemBuilder: (BuildContext context, int index) {
        TaskEntity item = this.items.elementAt(index);
        return GestureDetector(
          child: TaskListTile(
            key: Key(item.id.toString()),
            data: item,
            onChanged: (TaskEntity model) {
              controller.updateTask(item, model);
            },
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              '/task',
              arguments: <String, dynamic>{
                'component': controller,
                'model': item,
              },
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 0,
          color: Color(0xff979797),
        );
      },
    );
  }
}