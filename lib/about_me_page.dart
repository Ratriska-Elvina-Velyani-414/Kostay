import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  // ================= WARNA SAMA DENGAN HOME =================

  static const Color primaryBlue = Color(0xFF3974C9);
  static const Color darkBlue = Color(0xFF18345E);
  static const Color textDark = Color(0xFF26364D);
  static const Color textGrey = Color(0xFF8290A5);
  static const Color background = Color(0xFFF9FBFF);
  static const Color lightBlue = Color(0xFFEAF2FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF1F6FF),
              Color(0xFFE4EEFC),
              Color(0xFFF9FBFF),
            ],
          ),
        ),

        child: Stack(
          children: [
            // ================= DEKORASI =================

            Positioned(
              top: -70,
              left: -70,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryBlue.withOpacity(0.10),
                ),
              ),
            ),

            Positioned(
              bottom: -80,
              right: -60,
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF6598DD).withOpacity(0.12),
                ),
              ),
            ),

            // ================= HEADER =================

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 15,
                ),
                child: Row(
                  children: [
                    const Text(
                      '⌂',
                      style: TextStyle(
                        color: primaryBlue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(width: 8),

                    const Text(
                      'KOSTAY',
                      style: TextStyle(
                        color: primaryBlue,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),

                    const Spacer(),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: darkBlue.withOpacity(0.06),
                            blurRadius: 10,
                          ),
                        ],
                      ),

                      child: const Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 18,
                            color: primaryBlue,
                          ),

                          SizedBox(width: 7),

                          Text(
                            'About Me',
                            style: TextStyle(
                              color: primaryBlue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ================= CONTENT =================

            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: 80,
                  bottom: 35,
                  left: 20,
                  right: 20,
                ),

                child: Container(
                  width: 650,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),

                    boxShadow: [
                      BoxShadow(
                        color: primaryBlue.withOpacity(0.15),
                        blurRadius: 30,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      // ================= BAGIAN BIRU =================

                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.symmetric(
                          vertical: 35,
                        ),

                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF3974C9),
                              Color(0xFF6598DD),
                            ],
                          ),

                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),

                        child: Column(
                          children: [
                            // ================= FOTO =================

                            Container(
                              padding: const EdgeInsets.all(5),

                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),

                              child: ClipOval(
                                child: Image.asset(
                                  'assets/IMG_1519.JPEG',
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            const SizedBox(height: 18),

                            // ================= NAMA =================

                            const Text(
                              'Ratriska Elvina Velyani',
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            const SizedBox(height: 10),

                            // ================= DEVELOPER =================

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 7,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.18),
                                borderRadius: BorderRadius.circular(20),
                              ),

                              child: const Text(
                                '✦  KOSTAY Developer',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ================= ISI =================

                      Padding(
                        padding: const EdgeInsets.all(35),

                        child: Column(
                          children: [
                            // ================= TENTANG KOSTAY =================

                            const Text(
                              'Tentang KOSTAY',
                              style: TextStyle(
                                color: darkBlue,
                                fontSize: 23,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            const SizedBox(height: 12),

                            const Text(
                              'KOSTAY adalah website yang dirancang '
                              'untuk membantu pengguna menemukan '
                              'tempat kos yang nyaman dan sesuai '
                              'dengan kebutuhan, lokasi, serta budget.',
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                color: textGrey,
                                fontSize: 15,
                                height: 1.7,
                              ),
                            ),

                            const SizedBox(height: 28),

                            // ================= INFORMASI =================

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(22),

                              decoration: BoxDecoration(
                                color: lightBlue,
                                borderRadius: BorderRadius.circular(20),

                                border: Border.all(
                                  color: const Color(0xFFD6E4F8),
                                ),
                              ),

                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                children: [
                                  const Text(
                                    'Informasi Pengembang',
                                    style: TextStyle(
                                      color: primaryBlue,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  _infoRow(
                                    Icons.person_outline,
                                    'Nama',
                                    'Ratriska Elvina Velyani',
                                  ),

                                  const SizedBox(height: 15),

                                  _infoRow(
                                    Icons.school_outlined,
                                    'Program Studi',
                                    'Teknik Informatika',
                                  ),

                                  const SizedBox(height: 15),

                                  _infoRow(
                                    Icons.account_balance_outlined,
                                    'Universitas',
                                    'Universitas Negeri Surabaya',
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 25),

                            // ================= QUOTE =================

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(18),

                              decoration: BoxDecoration(
                                color: const Color(0xFFEAF2FF),
                                borderRadius: BorderRadius.circular(18),
                              ),

                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.home_rounded,
                                    color: primaryBlue,
                                    size: 28,
                                  ),

                                  SizedBox(width: 12),

                                  Expanded(
                                    child: Text(
                                      'Temukan kos yang pas untukmu, '
                                      'dan jadikan tempat tinggal terasa '
                                      'seperti rumah.',

                                      style: TextStyle(
                                        color: darkBlue,
                                        fontSize: 14,
                                        height: 1.5,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 28),

                            // ================= BUTTON =================

                            SizedBox(
                              width: double.infinity,
                              height: 52,

                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                },

                                icon: const Icon(
                                  Icons.arrow_back_rounded,
                                ),

                                label: const Text(
                                  'Kembali ke Home',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryBlue,
                                  foregroundColor: Colors.white,
                                  elevation: 4,

                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= INFO ROW =================

  static Widget _infoRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,

          decoration: BoxDecoration(
            color: const Color(0xFFDCEAFF),
            borderRadius: BorderRadius.circular(12),
          ),

          child: Icon(
            icon,
            color: primaryBlue,
            size: 21,
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: textGrey,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                value,
                style: const TextStyle(
                  color: textDark,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}