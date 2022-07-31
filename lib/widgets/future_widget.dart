import 'package:flutter/material.dart';
import 'package:joelslist/widgets/custom_text.dart';

class FutureWidget<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function()? loading;
  final Widget Function(T? data) onData;
  final Widget Function(Object? error)? onError;

  const FutureWidget(
      {Key? key,
      required this.future,
      required this.onData,
      this.loading,
      this.onError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future, // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasData) {
          return onData(snapshot.data);
        } else if (snapshot.hasError) {
          return onError?.call(snapshot.error) ?? Center(
            child: CustomText(text: snapshot.error.toString())
          );
        } else {
          return loading?.call() ?? const Center(
            child : CircularProgressIndicator()
          );
        }
      },
    );
  }
}
