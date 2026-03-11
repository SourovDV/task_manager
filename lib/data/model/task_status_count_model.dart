import 'task_status_model.dart';

class Task_status_count {
  String? status;
  List<TaskStatusModel>? data;

  Task_status_count({this.status, this.data});

  Task_status_count.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <TaskStatusModel>[];
      json['data'].forEach((v) {
        data!.add( TaskStatusModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

