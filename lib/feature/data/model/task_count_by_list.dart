import 'package:task_manager/feature/data/model/task_count_list_model.dart';

class TaskCountByList {
  String? status;
  List<TaskCountListModel>? data;

  TaskCountByList({this.status, this.data});

  TaskCountByList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <TaskCountListModel>[];
      json['data'].forEach((v) {
        data!.add(new TaskCountListModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

