import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:tasks/src/core/contracts/model_contract.dart';
import 'package:tasks/src/utils/data_support.dart';

class ProjectModel implements ModelContract{
  /// Constructor of a project model object.
  ProjectModel({
    int id,
    @required String title,
    @required String description,
    @required int categoryId,
    @required DateTime created,
    @required Color color,
    @required IconData icon
  }) {
    this._id = id;
    this._title = title;
    this._description = description;
    this._categoryId = categoryId;
    this._created = created;
    this._color = color;
    this._icon = icon;
  }

  /// Constructor of a project model object from a Map object.
  /// 
  /// The [data] argument must not be null.
  ProjectModel.from(Map<String, dynamic> data) {
    this._id = data['id'];
    this._title = data['title'];
    this._description = data['description'];
    this._categoryId = data['category_id'];
    this._created = DateTime.parse(data['created']);
    this._color = Color(int.parse(data['color']));
    this._icon = DataSupport.icons[data['icon']];
  }

  int _id;
  String _title;
  String _description;
  int _categoryId;
  DateTime _created;
  Color _color;
  IconData _icon;

  /// Get the project id.
  int get id => this._id;

  /// Get the project title.
  String get title => this._title;

  /// Get the project description.
  String get description => this._description;

  /// Get the category id of project.
  int get categoryId => this._categoryId;

  /// Get the date the project was created.
  DateTime get created => this._created;

  /// Get the project color.
  Color get color => this._color;

  /// Get the project icon.
  IconData get icon => this._icon;

  /// Set the project title.
  set title(String title) {
    this._title = title;
  }

  /// Set new project description.
  set description(String description) {
    this._description = description;
  }

  /// Set new category id of project.
  set categoryId(int categoryId) {
    this._categoryId = categoryId;
  }

  /// Set new the project color.
  set color(Color color) {
    this._color = color;
  }

  /// Set new the project icon.
  set icon(IconData icon) {
    this._icon = icon;
  }

  /// Returns a map object to representation of this model object.
  @override
  Map<String, dynamic> toMap() {
    final icons = DataSupport.icons;
    String icon = icons.keys.firstWhere((String key) {
      if (icons[key] == this._icon) {
        return true;
      } else {
        return false;
      }
    });

    var project = Map<String, dynamic>();
    project['id'] = this._id;
    project['title'] = this._title;
    project['description'] = this._description;
    project['category_id'] = this._categoryId;
    project['created'] = this._created.toString();
    project['color'] = this._color.value.toString();
    project['icon'] = icon;
    return project;
  }
}
