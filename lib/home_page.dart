import 'package:flutter/material.dart';
import 'detail_kos_page.dart';
import 'about_me_page.dart';
import 'profile_page.dart';
import 'models/kos_model.dart';

class HomePage extends StatefulWidget {
  final String userName;

  const HomePage({
    super.key,
    this.userName = 'Pengguna',
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ============================================================
  // WARNA
  // ============================================================

  static const Color primaryBlue = Color(0xFF3974C9);
  static const Color darkBlue = Color(0xFF18345E);
  static const Color textGrey = Color(0xFF8290A5);
  static const Color background = Color(0xFFF9FBFF);

  // ============================================================
  // DATA KOS
  // ============================================================

  static const List<KosModel> dataKos = [
    KosModel(
      name: 'Kost Lavender',
      location: 'Surabaya Selatan',
      price: 'Rp 1.200.000 / bulan',
      priceValue: 1200000,
      rating: 4.8,
      imageUrl: 'assets/kost_lavender.jpg',
      facilities: [
        'WiFi',
        'AC',
        'Kamar Mandi',
        'Parkir',
        'Laundry',
        'Kasur',
      ],
      description:
          'Kost nyaman dengan suasana tenang dan cocok untuk mahasiswa maupun pekerja. Lokasi strategis dan fasilitas lengkap.',
    ),
    KosModel(
      name: 'Kost Harmoni',
      location: 'Surabaya Barat',
      price: 'Rp 950.000 / bulan',
      priceValue: 950000,
      rating: 4.7,
      imageUrl: 'assets/kost_harmoni.jpg',
      facilities: [
        'WiFi',
        'AC',
        'Kamar Mandi',
        'Parkir',
        'Dapur',
        'CCTV',
      ],
      description:
          'Kost dengan lingkungan yang nyaman dan aman. Tersedia dapur dan CCTV untuk menunjang kenyamanan penghuni.',
    ),
    KosModel(
      name: 'Kost Nyaman',
      location: 'Surabaya Timur',
      price: 'Rp 1.050.000 / bulan',
      priceValue: 1050000,
      rating: 4.6,
      imageUrl: 'assets/kost_nyaman.jpg',
      facilities: [
        'WiFi',
        'AC',
        'Kamar Mandi Dalam',
        'Parkir',
        'TV',
        'Kipas',
      ],
      description:
          'Kost dengan kamar yang nyaman dan fasilitas yang cocok untuk tempat tinggal jangka panjang.',
    ),
    KosModel(
      name: 'Kost Minimalis',
      location: 'Surabaya Pusat',
      price: 'Rp 900.000 / bulan',
      priceValue: 900000,
      rating: 4.5,
      imageUrl: 'assets/kost_minimalis.jpg',
      facilities: [
        'WiFi',
        'Kamar Mandi',
        'Parkir',
        'Laundry',
        'Meja',
        'Lemari',
        'Dapur Bersama',
      ],
      description:
          'Kost minimalis dengan harga terjangkau dan fasilitas yang cukup lengkap untuk kebutuhan sehari-hari.',
    ),
  ];

  // ============================================================
  // HASIL PENCARIAN
  // ============================================================

  List<KosModel> hasilPencarian = dataKos;

  // ============================================================
  // CONTROLLER SEARCH
  // ============================================================

  final TextEditingController lokasiController =
      TextEditingController();

  final TextEditingController budgetController =
      TextEditingController();

  // ============================================================
  // FILTER
  // ============================================================

  void cariKos() {
    final String lokasi =
        lokasiController.text.trim().toLowerCase();

    final String budgetText =
        budgetController.text.trim();

    int? budget;

    if (budgetText.isNotEmpty) {
      budget = int.tryParse(
        budgetText.replaceAll('.', '').replaceAll(',', ''),
      );
    }

    setState(() {
      hasilPencarian = dataKos.where((kos) {
        final String lokasiKos =
            kos.location.toLowerCase();

        final int hargaKos =
            kos.priceValue;

        final bool cocokLokasi =
            lokasi.isEmpty ||
                lokasiKos.contains(lokasi);

        final bool cocokBudget =
            budget == null ||
                hargaKos <= budget;

        return cocokLokasi && cocokBudget;
      }).toList();
    });
  }

  void resetPencarian() {
    lokasiController.clear();
    budgetController.clear();

    setState(() {
      hasilPencarian = dataKos;
    });
  }

  @override
  void dispose() {
    lokasiController.dispose();
    budgetController.dispose();
    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      // ========================================================
      // APP BAR
      // ========================================================

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,

        titleSpacing: 24,

        title: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: primaryBlue,
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Icon(
                Icons.home_rounded,
                color: Colors.white,
                size: 23,
              ),
            ),

            const SizedBox(width: 12),

            const Text(
              'KOSTAY',
              style: TextStyle(
                color: darkBlue,
                fontSize: 21,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            tooltip: 'About Me',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const AboutMePage(),
                ),
              );
            },
            icon: const Icon(
              Icons.info_outline_rounded,
              color: primaryBlue,
            ),
          ),

