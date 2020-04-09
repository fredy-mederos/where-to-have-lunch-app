import 'package:flutter/widgets.dart';
import 'package:where_to_have_lunch/di/injector.dart';
import 'package:where_to_have_lunch/di/viewmodel_provider.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/base_viewmodel.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

///This state already setups a [ViewModel] as it's main child.
abstract class StateWithViewModel<W extends StatefulWidget, B extends BaseViewModel> extends State<W> {
  ///Current viewModel instance
  B viewModel;
  Logger logger;

  @override
  void initState() {
    super.initState();
    logger = Injector.instance.getLogger();
    viewModel = Injector.instance.getNewViewModel();
    logger.log('$runtimeType initState');
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.dispose();
    logger.log('$runtimeType dispose');
  }

  @override
  Widget build(BuildContext context) {
    logger.log('$runtimeType build');
    return ViewModelProvider(
      viewModel: viewModel,
      child: buildWidget(context),
    );
  }

  ///Use this one instead of [build]
  Widget buildWidget(BuildContext context);
}
