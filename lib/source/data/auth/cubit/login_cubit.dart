import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:proses/source/repository/repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final MyRepository? myRepository;
  LoginCubit({required this.myRepository}) : super(LoginInitial());
}
