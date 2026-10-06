import 'package:flutter/widgets.dart';

/// The mockup is drawn on a 310pt-wide canvas; measurements in the UI are in
/// those units and multiplied by [BuildContext.designScale].
const double kDesignWidth = 310;

extension DesignScale on BuildContext {
  /// How many real pixels one design unit is on this screen.
  double get designScale => MediaQuery.sizeOf(this).width / kDesignWidth;
}
