class CartItem {
  final int id;
  final String nama;
  final int harga;
  final String gambar;
  final int stok;
  int jumlah;

  CartItem({
    required this.id,
    required this.nama,
    required this.harga,
    required this.gambar,
    required this.stok,
    required this.jumlah,
  });
}
