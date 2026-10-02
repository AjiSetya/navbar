import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mysample/pages/kalkulator_screen.dart';
import 'package:mysample/widgets/product_grid.dart';

import 'pages/feeds_sreen.dart';
import 'pages/home_screen.dart';
import 'pages/login_screen.dart';
import 'pages/mall_sreen.dart';
import 'pages/profile_screen.dart';
import 'pages/register_screen.dart';
import 'pages/splash_screen.dart';
import 'pages/transactions_screen.dart';
import 'services/session_service.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Explicitly enable Material 3 (Optional for modern Flutter versions)
        useMaterial3: true,
        // Generate a full M3 ColorScheme from a single seed color
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      // Halaman pertama yang dibuka
      // home: NavigationExample(),
      // route awal
      initialRoute: '/splash',

      // Daftar route
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const NavigationExample(),
        '/splash': (context) => const SplashScreen(),
      },
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    FeedsScreen(),
    MallScreen(),
    TransactionsScreen(),
    // ProductGrid(),
    // KalkulatorScreen(),
    ProfileScreen(),
  ];

  // kondisi navbar muncul atau tidak
  bool _showNavigationBar = true;

  // penentu kemunculan navbar
  void _handleScroll(ScrollNotification notification) {
    if (notification is UserScrollNotification) {
      // jika scroll kebawah (layar ke atas)
      if (notification.direction == ScrollDirection.reverse) {
        // sembunyikan navbar
        setState(() {
          _showNavigationBar = false;
        });
      } else if (notification.direction == ScrollDirection.forward) {
        // jika scroll keatas (layar ke bawah)
        // tampilkan navbar
        setState(() {
          _showNavigationBar = true;
        });
      }
    }
  }

  // penentu apakah dialog sudah muncul
  bool dialogSudahMuncul = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // jika dialog sudah muncul, tidak perlu menampilkan lagi
    if (dialogSudahMuncul) return;

    // ubah setatus dialog sudah muncul
    dialogSudahMuncul = true;

    // menbuat variabel arguments dari route
    // arguments mengambil data dari halaman sebelumnya sebagai tipe data Map
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    // memasukkan data ke variabel seusai key
    final dataDiri = arguments?['data'];
    final sesi = arguments?['sesi'];
    final tanggal = arguments?['tanggal'];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // jika data diri ada
      if (dataDiri != null) {
        // tampilkan dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Column(
              children: [
                Icon(Icons.waving_hand, size: 50, color: Colors.deepPurple),
                const SizedBox(height: 10),
                const Text('Selamat Datang!', textAlign: TextAlign.center),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${dataDiri['name']}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Senang melihat kamu kembali.',
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_today),
                          const SizedBox(width: 10),
                          Text('Tanggal: $tanggal'),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Icon(Icons.access_time),
                          const SizedBox(width: 10),
                          Text('Sesi: $sesi'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Mulai'),
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          _handleScroll(notification);
          return false;
        },
        child: Stack(
          children: [
            pages[currentPageIndex],
            Positioned(
              left: 16,
              right: 16,
              bottom: 12,
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                // Muncul: Offset(0, 0)
                // Hilang: geser ke bawah
                offset: _showNavigationBar ? Offset.zero : const Offset(0, 1.5),

                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  opacity: _showNavigationBar ? 1.0 : 0.0,

                  child: _navBar(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filterConfig: ImageFilterConfig.blur(
            sigmaX: 10,
            sigmaY: 10,
          ), // Efek buram konten di belakang
          child: Container(
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white, // Putih murni solid (bukan transparan)
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.grey.shade300, // Border pemisah yang jelas
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15), // Shadow lebih dalam
                  blurRadius: 20,
                  spreadRadius: 1,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(
                  index: 0,
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home_rounded,
                  label: 'Home',
                ),
                _buildNavItem(
                  index: 1,
                  icon: Icons.video_collection_outlined,
                  activeIcon: Icons.video_collection_rounded,
                  label: 'Feeds',
                ),
                _buildNavItem(
                  index: 2,
                  icon: Icons.store_outlined,
                  activeIcon: Icons.store_rounded,
                  label: 'Mall',
                ),
                _buildNavItem(
                  index: 3,
                  icon: Icons.receipt_long_outlined,
                  activeIcon: Icons.receipt_long_rounded,
                  label: 'Orders',
                  badgeCount: 2,
                ),
                _buildNavItem(
                  index: 4,
                  icon: Icons.person_outlined,
                  activeIcon: Icons.person_rounded,
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
    int? badgeCount,
  }) {
    final isSelected = currentPageIndex == index;
    final primaryColor = Theme.of(context).colorScheme.primary;

    Widget iconWidget = Icon(
      isSelected ? activeIcon : icon,
      size: 20,
      color: isSelected ? Colors.white : Colors.grey.shade700,
    );

    // Jika ada badge
    if (badgeCount != null && badgeCount > 0) {
      iconWidget = Badge(
        label: Text(
          '$badgeCount',
          style: const TextStyle(fontSize: 9, color: Colors.white),
        ),
        child: iconWidget,
      );
    }

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            currentPageIndex = index;
          });
        },
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Indikator Kapsul Aktif
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              decoration: BoxDecoration(
                color: isSelected ? primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: iconWidget,
            ),
            const SizedBox(height: 2),
            // Label Teks
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? primaryColor : Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
