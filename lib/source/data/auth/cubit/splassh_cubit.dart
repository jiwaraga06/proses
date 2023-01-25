import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:proses/source/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splassh_state.dart';

class SplasshCubit extends Cubit<SplasshState> {
  final MyRepository? myRepository;
  SplasshCubit({required this.myRepository}) : super(SplasshInitial());

  void session(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var email = pref.getString("email");
    print("Email: $email");
  }
}
