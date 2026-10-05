import 'package:flutter/material.dart';
import 'models/kos_model.dart';

class DetailKosPage extends StatelessWidget {
  final KosModel kos;

  const DetailKosPage({
    super.key,
    required this.kos,
  });

  // ================= WARNA SAMA DENGAN HOME =================

  static const Color primaryBlue =
      Color(0xFF3974C9);

  static const Color darkBlue =
      Color(0xFF18345E);

  static const Color textDark =
      Color(0xFF26364D);

  static const Color textGrey =
      Color(0xFF8290A5);

  static const Color background =
      Color(0xFFF9FBFF);

  static const Color lightBlue =
      Color(0xFFEAF2FF);

  // ================= ICON FASILITAS =================

  IconData getFacilityIcon(String facility) {
    final text = facility.toLowerCase();

    if (text == 'wifi') {
      return Icons.wifi_rounded;
    }

    if (text == 'ac') {
      return Icons.ac_unit_rounded;
    }

    if (text.contains('kamar mandi')) {
      return Icons.shower_rounded;
    }

    if (text == 'parkir') {
      return Icons.local_parking_rounded;
    }

    if (text == 'laundry') {
      return Icons.local_laundry_service_rounded;
    }

    if (text == 'kasur') {
      return Icons.bed_rounded;
    }

    if (text == 'lemari') {
      return Icons.door_sliding_rounded;
    }

    if (text == 'meja') {
      return Icons.table_restaurant_rounded;
    }

    if (text == 'dapur') {
      return Icons.soup_kitchen_rounded;
    }

    if (text == 'dapur bersama') {
      return Icons.restaurant_rounded;
    }

    if (text == 'cctv') {
      return Icons.videocam_rounded;
    }

    if (text == 'tv') {
      return Icons.tv_rounded;
    }

    if (text == 'kipas') {
      return Icons.toys_rounded;
    }

    return Icons.check_circle_outline_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      // ================= APPBAR =================

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(
            Icons.arrow_back,
            color: primaryBlue,
          ),
        ),

        title: const Text(
          'Detail Kos',
          style: TextStyle(
            color: darkBlue,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      // ================= BODY =================

      body: SingleChildScrollView(
        physics:
            const BouncingScrollPhysics(),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            // ================= FOTO =================

            Padding(
              padding:
                  const EdgeInsets.all(20),

              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(22),

                child: SizedBox(
                  width: double.infinity,
                  height: 270,

                  child: Image.asset(
                    kos.imageUrl,

                    fit: BoxFit.cover,

                    errorBuilder:
                        (context, error, stackTrace) {
                      return Container(
                        color: lightBlue,

                        child: const Center(
                          child: Icon(
                            Icons
                                .image_not_supported_outlined,
                            color: primaryBlue,
                            size: 55,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // ================= INFORMASI UTAMA =================

            Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      Expanded(
                        child: Text(
                          kos.name,

                          style:
                              const TextStyle(
                            color: darkBlue,
                            fontSize: 25,
                            fontWeight:
                                FontWeight.w900,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Container(
                        padding:
                            const EdgeInsets
                                .symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),

                        decoration:
                            BoxDecoration(
                          color: lightBlue,

                          borderRadius:
                              BorderRadius.circular(
                            12,
                          ),
                        ),

                        child: Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color:
                                  Color(0xFFFFB800),
                              size: 18,
                            ),

                            const SizedBox(width: 4),

                            Text(
                              kos.rating.toString(),

                              style:
                                  const TextStyle(
                                color: darkBlue,
                                fontWeight:
                                    FontWeight.w800,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // LOKASI
                  Row(
                    children: [
                      const Icon(
                        Icons
                            .location_on_outlined,
                        color: primaryBlue,
                        size: 20,
                      ),

                      const SizedBox(width: 7),

                      Expanded(
                        child: Text(
                          kos.location,

                          style:
                              const TextStyle(
                            color: textGrey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // HARGA
                  Container(
                    width: double.infinity,

                    padding:
                        const EdgeInsets.all(
                      18,
                    ),

                    decoration:
                        BoxDecoration(
                      color: lightBlue,

                      borderRadius:
                          BorderRadius.circular(
                        17,
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        const Text(
                          'Harga mulai dari',
                          style: TextStyle(
                            color: textGrey,
                            fontSize: 12,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          kos.price,

                          style:
                              const TextStyle(
                            color: primaryBlue,
                            fontSize: 20,
                            fontWeight:
                                FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 27),

                  // ================= FASILITAS =================

                  const Text(
                    'Fasilitas',
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 21,
                      fontWeight:
                          FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    '${kos.facilities.length} fasilitas tersedia',

                    style: const TextStyle(
                      color: textGrey,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 15),

                  GridView.builder(
                    shrinkWrap: true,

                    physics:
                        const NeverScrollableScrollPhysics(),

                    itemCount:
                        kos.facilities.length,

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,

                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,

                      childAspectRatio: 2.9,
                    ),

                    itemBuilder:
                        (context, index) {
                      final facility =
                          kos.facilities[index];

                      return Container(
                        padding:
                            const EdgeInsets
                                .symmetric(
                          horizontal: 13,
                        ),

                        decoration:
                            BoxDecoration(
                          color: Colors.white,

                          borderRadius:
                              BorderRadius.circular(
                            14,
                          ),

                          border: Border.all(
                            color:
                                const Color(
                              0xFFE2EAF5,
                            ),
                          ),
                        ),

                        child: Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,

                              decoration:
                                  BoxDecoration(
                                color:
                                    lightBlue,

                                borderRadius:
                                    BorderRadius
                                        .circular(
                                  10,
                                ),
                              ),

                              child: Icon(
                                getFacilityIcon(
                                  facility,
                                ),

                                color:
                                    primaryBlue,

                                size: 19,
                              ),
                            ),

                            const SizedBox(width: 9),

                            Expanded(
                              child: Text(
                                facility,

                                style:
                                    const TextStyle(
                                  color:
                                      textDark,
                                  fontSize: 12,
                                  fontWeight:
                                      FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 28),

                  // ================= TENTANG KOS =================

                  const Text(
                    'Tentang Kos',
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 21,
                      fontWeight:
                          FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    width: double.infinity,

                    padding:
                        const EdgeInsets.all(
                      18,
                    ),

                    decoration:
                        BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                          BorderRadius.circular(
                        17,
                      ),

                      border: Border.all(
                        color:
                            const Color(
                          0xFFE2EAF5,
                        ),
                      ),
                    ),

                    child: Text(
                      kos.description,

                      style: const TextStyle(
                        color: textGrey,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ================= BUTTON =================

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton.icon(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.chat_bubble_outline_rounded,
                      ),

                      label: const Text(
                        'Hubungi Pemilik Kos',

                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

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
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}