import 'package:dw_delivery_app/app/dw_delivery_app.dart';
import 'package:flutter/material.dart';

import 'app/core/config/env/env.dart';

void main() async {
  await Env.i.load();
  runApp(const DwDeliveryApp());
}
