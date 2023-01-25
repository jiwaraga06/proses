part of 'detail_cubit.dart';

@immutable
abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {
  final String? id_partai;
  final int? statusCode;
  dynamic json;
  dynamic jsonJO;

  DetailLoaded({this.id_partai, this.json, this.statusCode, this.jsonJO});
}

class DetailScanQRLoading extends DetailState {}

class DetailScanQRLoaded extends DetailState {}
