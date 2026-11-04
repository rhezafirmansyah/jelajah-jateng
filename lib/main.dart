import 'package:flutter/material.dart';

void main() {
  runApp(const JelajahApp());
}

// ============================================================
// WARNA & DATA
// ============================================================
const Color warnaUtama = Color(0xFF1B7F5C);
const Color warnaAksen = Color(0xFFF2A93B);
const Color warnaLatar = Color(0xFFF4F7F5);
const Color warnaTeks = Color(0xFF22332D);

class Wisata {
  final String nama;
  final String lokasi;
  final String deskripsi;
  final String gambar;
  final double rating;
  final String harga;
  final String jam;

  const Wisata({
    required this.nama,
    required this.lokasi,
    required this.deskripsi,
    required this.gambar,
    required this.rating,
    required this.harga,
    required this.jam,
  });
}

class Kuliner {
  final String nama;
  final String asal;
  final String deskripsi;
  final String gambar;
  final String harga;

  const Kuliner({
    required this.nama,
    required this.asal,
    required this.deskripsi,
    required this.gambar,
    required this.harga,
  });
}

const List<Wisata> daftarWisata = [
  Wisata(
    nama: 'Candi Borobudur',
    lokasi: 'Magelang',
    deskripsi:
        'Candi Buddha terbesar di dunia dari abad ke-9 dan Situs Warisan Dunia '
        'UNESCO. Nikmati matahari terbit dari atas candi dan pelajari relief '
        'ribuan panel yang menceritakan ajaran Buddha.',
    gambar:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Borobudur-Nothwest-view.jpg?width=800',
    rating: 4.9,
    harga: 'Rp 50.000',
    jam: '06.30 - 16.30',
  ),
  Wisata(
    nama: 'Lawang Sewu',
    lokasi: 'Semarang',
    deskripsi:
        'Bangunan bersejarah peninggalan kolonial Belanda dengan ratusan pintu '
        'dan jendela besar. Dulunya kantor kereta api, kini menjadi museum dan '
        'ikon kota Semarang.',
    gambar:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Lawang_Sewu.jpg?width=800',
    rating: 4.6,
    harga: 'Rp 20.000',
    jam: '07.00 - 21.00',
  ),
  Wisata(
    nama: 'Dataran Tinggi Dieng',
    lokasi: 'Wonosobo - Banjarnegara',
    deskripsi:
        'Dataran tinggi dengan kawah, telaga warna, candi Hindu kuno, dan '
        'udara sejuk. Setiap tahun digelar Dieng Culture Festival yang '
        'terkenal dengan ritual ruwat rambut gimbal.',
    gambar:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Dieng_Plateau.jpg?width=800',
    rating: 4.7,
    harga: 'Rp 25.000',
    jam: '24 Jam',
  ),
  Wisata(
    nama: 'Karimunjawa',
    lokasi: 'Jepara',
    deskripsi:
        'Gugusan kepulauan dengan pantai berpasir putih, air laut jernih, dan '
        'terumbu karang yang indah. Cocok untuk snorkeling, diving, dan '
        'island hopping.',
    gambar:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Karimunjawa.jpg?width=800',
    rating: 4.8,
    harga: 'Rp 15.000',
    jam: '24 Jam',
  ),
];

const List<Kuliner> daftarKuliner = [
  Kuliner(
    nama: 'Lumpia Semarang',
    asal: 'Semarang',
    deskripsi:
        'Kulit lumpia renyah berisi rebung, ayam, dan udang. Disajikan dengan '
        'saus kental manis dan acar. Ada versi goreng dan basah.',
    gambar:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Lumpia_Semarang.jpg?width=600',
    harga: 'Rp 15.000',
  ),
  Kuliner(
    nama: 'Soto Kudus',
    asal: 'Kudus',
    deskripsi:
        'Soto berkuah bening dengan porsi kecil, biasanya memakai daging '
        'kerbau atau ayam. Segar dan gurih, cocok disantap bersama sate kerang.',
    gambar:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Soto_Kudus.jpg?width=600',
    harga: 'Rp 12.000',
  ),
  Kuliner(
    nama: 'Tahu Gimbal',
    asal: 'Semarang',
    deskripsi:
        'Tahu goreng, lontong, kol, dan telur disiram saus kacang, ditambah '
        'gimbal udang yang renyah.',
    gambar:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Tahu_Gimbal.jpg?width=600',
    harga: 'Rp 14.000',
  ),
  Kuliner(
    nama: 'Mie Ongklok',
    asal: 'Wonosobo',
    deskripsi:
        'Mie kuah kental berbumbu kacang dan kanji, hangat dan pas untuk '
        'udara dingin dataran tinggi Dieng.',
    gambar:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Mie_Ongklok.jpg?width=600',
    harga: 'Rp 18.000',
  ),
];

