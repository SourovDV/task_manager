class Urls {
  static final String _baseUrl = "https://task.teamrabbil.com/api/v1";
  static final String createUser = "$_baseUrl/registration";
  static final String loginUser = "$_baseUrl/login";
  static String deleteUser(String id) {
    return "$_baseUrl/deleteTask/$id";
  }
}
