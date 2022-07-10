import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_to_have_lunch/di/injector.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

abstract class StateWithBloC<W extends StatefulWidget, STATE extends Equatable, B extends BlocBase<STATE>> extends State<W> {
  late B bloC;
  late Logger logger;

  @override
  void initState() {
    super.initState();
    bloC = Injector.instance!.getNewBloC();
    logger = Injector.instance!.getLogger();
  }

  @override
  void dispose() {
    bloC.close();
    super.dispose();
  }

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloC,
      child: BlocConsumer<B, STATE>(
        listener: onNewState,
        builder: (context, state) => buildWidget(context, state),
      ),
    );
  }

  ///Use this one instead of [build]
  Widget buildWidget(BuildContext context, STATE state);

  onNewState(BuildContext context, STATE state) {}
}
