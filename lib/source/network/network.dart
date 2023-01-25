import 'package:http/http.dart' as http;
import 'package:proses/source/network/api.dart';

class MyNetwork {
  Future detkp(id_partai) async {
    try {
      var url = Uri.parse(MyApi.detkp(id_partai));
      var response = await http.get(url, headers: {
        'Authorization': MyApi.token(),
      });
      return response;
    } catch (e) {
      print('ERROR NETWORK DETKP: $e');
    }
  }
  Future jodetkp(id_partai) async {
    try {
      var url = Uri.parse(MyApi.jodetkp(id_partai));
      var response = await http.get(url, headers: {
        'Authorization': MyApi.token(),
      });
      return response;
    } catch (e) {
      print('ERROR NETWORK JO_DETKP: $e');
    }
  }
}
