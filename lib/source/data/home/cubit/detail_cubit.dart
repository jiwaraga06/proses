import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:meta/meta.dart';
import 'package:proses/source/repository/repository.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  final MyRepository? myRepository;
  DetailCubit({required this.myRepository}) : super(DetailInitial());

  void dektp(id_partai) async {
    emit(DetailLoading());
    myRepository!.detkp(id_partai).then((value) {
      var json = jsonDecode(value.body);

      // print('Deta detkp: $json');
      myRepository!.jodetkp(id_partai).then((value) {
        var jsonJO = jsonDecode(value.body);
        print('Deta JO_detkp: $jsonJO');
        emit(DetailLoaded(id_partai: id_partai, json: json, jsonJO: jsonJO, statusCode: value.statusCode));
      });
    });
  }

  void scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#0081C9', 'Cancel', true, ScanMode.QR);
      print("Result Scan:  $barcodeScanRes");
      if (barcodeScanRes != '-1') {
        dektp(barcodeScanRes);
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }
}
