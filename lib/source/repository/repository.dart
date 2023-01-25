import 'package:proses/source/network/network.dart';

class MyRepository {
  final MyNetwork? myNetwork;

  MyRepository({required this.myNetwork});

  Future detkp(id_partai) async {
    final json = await myNetwork!.detkp(id_partai);
    return json;
  }
  Future jodetkp(id_partai) async {
    final json = await myNetwork!.jodetkp(id_partai);
    return json;
  }
}
