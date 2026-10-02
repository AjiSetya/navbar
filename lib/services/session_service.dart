import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  // Simpan session
  // static untuk bisa mengakses method dari luar
  static Future<void> login(String username) async {
    // membuat objek shared preference
    final prefs = await SharedPreferences.getInstance();
    // mengatur user sudah login
    // dipakai nanti untuk menentuakn login ( isLogin ? home : login )
    await prefs.setBool('isLogin', true);
    // menyimpan akun
    await prefs.setString('username', username);
  }

  // Cek sudah login apa belum
  static Future<bool> isLogin() async {
    final prefs = await SharedPreferences.getInstance();

    // cek apakah sudah login
    // ?? berfungsi untuk jika null maka akan mengembalikan false
    return prefs.getBool('isLogin') ?? false;
  }

  // Ambil username
  static Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? '';
  }

  // Logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    // hapus data session
    await prefs.remove('isLogin');
    await prefs.remove('username');
  }
}
