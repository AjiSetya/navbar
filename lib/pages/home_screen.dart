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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),

      // =========================
      // BODY
      // =========================
      body: GridView.builder(
        // padding: const EdgeInsets.only(bottom: 100),
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
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
