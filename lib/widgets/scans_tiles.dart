import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_app/providers/provider.dart';

class ScansTiles extends StatelessWidget {
  const ScansTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listScanProvider = Provider.of<ScanListProvider>(context);
    final scnas = listScanProvider.scans;

    return ListView.builder(
      itemCount: scnas.length,
      itemBuilder: (_, int index) {
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            child: const Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),
            color: Colors.red,
          ),
          onDismissed: (direction) {
            listScanProvider.borrarScan(scnas[index].id!);
          },
          child: ListTile(
            leading: scnas[index].tipo == "http"
                ? const Icon(Icons.home_outlined, color: Colors.deepPurple)
                : const Icon(Icons.map_outlined, color: Colors.deepPurple),
            title: Text(scnas[index].valor),
            subtitle: Text("ID: ${scnas[index].id}"),
            trailing: const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.grey,
            ),
            onTap: () => print("Abrir algo"),
          ),
        );
      },
    );
  }
}
