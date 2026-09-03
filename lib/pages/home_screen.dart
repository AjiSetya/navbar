import 'package:flutter/material.dart';

import '../widgets/my_app_bar.dart';

// =========================
// MODEL KATEGORI
// =========================

class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});
}

// =========================
// MODEL PRODUK
// =========================

class Product {
  final String name;
  final String image;
  final int price;

  Product({required this.name, required this.image, required this.price});
}

// =========================
// HOME PAGE
// =========================

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Data kategori
  final List<Category> categories = [
    Category(
      name: 'Elektronik',
      image:
          'https://cdn-icons-png.magnific.com/256/896/896530.png?semt=ais_white_label',
    ),
    Category(
      name: 'Fashion',
      image: 'https://cdn-icons-png.flaticon.com/512/668/668262.png',
    ),
    Category(
      name: 'Makanan',
      image: 'https://cdn-icons-png.flaticon.com/512/857/857681.png',
    ),
    Category(
      name: 'Olahraga',
      image: 'https://cdn-icons-png.flaticon.com/512/3104/3104509.png',
    ),
    Category(
      name: 'Buku',
      image: 'https://cdn-icons-png.flaticon.com/512/864/864685.png',
    ),
    Category(
      name: 'Gaming',
      image: 'https://cdn-icons-png.flaticon.com/512/7708/7708371.png',
    ),
  ];

  // Data produk
  final List<Product> products = [
    Product(
      name: 'Wireless Headphone',
      image:
          'https://www.ankerindonesia.com/cdn/shop/files/A3012_670x670_dd612cd4-94b6-4fa6-8bc1-70e327eb6e3e.jpg?v=1724212890',
      price: 250000,
    ),
    Product(
      name: 'Smart Watch',
      image:
          'https://cdn.ruparupa.io/fit-in/400x400/filters:format(webp)/filters:quality(90)/ruparupa-com/image/upload/Products/10607073_1.jpg',
      price: 450000,
    ),
    Product(
      name: 'Running Shoes',
      image:
          'https://azawear.com/cdn/shop/files/sepaturunningazarun1.jpg?v=1751385960',
      price: 350000,
    ),
    Product(
      name: 'Backpack',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh7Y2jhEfbBq4ZLsnOiENs63PN0AfNO9tQe6a8k15bwvXbdBFyZD8pwsW4&s=10',
      price: 180000,
    ),
    Product(
      name: 'Mechanical Keyboard',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsfW3-zssQ9PbqVY-ZHCeRpPgeOLWW7euLH0f-PFTu5VubvB7d5tYzfzU&s=10',
      price: 650000,
    ),
    Product(
      name: 'Gaming Mouse',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgWqILvup1dhIM27FgcvRgSYyxXU670ckZTNV2vr3MXCBeZEMbzLiGE3Q&s=10',
      price: 300000,
    ),
    Product(
      name: 'T-Shirt',
      image:
          'https://contents.mediadecathlon.com/p1901236/k\$2836c12f148eea1c5e31429acfb405be/t-shirt-katun-murni-fitness-sportee-hitam-domyos-8572641.jpg?f=1920x0&format=auto',
      price: 120000,
    ),
    Product(
      name: 'Coffee Maker',
      image:
          'https://cdn.ruparupa.io/fit-in/850x850/filters:format(webp)/filters:watermark(content.ruparupa.io,products/wm/rr.png,0,-0,0,100,100)/ruparupa-com/image/upload/Products/10577427_1.jpg',
      price: 550000,
    ),
    Product(
      name: 'Wireless Headphone',
      image:
          'https://www.ankerindonesia.com/cdn/shop/files/A3012_670x670_dd612cd4-94b6-4fa6-8bc1-70e327eb6e3e.jpg?v=1724212890',
      price: 250000,
    ),
    Product(
      name: 'Smart Watch',
      image:
          'https://cdn.ruparupa.io/fit-in/400x400/filters:format(webp)/filters:quality(90)/ruparupa-com/image/upload/Products/10607073_1.jpg',
      price: 450000,
    ),
    Product(
      name: 'Running Shoes',
      image:
          'https://azawear.com/cdn/shop/files/sepaturunningazarun1.jpg?v=1751385960',
      price: 350000,
    ),
    Product(
      name: 'Backpack',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh7Y2jhEfbBq4ZLsnOiENs63PN0AfNO9tQe6a8k15bwvXbdBFyZD8pwsW4&s=10',
      price: 180000,
    ),
    Product(
      name: 'Mechanical Keyboard',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsfW3-zssQ9PbqVY-ZHCeRpPgeOLWW7euLH0f-PFTu5VubvB7d5tYzfzU&s=10',
      price: 650000,
    ),
    Product(
      name: 'Gaming Mouse',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgWqILvup1dhIM27FgcvRgSYyxXU670ckZTNV2vr3MXCBeZEMbzLiGE3Q&s=10',
      price: 300000,
    ),
    Product(
      name: 'T-Shirt',
      image:
          'https://contents.mediadecathlon.com/p1901236/k\$2836c12f148eea1c5e31429acfb405be/t-shirt-katun-murni-fitness-sportee-hitam-domyos-8572641.jpg?f=1920x0&format=auto',
      price: 120000,
    ),
    Product(
      name: 'Coffee Maker',
      image:
          'https://cdn.ruparupa.io/fit-in/850x850/filters:format(webp)/filters:watermark(content.ruparupa.io,products/wm/rr.png,0,-0,0,100,100)/ruparupa-com/image/upload/Products/10577427_1.jpg',
      price: 550000,
    ),
    Product(
      name: 'Wireless Headphone',
      image:
          'https://www.ankerindonesia.com/cdn/shop/files/A3012_670x670_dd612cd4-94b6-4fa6-8bc1-70e327eb6e3e.jpg?v=1724212890',
      price: 250000,
    ),
    Product(
      name: 'Smart Watch',
      image:
          'https://cdn.ruparupa.io/fit-in/400x400/filters:format(webp)/filters:quality(90)/ruparupa-com/image/upload/Products/10607073_1.jpg',
      price: 450000,
    ),
    Product(
      name: 'Running Shoes',
      image:
          'https://azawear.com/cdn/shop/files/sepaturunningazarun1.jpg?v=1751385960',
      price: 350000,
    ),
    Product(
      name: 'Backpack',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh7Y2jhEfbBq4ZLsnOiENs63PN0AfNO9tQe6a8k15bwvXbdBFyZD8pwsW4&s=10',
      price: 180000,
    ),
    Product(
      name: 'Mechanical Keyboard',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsfW3-zssQ9PbqVY-ZHCeRpPgeOLWW7euLH0f-PFTu5VubvB7d5tYzfzU&s=10',
      price: 650000,
    ),
    Product(
      name: 'Gaming Mouse',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgWqILvup1dhIM27FgcvRgSYyxXU670ckZTNV2vr3MXCBeZEMbzLiGE3Q&s=10',
      price: 300000,
    ),
    Product(
      name: 'T-Shirt',
      image:
          'https://contents.mediadecathlon.com/p1901236/k\$2836c12f148eea1c5e31429acfb405be/t-shirt-katun-murni-fitness-sportee-hitam-domyos-8572641.jpg?f=1920x0&format=auto',
      price: 120000,
    ),
    Product(
      name: 'Coffee Maker',
      image:
          'https://cdn.ruparupa.io/fit-in/850x850/filters:format(webp)/filters:watermark(content.ruparupa.io,products/wm/rr.png,0,-0,0,100,100)/ruparupa-com/image/upload/Products/10577427_1.jpg',
      price: 550000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),

      // =========================
      // BODY
      // =========================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================
            // BANNER
            // =========================
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://picsum.photos/800/300?random=20',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black26,
                ),
                padding: const EdgeInsets.all(20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Big Sale!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Diskon hingga 50%',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // =========================
            // KATEGORI
            // =========================
            const Text(
              'Kategori',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 120,

              // ListView horizontal
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          elevation: 2,
                          shadowColor: Colors.black.withValues(alpha: 0.1),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text('Kategori'),
                                  content: Text(
                                    'Kamu pilih kategori ${category.name}.',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Tutup'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: SizedBox(
                              width: 70,
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.network(
                                  category.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          category.name,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // PRODUK
            // =========================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Produk Terbaru',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                TextButton(onPressed: () {}, child: const Text('Lihat Semua')),
              ],
            ),

            const SizedBox(height: 12),

            // =========================
            // GRID PRODUK
            // =========================
            GridView.builder(
              // padding: const EdgeInsets.only(bottom: 120),
              // padding: const EdgeInsets.only(bottom: 100),
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
                // childAspectRatio: 0.68,
              ),

              // untuk membuat konten tiam item
              // index menyimpan posisi item
              itemBuilder: (context, index) {
                final product = products[index];
                // masukkan produk ke dalam item sebagai argument
                return _productItemView(product);
              },
            ),
          ],
        ),
      ),
    );
  }

  // =========================
  // ITEM VIEW
  // memiliki parameter product untuk menampung produk
  // =========================
  Widget _productItemView(Product product) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar produk
          Expanded(
            child: Image.network(
              product.image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Informasi produk
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  'Rp ${product.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 6),

                const Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.orange),
                    SizedBox(width: 4),
                    Text('4.8'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
