import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName;

  const ProfilePage({
    super.key,
    required this.userName,
  });

  // ================= WARNA SESUAI HOME =================
  static const Color primaryBlue = Color(0xFF3974C9);
  static const Color darkBlue = Color(0xFF18345E);
  static const Color textDark = Color(0xFF26364D);
  static const Color textGrey = Color(0xFF8290A5);
  static const Color background = Color(0xFFF9FBFF);
  static const Color lightBlue = Color(0xFFEAF2FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: primaryBlue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'Profil Saya',
          style: TextStyle(
            color: darkBlue,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      // ================= BODY =================
      body: Center(
        child: Container(
          width: 500,
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.all(30),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),

            border: Border.all(
              color: const Color(0xFFE2E9F2),
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ================= FOTO PROFIL =================
              const CircleAvatar(
                radius: 55,
                backgroundColor: lightBlue,

                child: Icon(
                  Icons.person_rounded,
                  size: 60,
                  color: primaryBlue,
                ),
              ),

              const SizedBox(height: 20),

              // ================= NAMA =================
              Text(
                userName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: darkBlue,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Pengguna KOSTAY',
                style: TextStyle(
                  fontSize: 13,
                  color: textGrey,
                ),
              ),

              const SizedBox(height: 30),

              // ================= INFORMASI NAMA =================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color(0xFFE5EBF3),
                  ),
                ),

                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: const Icon(
                        Icons.person_outline_rounded,
                        color: primaryBlue,
                        size: 21,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nama Pengguna',
                            style: TextStyle(
                              fontSize: 12,
                              color: textGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            userName,
                            style: const TextStyle(
                              fontSize: 16,
                              color: textDark,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // ================= STATUS =================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color(0xFFE5EBF3),
                  ),
                ),

                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: lightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: const Icon(
                        Icons.home_outlined,
                        color: primaryBlue,
                        size: 21,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Status',
                            style: TextStyle(
                              fontSize: 12,
                              color: textGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 4),

                          const Text(
                            'Pencari Kos',
                            style: TextStyle(
                              fontSize: 16,
                              color: textDark,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
