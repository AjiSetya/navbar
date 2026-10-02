import 'package:flutter/material.dart';

import '../data/dummy/dummy_kategori.dart';
import '../data/dummy/dummy_produk.dart';
import '../data/models/model_produk.dart';
import '../widgets/my_app_bar.dart';
import 'detail_product_screen.dart';

// =========================
// HOME PAGE
// =========================

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),

      // =========================
      // BODY
      // =========================
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================
              // KATEGORI
              // ================
              Text(
                'Kategori',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 12),
              SizedBox(
                height: 115,
                child: ListView.builder(
                  // menentukan arah scroll
                  scrollDirection: Axis.horizontal,
                  // menentukan jumlah item
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, // Menyesuaikan tinggi kolom dengan isinya
                        children: [
                          // Kotak Berbayang untuk Gambar
                          Container(
                            width: 80, // Tentukan lebar kotak
                            height: 80, // Tentukan tinggi kotak
                            decoration: BoxDecoration(
                              color: Colors.white, // Warna latar belakang kotak
                              borderRadius: BorderRadius.circular(
                                16,
                              ), // Membuat sudut kotak melengkung (radius)
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    0.1,
                                  ), // Warna bayangan tipis
                                  blurRadius: 8, // Efek blur bayangan
                                  offset: const Offset(
                                    0,
                                    4,
                                  ), // Posisi bayangan (x, y)
                                ),
                              ],
                            ),
                            // Alignment.center memastikan gambar berada tepat di tengah kotak
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                12,
                              ), // Opsional: radius untuk gambar jika diperlukan
                              child: Image.network(
                                category.image,
                                width:
                                    48, // Ukuran gambar lebih kecil dari Container agar tidak memenuhi kotak
                                height:
                                    48, // Ukuran gambar lebih kecil dari Container agar tidak memenuhi kotak
                                fit: BoxFit
                                    .contain, // Memastikan gambar proporsional di dalam area center
                              ),
                            ),
                          ),

                          // Jarak antara kotak gambar dan teks nama
                          const SizedBox(height: 8),

                          // Teks Nama Kategori di Bawah Kotak
                          Text(
                            category.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow
                                .ellipsis, // Memotong teks dengan (...) jika terlalu panjang
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // ================
              // PRODUK TERBARU
              // ================
              SizedBox(height: 20),
              Text(
                'Produk Terbaru',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // menentukan jumlah item
                itemCount: products.length,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // menentukan total kolom
                  crossAxisCount: 2,
                  // menentukan jarak samping horizontal
                  crossAxisSpacing: 12,
                  // menentukan jarak atas dan bawah
                  mainAxisSpacing: 12,
                  // menentukan rasio antar item
                  childAspectRatio: 0.72,
                ),

                // untuk membuat konten tiam item
                // index menyimpan posisi item
                itemBuilder: (context, index) {
                  final product = products[index];
                  // masukkan produk ke dalam item sebagai argument
                  return _productItemView(product, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =========================
  // ITEM VIEW
  // memiliki parameter product untuk menampung produk
  // =========================
  Widget _productItemView(Product product, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailProductScreen(product: product),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Gambar Produk dengan AspectRatio Tetap (1:1 / Persegi)
              AspectRatio(
                aspectRatio:
                    1.2, // Mengatur porsi rasio gambar agar tidak terpotong ekstrim
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Container(
                    color: const Color(
                      0xFFF8FAFC,
                    ), // Neutral background untuk gambar PNG
                    child: Image.network(
                      product.image,
                      width: double.infinity,
                      fit: BoxFit
                          .contain, // BoxFit.contain agar produk utuh terlihat, atau BoxFit.cover jika gambar penuh
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(
                            child: Icon(
                              Icons.broken_image_outlined,
                              color: Colors.grey,
                            ),
                          ),
                    ),
                  ),
                ),
              ),

              // 2. Informasi Produk yang Proporsional
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Menjaga elemen terbagi rata
                    children: [
                      // Nama Produk
                      Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13, // Diperkecil agar lebih rapi
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                          height: 1.2,
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Harga Produk
                          Text(
                            'Rp ${_formatPrice(product.price)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),

                          const SizedBox(height: 4),

                          // Rating & Penjualan (Opsional)
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: 14,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                '4.8',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '| 100+ terjual',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper untuk format titik harga (contoh: 250000 -> 250.000)
  String _formatPrice(dynamic price) {
    final numPrice = num.tryParse(price.toString()) ?? 0;
    return numPrice.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }
}
