import 'package:flutter/material.dart';

const _minTabletWidth = 850;
const _minDesktopWidth = 1000;

// This isMobile, isTablet, isDesktop helep us later
bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < _minTabletWidth;

bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width < _minDesktopWidth &&
    MediaQuery.of(context).size.width >= _minTabletWidth;

bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= _minDesktopWidth;

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (_size.width >= _minDesktopWidth) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (_size.width >= _minTabletWidth && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
