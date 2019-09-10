import 'package:tasks/src/data/contracts/model_contract.dart';

class TaskModel implements ModelContract {
  int _id;
  String _title;
  int _done;
  int _projectId;
  String _note;

  int get id => this._id;
  String get title => this._title;
  bool get done => this._done == 1 ? true : false;
  int get projectId => this._projectId;
  String get note => this._note;

  set title(String title) {
    this._title = title;
  }

  set done(bool done) {
    this._done = done ? 1 : 0;
  }

  set projectId(int id) {
    this._projectId = id;
  }

  set note(String note) {
    this._note = note;
  }

  /// Constructor of a task model object.
  TaskModel({int id, String title, bool done, int projectId, String note}) {
    this._id = id;
    this._title = title;
    this._done = done ? 1 : 0;
    this._projectId = projectId;
    this._note = note;
  }

  /// Constructor of a task model object from a Map object.
  TaskModel.from(Map<String, dynamic> object) {
    this._id = object['id'];
    this._title = object['title'];
    this._done = object['done'];
    this._projectId = object['projectId'];
    this._note = object['note'];
  }

  /// Returns a map object to representation of this object.
  Map<String, dynamic> toMap() {
    var object = Map<String, dynamic>();
    object['id'] = this._id;
    object['title'] = this._title;
    object['done'] = this._done;
    object['projectId'] = this._projectId;
    object['note'] = this._note;
    return object;
  }
}
