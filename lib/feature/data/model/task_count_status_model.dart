import 'package:task_manager/feature/data/model/task_count_model.dart';

class TaskByStatusCount {
  String? status;
  List<TaskCountModel>? data;

  TaskByStatusCount({this.status, this.data});

  TaskByStatusCount.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <TaskCountModel>[];
      json['data'].forEach((v) {
        data!.add( TaskCountModel.fromJson(v));
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

