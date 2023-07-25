import 'package:flutter/material.dart';
//splash model
class SplashModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;
  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

//dispose
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}