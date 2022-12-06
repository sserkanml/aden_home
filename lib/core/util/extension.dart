import 'package:flutter/widgets.dart';

extension OnBuildContext on BuildContext {
  String getPath({required String folder, required String file}) {
    return "assets/$folder/$file";
  }

  EdgeInsetsGeometry paddingAll({double? value}) {
    return EdgeInsets.all(value ?? 16);
  }
}
