class Urls{
  static final _baseUrl = "https://task.teamrabbil.com/api/v1";
  static final register = "$_baseUrl/registration";
  static final login="$_baseUrl/login";
  static final createData = "$_baseUrl/createTask";
  static final taskCount = "$_baseUrl/taskStatusCount";
  static String taskCountById(String id) {
    return "$_baseUrl/listTaskByStatus/$id";
  }
  static String deleteData(String id)=>"$_baseUrl/deleteTask/$id";

}
