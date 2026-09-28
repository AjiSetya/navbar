import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  // variabel yang menampung data produk dari API
  List products = [];

  // request data ke API
  // pakai Future karena data didapat nanti
  // karena API membutuhkan waktu
  // menggunakan void karena tidak mengembalikan nilai
  // menggunakan async karena mengembalikan Future
  Future<void> fetchProducts() async {
    Uri url = Uri.parse('https://fakestoreapi.com/products');

    // respon dari API dimasukkan ke variabel response
    final response = await http.get(url);

    // parsing JSON dan masukkan ke variable data
    final data = jsonDecode(response.body);

    // data yang sudah di parsing masuk ke variabel products
    setState(() {
      products = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // panggil fungsi fetchProducts
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data produk')),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              // berapa jumlah data yang akan ditampilkan
              itemCount: products.length, // semua produk
              // buat tampilan tiap produk
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar produk
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            products[index]['image'],
                            width: 80,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Informasi produk
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[index]['title'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                '\$${products[index]['price']}',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Row(
                                children: [
                                  Text(
                                    '⭐ ${products[index]['rating']['rate']}',
                                    style: const TextStyle(fontSize: 13),
                                  ),

                                  const SizedBox(width: 8),

                                  Text(
                                    '${products[index]['rating']['count']} ulasan',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
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
