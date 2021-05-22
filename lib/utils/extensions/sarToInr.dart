import 'package:fluttertest/constants.dart';

extension SarToInr on double {
  String sarToInr() => (this * Constants.sarConversionRate).toStringAsFixed(2);
}
