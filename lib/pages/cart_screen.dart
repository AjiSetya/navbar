import 'package:flutter/material.dart';

import '../data/dummy/dummy_cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String formatRupiah(int harga) {
    return 'Rp ${harga.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match.group(1)}.')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang')),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];

          return Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Image.network(
                    item.gambar,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              item.nama,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  cartItems.removeAt(index);
                                });
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            Text(formatRupiah(item.harga)),
                            SizedBox(width: 8),
                            Text('(${item.stok} Stok)'),
                          ],
                        ),

                        const SizedBox(height: 8),

                        Text(
                          formatRupiah(item.harga * item.jumlah),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 8),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (item.jumlah > 1) {
                                    item.jumlah--;
                                  }
                                });
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            Text('${item.jumlah}'),

                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (item.jumlah < item.stok) {
                                    item.jumlah++;
                                  }
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
