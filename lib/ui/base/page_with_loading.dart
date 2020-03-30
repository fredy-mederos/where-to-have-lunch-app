import 'package:flutter/material.dart';

class PageWithLoading extends StatelessWidget {
  final Stream<bool> loadingStream;
  final Widget child;

  const PageWithLoading({Key key, @required this.loadingStream, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: loadingStream,
      initialData: false,
      builder: (context, snapshot) {
        final isLoading = snapshot.data ?? false;
        return Stack(
          children: [
            child,
            if (isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        );
      },
    );
  }
}
