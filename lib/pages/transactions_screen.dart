import 'package:flutter/material.dart';
import 'package:mysample/data/dummy/dummy_transaksi.dart';
import 'package:mysample/widgets/my_app_bar.dart';

class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({super.key});

  String formatRupiah(int harga) {
    return 'Rp ${harga.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match.group(1)}.')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final item = transactions[index];

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(item.tanggal), Text(item.status)],
              ),
              Row(
                children: [
                  Image.network(item.foto, width: 50, height: 50),
                  Expanded(
                    child: Column(
                      children: [Text(item.nama), Text('1 barang')],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Total Belanja'),
                      Text(formatRupiah(item.harga)),
                    ],
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('Detail')),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
