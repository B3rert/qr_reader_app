import 'package:flutter/material.dart';
import 'package:qr_reader_app/widgets/widgets.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScansTiles();
  }
}
