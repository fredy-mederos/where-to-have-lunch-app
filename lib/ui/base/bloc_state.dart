import 'package:flutter/widgets.dart';
import 'package:where_to_have_lunch/di/bloc_provider.dart';
import 'package:where_to_have_lunch/di/injector.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

import 'bloc_base.dart';

///This state already setups a [BlocProvider] as it's main child.
abstract class StateWithBloC<W extends StatefulWidget, B extends BaseBloC> extends State<W> {

  ///Current bloc instance
  B bloc;
  Logger logger;

  @override
  void initState() {
    super.initState();
    logger = Injector.instance.getLogger();
    bloc = Injector.instance.getNewBloc();
    logger.log('$runtimeType initState');
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
    logger.log('$runtimeType dispose');
  }

  @override
  Widget build(BuildContext context) {
    logger.log('$runtimeType build');
    return BlocProvider(
      bloc: bloc,
      child: buildWidget(context),
    );
  }

  ///Use this one instead of [build]
  Widget buildWidget(BuildContext context);
}
