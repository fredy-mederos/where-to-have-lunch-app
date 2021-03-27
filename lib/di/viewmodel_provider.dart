import 'package:flutter/widgets.dart';

/// A Flutter widget which provides a viewModel to its children via `ViewModelProvider.of(context)`.
/// It is used as a DI widget so that a single instance of a viewModel can be provided
/// to multiple widgets within a subtree.
class ViewModelProvider<T> extends InheritedWidget {
  /// The [ViewModel] which is to be made available throughout the subtree
  final T viewModel;

  /// The [Widget] and its descendants which will have access to the [ViewModel].
  final Widget child;

  ViewModelProvider({
    Key? key,
    required this.viewModel,
    required this.child,
  })  : assert(viewModel != null),
        super(key: key, child: child);

  /// Method that allows widgets to access the viewModel as long as their `BuildContext`
  /// contains a `ViewModelProvider` instance.
  static T of<T>(BuildContext context) {
    final ViewModelProvider<T> provider = context.findAncestorWidgetOfExactType<ViewModelProvider<T>>()!;

    if (provider == null) {
      throw FlutterError('ViewModelProvider.of() called with a context that does not contain a ViewModel of type $T.\n'
          'No ancestor could be found starting from the context that was passed '
          'to ViewModelProvider.of<$T>(). This can happen '
          'if the context you use comes from a widget above the ViewModelProvider.\n'
          'The context used was:\n'
          '  $context');
    }
    return provider.viewModel;
  }

  @override
  bool updateShouldNotify(ViewModelProvider oldWidget) => false;
}
