import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_app/models/models.dart';
import 'package:qr_reader_app/providers/provider.dart';
import 'package:qr_reader_app/screens/screens.dart';
import 'package:qr_reader_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text('Historial'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever_outlined),
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false)
                  .borrarTodos();
            },
          ),
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final int currenIindex = uiProvider.selectedMenuOpt;

    // final nuevoScan = ScanModel(valor: "http://google.com");
    // DBProvider.db.nuevoScan(nuevoScan);
    // DBProvider.db.getScanById(11).then((value) => print(value?.valor));

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currenIindex) {
      case 0:
        scanListProvider.cargarSacansTipo("geo");
        return const MapsScreen();
      case 1:
        scanListProvider.cargarSacansTipo("http");

        return const DirectionsScreen();

      default:
        scanListProvider.cargarSacansTipo("geo");

        return const MapsScreen();
    }
  }
}
