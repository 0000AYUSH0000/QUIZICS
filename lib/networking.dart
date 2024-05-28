import 'dart:convert';
import 'package:http/http.dart' as http;
class DataGetter{
  Future<dynamic> getTriviaData({int amount = 10, int? category, String? difficulty, required String type}) async {
    var url = Uri.https('opentdb.com', '/api.php', {
      'amount': '$amount',
      if(category != Null) 'category': '$category',
      'difficulty': difficulty,
      'type': type,
    });

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if(data['response_code']!=0){
        throw('error');
      }
      var results = data['results'];
      return results;
    } else {
      throw Exception('Failed to load questions');
    }
  }

}