          IconButton(
            tooltip: 'Profile',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    userName: widget.userName,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.person_outline_rounded,
              color: primaryBlue,
            ),
          ),

          const SizedBox(width: 12),
        ],
      ),

      // ========================================================
      // BODY
      // ========================================================

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              // ==================================================
              // HERO
              // ==================================================

              Container(
                width: double.infinity,

                margin: const EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  0,
                ),

                padding: const EdgeInsets.all(28),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF3974C9),
                      Color(0xFF6A9FE8),
                    ],
                  ),

                  borderRadius:
                      BorderRadius.circular(28),

                  boxShadow: [
                    BoxShadow(
                      color:
                          primaryBlue.withOpacity(0.18),
                      blurRadius: 25,
                      offset:
                          const Offset(0, 10),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Halo, ${widget.userName}! 👋',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Temukan tempat tinggal\nyang nyaman untukmu.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 29,
                        fontWeight: FontWeight.w900,
                        height: 1.15,
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Text(
                      'Cari kos sesuai lokasi dan budget yang kamu inginkan.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 22),

                    Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.15),
                        borderRadius:
                            BorderRadius.circular(15),
                      ),

                      child: const Row(
                        mainAxisSize:
                            MainAxisSize.min,

                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: Colors.white,
                            size: 19,
                          ),

                          SizedBox(width: 8),

                          Text(
                            'Cari kos di Surabaya',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ==================================================
              // SEARCH
              // ==================================================

              Padding(
                padding:
                    const EdgeInsets.fromLTRB(
                  20,
                  28,
                  20,
                  0,
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    const Text(
                      'Cari Kos',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 7),

                    const Text(
                      'Temukan kos berdasarkan lokasi dan budget.',
                      style: TextStyle(
                        color: textGrey,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 18),

                    // LOKASI
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(16),
                        border: Border.all(
                          color:
                              const Color(0xFFE2EAF5),
                        ),
                      ),

                      child: TextField(
                        controller:
                            lokasiController,

                        onSubmitted: (_) =>
                            cariKos(),

                        decoration:
                            const InputDecoration(
                          border: InputBorder.none,

                          prefixIcon: Icon(
                            Icons.location_on_outlined,
                            color: primaryBlue,
                          ),

                          hintText:
                              'Masukkan lokasi...',

                          hintStyle: TextStyle(
                            color: textGrey,
                          ),

                          contentPadding:
                              EdgeInsets.symmetric(
                            vertical: 17,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // BUDGET
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(16),
                        border: Border.all(
                          color:
                              const Color(0xFFE2EAF5),
                        ),
                      ),

                      child: TextField(
                        controller:
                            budgetController,

                        keyboardType:
                            TextInputType.number,

                        onSubmitted: (_) =>
                            cariKos(),

                        decoration:
                            const InputDecoration(
                          border: InputBorder.none,

                          prefixIcon: Icon(
                            Icons.payments_outlined,
                            color: primaryBlue,
                          ),

                          hintText:
                              'Budget maksimal, contoh: 1000000',

                          hintStyle: TextStyle(
                            color: textGrey,
                          ),

                          contentPadding:
                              EdgeInsets.symmetric(
                            vertical: 17,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 52,

                            child: ElevatedButton(
                              onPressed: cariKos,

                              style:
                                  ElevatedButton.styleFrom(
                                backgroundColor:
                                    primaryBlue,

                                foregroundColor:
                                    Colors.white,

                                elevation: 0,

                                shape:
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(
                                    15,
                                  ),
                                ),
                              ),

                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,

                                children: [
                                  Icon(
                                    Icons.search_rounded,
                                    size: 20,
                                  ),

                                  SizedBox(width: 8),

                                  Text(
                                    'Cari Kos',
                                    style: TextStyle(
                                      fontWeight:
                                          FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        SizedBox(
                          height: 52,

                          child: OutlinedButton(
                            onPressed:
                                resetPencarian,

                            style:
                                OutlinedButton.styleFrom(
                              foregroundColor:
                                  primaryBlue,

                              side: const BorderSide(
                                color: primaryBlue,
                              ),

                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                  15,
                                ),
                              ),
                            ),

                            child: const Icon(
                              Icons.refresh_rounded,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ==================================================
              // HASIL PENCARIAN
              // ==================================================

              Padding(
                padding:
                    const EdgeInsets.fromLTRB(
                  20,
                  30,
                  20,
                  0,
                ),

                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [
                    const Text(
                      'Kost Populer',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    if (hasilPencarian.length ==
                        dataKos.length)
                      const Text(
                        'Lihat semua',
                        style: TextStyle(
                          color: primaryBlue,
                          fontSize: 13,
                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),
                  ],
                ),
              ),

              if (hasilPencarian.isNotEmpty)
                Padding(
                  padding:
                      const EdgeInsets.fromLTRB(
                    20,
                    7,
                    20,
                    0,
                  ),
                  child: Text(
                    '${hasilPencarian.length} kos tersedia',
                    style: const TextStyle(
                      color: textGrey,
                      fontSize: 13,
                    ),
                  ),
                ),

              // ==================================================
              // LIST KOS
              // ==================================================

              if (hasilPencarian.isEmpty)
                Container(
                  width: double.infinity,

                  margin:
                      const EdgeInsets.fromLTRB(
                    20,
                    25,
                    20,
                    40,
                  ),

                  padding:
                      const EdgeInsets.all(35),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                        BorderRadius.circular(20),

                    border: Border.all(
                      color:
                          const Color(0xFFE2EAF5),
                    ),
                  ),

                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,

                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFEAF2FF,
                          ),
                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.search_off_rounded,
                          color: primaryBlue,
                          size: 34,
                        ),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        'Kos tidak ditemukan',
                        style: TextStyle(
                          color: darkBlue,
                          fontSize: 17,
                          fontWeight:
                              FontWeight.w800,
                        ),
                      ),

                      const SizedBox(height: 7),

                      const Text(
                        'Coba ubah lokasi atau budget pencarianmu.',
                        textAlign:
                            TextAlign.center,
                        style: TextStyle(
                          color: textGrey,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 18),

                      TextButton(
                        onPressed:
                            resetPencarian,

                        child: const Text(
                          'Reset Pencarian',
                        ),
                      ),
                    ],
                  ),
                ),

              if (hasilPencarian.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,

                  physics:
                      const NeverScrollableScrollPhysics(),

                  padding:
                      const EdgeInsets.fromLTRB(
                    20,
                    18,
                    20,
                    35,
                  ),

                  itemCount:
                      hasilPencarian.length,

                  itemBuilder:
                      (context, index) {
                    final KosModel kos =
                        hasilPencarian[index];

                    return Padding(
                      padding:
                          const EdgeInsets.only(
                        bottom: 16,
                      ),

                      child: KosCard(
                        name: kos.name,
                        location: kos.location,
                        price: kos.price,
                        rating: kos.rating,
                        imageUrl: kos.imageUrl,
                        facilities:
                            kos.facilities,

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailKosPage(
                                kos: kos,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// KOS CARD
// ============================================================

class KosCard extends StatelessWidget {
  final String name;
  final String location;
  final String price;
  final double rating;
  final String imageUrl;
  final List<String> facilities;
  final VoidCallback onTap;

  const KosCard({
    super.key,
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.facilities,
    required this.onTap,
  });

  static const Color primaryBlue =
      Color(0xFF3974C9);

  static const Color darkBlue =
      Color(0xFF18345E);

  static const Color textDark =
      Color(0xFF26364D);

  static const Color textGrey =
      Color(0xFF8290A5);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      borderRadius:
          BorderRadius.circular(20),

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(20),

          border: Border.all(
            color:
                const Color(0xFFE3EAF4),
          ),

          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.035),
              blurRadius: 15,
              offset:
                  const Offset(0, 6),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            // FOTO
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(
                top: Radius.circular(20),
              ),

              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 190,

                    child: Image.asset(
                      imageUrl,

                      fit: BoxFit.cover,

                      errorBuilder:
                          (context, error, stackTrace) {
                        return Container(
                          color:
                              const Color(0xFFEAF2FF),

                          child: const Center(
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              color: primaryBlue,
                              size: 45,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Positioned(
                    top: 14,
                    right: 14,

                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 7,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(12),
                      ),

                      child: Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFFB800),
                            size: 17,
                          ),

                          const SizedBox(width: 4),

                          Text(
                            rating.toString(),
                            style: const TextStyle(
                              color: darkBlue,
                              fontWeight:
                                  FontWeight.w800,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // INFORMASI
            Padding(
              padding:
                  const EdgeInsets.all(18),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Text(
                    name,

                    style: const TextStyle(
                      color: darkBlue,
                      fontSize: 18,
                      fontWeight:
                          FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: primaryBlue,
                        size: 17,
                      ),

                      const SizedBox(width: 5),

                      Expanded(
                        child: Text(
                          location,

                          style:
                              const TextStyle(
                            color: textGrey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text(
                    price,

                    style: const TextStyle(
                      color: primaryBlue,
                      fontSize: 16,
                      fontWeight:
                          FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Wrap(
                    spacing: 7,
                    runSpacing: 7,

                    children: facilities
                        .take(4)
                        .map(
                          (facility) {
                            return Container(
                              padding:
                                  const EdgeInsets
                                      .symmetric(
                                horizontal: 9,
                                vertical: 6,
                              ),

                              decoration:
                                  BoxDecoration(
                                color:
                                    const Color(
                                  0xFFEAF2FF,
                                ),

                                borderRadius:
                                    BorderRadius
                                        .circular(
                                  9,
                                ),
                              ),

                              child: Text(
                                facility,

                                style:
                                    const TextStyle(
                                  color:
                                      primaryBlue,
                                  fontSize: 11,
                                  fontWeight:
                                      FontWeight.w600,
                                ),
                              ),
                            );
                          },
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [
                      const Text(
                        'Lihat detail',
                        style: TextStyle(
                          color: textDark,
                          fontSize: 13,
                          fontWeight:
                              FontWeight.w700,
                        ),
                      ),

                      Container(
                        width: 35,
                        height: 35,

                        decoration:
                            BoxDecoration(
                          color:
                              const Color(
                            0xFFEAF2FF,
                          ),

                          borderRadius:
                              BorderRadius
                                  .circular(
                            9,
                          ),
                        ),

                        child: const Icon(
                          Icons
                              .arrow_forward_rounded,

                          color:
                              primaryBlue,

                          size: 17,
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