import 'package:http/http.dart' as http;
import 'RegPage.dart';

class Http {
  static Future<List<Student>> fetchProducts() async {
    var response = await http.get(Uri.parse(
        "https://llabdemo.orell.com/api/masters/anonymous/getAcademicYear/32"));
    if (response.statusCode == 200) {
      var data = response.body;
      return studentFromJson(data);
    } else {
      var data = response.body;
      return studentFromJson(data);
    }
  }
}
