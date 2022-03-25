import 'package:flutter/material.dart';
import 'package:qr_reader_app/models/models.dart';
import 'package:qr_reader_app/providers/provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    nuevoScan.id = id;
    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }
  }

  cargarSacans() async {
    final scans = await DBProvider.db.getAllSacans();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarSacansTipo(String tipo) async {
    final scans = await DBProvider.db.getScansPorTipo(tipo);
    this.scans = [...scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarScan(int id) async {
    await DBProvider.db.deleteScan(id);
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }
}
