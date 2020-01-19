import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/ui/base/bloc_base.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

class LoginBloC extends BaseBloC {

  final UserRepository userRepository;
  final Logger logger;

  LoginBloC(this.userRepository, this.logger);

  void login() async {
    try {
      var user = await userRepository.login();
    } catch (ex) {
      logger.log(ex);
    }
  }

  @override
  void dispose() {}
}
