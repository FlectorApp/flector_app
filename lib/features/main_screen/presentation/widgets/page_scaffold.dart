import 'package:flector/core/presentation/theme/dimen.dart';
import 'package:flutter/material.dart';

class PageScaffold extends StatelessWidget {
  final Widget header;
  final List<Widget> children;

  const PageScaffold({
    Key? key,
    required this.header,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding * 2),
      child: Column(
        children: [
          header,
          const SizedBox(height: defaultPadding),
          ...children,
        ],
      ),
    ));
  }
}