// ============================================================
// WIDGET GAMBAR (Image.network + ukuran + BoxFit)
// ============================================================
class GambarJaringan extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;

  const GambarJaringan({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Container(
          width: width,
          height: height,
          color: Colors.grey.shade200,
          child: const Center(
            child: CircularProgressIndicator(color: warnaUtama, strokeWidth: 2),
          ),
        );
      },
      errorBuilder: (context, error, stack) {
        return Container(
          width: width,
          height: height,
          color: Colors.grey.shade300,
          child: const Icon(Icons.image_not_supported,
              color: Colors.grey, size: 32),
        );
      },
    );
  }
}

// ============================================================
// APP
// ============================================================
class JelajahApp extends StatelessWidget {
  const JelajahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jelajah Jawa Tengah',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: warnaUtama),
        scaffoldBackgroundColor: warnaLatar,
        useMaterial3: true,
      ),
      home: const HalamanBeranda(),
    );
  }
}

// ============================================================
// HALAMAN 1 : BERANDA
// ============================================================
class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------- Header ----------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
                decoration: const BoxDecoration(
                  color: warnaUtama,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.explore, color: warnaAksen, size: 28),
                        SizedBox(width: 8),
                        Text(
                          'Jelajah Jawa Tengah',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Temukan wisata, kuliner, dan budaya terbaik di jantung Pulau Jawa.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ---------- Menu cepat (Row) ----------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _menuCepat(
                      context,
                      icon: Icons.restaurant_menu,
                      label: 'Kuliner',
                      warna: Colors.orange,
                      tujuan: const HalamanKuliner(),
                    ),
                    _menuCepat(
                      context,
                      icon: Icons.tips_and_updates,
                      label: 'Tips',
                      warna: Colors.blue,
                      tujuan: const HalamanTips(),
                    ),
                    _menuCepat(
                      context,
                      icon: Icons.person,
                      label: 'Profil',
                      warna: Colors.purple,
                      tujuan: const HalamanProfil(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ---------- Daftar Wisata ----------
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Destinasi Populer',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: warnaTeks,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              ...daftarWisata.map((w) => _kartuWisata(context, w)),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuCepat(
    BuildContext context, {
    required IconData icon,
    required String label,
    required MaterialColor warna,
    required Widget tujuan,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => tujuan));
      },
      child: Container(
        width: 104,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: warna.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: warna, size: 28),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: warnaTeks,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _kartuWisata(BuildContext context, Wisata w) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HalamanDetailWisata(wisata: w)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: GambarJaringan(
                url: w.gambar,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    w.nama,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: warnaTeks,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.red),
                      const SizedBox(width: 4),
                      Text(
                        w.lokasi,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 18, color: warnaAksen),
                      const SizedBox(width: 4),
                      Text(
                        w.rating.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Text(
                        w.harga,
                        style: const TextStyle(
                          color: warnaUtama,
                          fontWeight: FontWeight.bold,
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
  }
}

// ============================================================
// HALAMAN 2 : DETAIL WISATA
// ============================================================
class HalamanDetailWisata extends StatelessWidget {
  final Wisata wisata;

  const HalamanDetailWisata({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    final lebarLayar = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- Gambar utama + tombol kembali ----------
            Stack(
              children: [
                GambarJaringan(
                  url: wisata.gambar,
                  width: lebarLayar,
                  height: 280,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back, color: warnaTeks),
                    ),
                  ),
                ),
              ],
            ),

            // ---------- Konten ----------
            Container(
              width: double.infinity,
              transform: Matrix4.translationValues(0, -24, 0),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: warnaLatar,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wisata.nama,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: warnaTeks,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.red, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        wisata.lokasi,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 14),
                      ),
                      const Spacer(),
                      const Icon(Icons.star, color: warnaAksen, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        wisata.rating.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Info tiket & jam (Row of Containers)
                  Row(
                    children: [
                      Expanded(
                        child: _infoBox(
                          Icons.confirmation_number,
                          'Tiket',
                          wisata.harga,
                          Colors.green,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _infoBox(
                          Icons.access_time,
                          'Jam Buka',
                          wisata.jam,
                          Colors.orange,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Tentang Destinasi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: warnaTeks,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    wisata.deskripsi,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 24),

                  // Tombol navigasi
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Kembali'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: warnaUtama,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HalamanTips()),
                            );
                          },
                          icon: const Icon(Icons.tips_and_updates),
                          label: const Text('Lihat Tips'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: warnaUtama,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
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
  }

  Widget _infoBox(IconData icon, String judul, String nilai, MaterialColor warna) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: warna.shade50,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: warna, size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(judul,
                    style:
                        const TextStyle(fontSize: 12, color: Colors.black54)),
                const SizedBox(height: 2),
                Text(
                  nilai,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: warnaTeks),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HALAMAN 3 : DAFTAR KULINER
// ============================================================
class HalamanKuliner extends StatelessWidget {
  const HalamanKuliner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: warnaUtama,
        foregroundColor: Colors.white,
        title: const Text('Kuliner Khas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: daftarKuliner.length,
        itemBuilder: (context, index) {
          final k = daftarKuliner[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => HalamanDetailKuliner(kuliner: k)),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    child: GambarJaringan(
                      url: k.gambar,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                k.nama,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: warnaTeks,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Asal: ${k.asal}',
                                style: const TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: warnaAksen,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            k.harga,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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

// ============================================================
// HALAMAN 4 : DETAIL KULINER
// ============================================================
class HalamanDetailKuliner extends StatelessWidget {
  final Kuliner kuliner;

  const HalamanDetailKuliner({super.key, required this.kuliner});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: warnaUtama,
        foregroundColor: Colors.white,
        title: Text(kuliner.nama),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GambarJaringan(
                  url: kuliner.gambar,
                  width: 300,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              kuliner.nama,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: warnaTeks,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.place, color: Colors.red, size: 18),
                const SizedBox(width: 4),
                Text('Khas ${kuliner.asal}',
                    style: const TextStyle(color: Colors.black54)),
                const SizedBox(width: 16),
                const Icon(Icons.payments, color: warnaUtama, size: 18),
                const SizedBox(width: 4),
                Text(
                  kuliner.harga,
                  style: const TextStyle(
                    color: warnaUtama,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              kuliner.deskripsi,
              style: const TextStyle(fontSize: 15, height: 1.6),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: warnaUtama,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Kembali ke Daftar Kuliner'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// HALAMAN 5 : TIPS PERJALANAN
// ============================================================
class HalamanTips extends StatelessWidget {
  const HalamanTips({super.key});

  @override
  Widget build(BuildContext context) {
    final tips = [
      {
        'icon': Icons.wb_sunny,
        'warna': Colors.orange,
        'judul': 'Pilih Waktu Terbaik',
        'isi': 'Musim kemarau (Mei - September) paling nyaman untuk berwisata.',
      },
      {
        'icon': Icons.luggage,
        'warna': Colors.blue,
        'judul': 'Bawa Perlengkapan',
        'isi': 'Siapkan jaket tipis, tabir surya, dan sepatu yang nyaman.',
      },
      {
        'icon': Icons.account_balance_wallet,
        'warna': Colors.green,
        'judul': 'Siapkan Uang Tunai',
        'isi': 'Beberapa warung dan tempat parkir belum menerima pembayaran digital.',
      },
      {
        'icon': Icons.volunteer_activism,
        'warna': Colors.purple,
        'judul': 'Hormati Budaya Lokal',
        'isi': 'Berpakaian sopan saat mengunjungi candi dan tempat ibadah.',
      },
      {
        'icon': Icons.recycling,
        'warna': Colors.teal,
        'judul': 'Jaga Kebersihan',
        'isi': 'Bawa kembali sampahmu agar destinasi tetap lestari.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: warnaUtama,
        foregroundColor: Colors.white,
        title: const Text('Tips Perjalanan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: tips.map((t) {
                final warna = t['warna'] as MaterialColor;
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: warna.shade100),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: warna.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(t['icon'] as IconData, color: warna),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t['judul'] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: warnaTeks,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              t['isi'] as String,
                              style: const TextStyle(
                                  color: Colors.black54, height: 1.4),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: warnaUtama,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Kembali'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const HalamanProfil()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: warnaUtama,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Tentang Pembuat'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HALAMAN 6 : PROFIL PEMBUAT
// ============================================================
class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: warnaUtama,
        foregroundColor: Colors.white,
        title: const Text('Profil Pembuat'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: const BoxDecoration(
                color: warnaUtama,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: warnaAksen, width: 4),
                    ),
                    child: const Icon(Icons.person,
                        size: 70, color: warnaUtama),
                  ),
                  const SizedBox(height: 14),
                  // TODO: ganti dengan nama & NIM kamu
                  const Text(
                    'Nama Mahasiswa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'NIM: 1234567890',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _baris(Icons.school, 'Program Studi', 'Teknik Informatika'),
                  const Divider(),
                  _baris(Icons.location_city, 'Kampus', 'Semarang'),
                  const Divider(),
                  _baris(Icons.email, 'Email', 'nama@email.com'),
                  const Divider(),
                  _baris(Icons.flutter_dash, 'Dibuat dengan', 'Flutter'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Kembali langsung ke halaman pertama (beranda)
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  icon: const Icon(Icons.home),
                  label: const Text('Kembali ke Beranda'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: warnaUtama,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _baris(IconData icon, String label, String nilai) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: warnaUtama),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(fontSize: 12, color: Colors.black54)),
              Text(nilai,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: warnaTeks)),
            ],
          ),
        ],
      ),
    );
  }
}
