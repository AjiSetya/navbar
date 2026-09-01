import 'package:flutter/material.dart';

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
    Category(name: 'Elektronik', image: 'https://picsum.photos/100?random=1'),
    Category(name: 'Fashion', image: 'https://picsum.photos/100?random=2'),
    Category(name: 'Makanan', image: 'https://picsum.photos/100?random=3'),
    Category(name: 'Olahraga', image: 'https://picsum.photos/100?random=4'),
    Category(name: 'Buku', image: 'https://picsum.photos/100?random=5'),
    Category(name: 'Gaming', image: 'https://picsum.photos/100?random=6'),
  ];

  // Data produk
  final List<Product> products = [
    Product(
      name: 'Wireless Headphone',
      image: 'https://picsum.photos/300/300?random=10',
      price: 250000,
    ),
    Product(
      name: 'Smart Watch',
      image: 'https://picsum.photos/300/300?random=11',
      price: 450000,
    ),
    Product(
      name: 'Running Shoes',
      image: 'https://picsum.photos/300/300?random=12',
      price: 350000,
    ),
    Product(
      name: 'Backpack',
      image: 'https://picsum.photos/300/300?random=13',
      price: 180000,
    ),
    Product(
      name: 'Mechanical Keyboard',
      image: 'https://picsum.photos/300/300?random=14',
      price: 650000,
    ),
    Product(
      name: 'Gaming Mouse',
      image: 'https://picsum.photos/300/300?random=15',
      price: 300000,
    ),
    Product(
      name: 'T-Shirt',
      image: 'https://picsum.photos/300/300?random=16',
      price: 120000,
    ),
    Product(
      name: 'Coffee Maker',
      image: 'https://picsum.photos/300/300?random=17',
      price: 550000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Row(
          children: [
            // Search Bar
            Expanded(
              child: SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari produk...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    // fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),

            // Tombol Chat
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble_outline),
            ),

            // Tombol Keranjang
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined),
            ),
          ],
        ),
      ),

      // =========================
      // BODY
      // =========================
      body: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.68,
        ),

        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            elevation: 2,
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
        },
      ),
    );
  }
}
