import 'package:flutter/material.dart';
import 'register_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  // ==============================
  // WARNA
  // ==============================

  static const Color primaryBlue = Color(0xFF3974C9);
  static const Color darkBlue = Color(0xFF18345E);
  static const Color textDark = Color(0xFF26364D);
  static const Color textGrey = Color(0xFF8290A5);
  static const Color background = Color(0xFFF9FBFF);

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // ==============================
  // LOGO
  // ==============================

  Widget kostayLogo({
    bool white = false,
    double size = 22,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size + 8,
          height: size + 8,
          decoration: BoxDecoration(
            border: Border.all(
              color: white ? Colors.white : primaryBlue,
              width: 2.4,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            Icons.home_rounded,
            color: white ? Colors.white : primaryBlue,
            size: size - 1,
          ),
        ),

        const SizedBox(width: 9),

        Text(
          'KOSTAY',
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
            color: white ? Colors.white : primaryBlue,
          ),
        ),
      ],
    );
  }

  // ==============================
  // INPUT
  // ==============================

  Widget inputField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            color: textDark,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,

          style: const TextStyle(
            fontSize: 13.5,
            color: textDark,
            fontWeight: FontWeight.w500,
          ),

          decoration: InputDecoration(
            hintText: hint,

            hintStyle: const TextStyle(
              fontSize: 13.5,
              color: Color(0xFF9BA8B9),
            ),

            prefixIcon: Icon(
              icon,
              color: Color(0xFF8DA0B8),
              size: 20,
            ),

            suffixIcon: suffixIcon,

            filled: true,
            fillColor: Colors.white,

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 17,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFFDCE5F0),
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: primaryBlue,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ==============================
  // FITUR KIRI
  // ==============================

  Widget leftFeature(
    IconData icon,
    String text,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: const Color.fromARGB(75, 255, 255, 255),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 19,
          ),
        ),

        const SizedBox(width: 8),

        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // ==============================
  // LOGIN
  // ==============================

  void login() {
    final nama = nameController.text.trim();

    if (nama.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Masukkan nama kamu terlebih dahulu.',
          ),
        ),
      );

      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          userName: nama,
        ),
      ),
    );
  }

  // ==============================
  // BUILD
  // ==============================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: LayoutBuilder(
        builder: (context, constraints) {

          // =====================================================
          // LAPTOP / DESKTOP
          // =====================================================

          if (constraints.maxWidth >= 850) {
            return Row(
              children: [

                // =================================================
                // BAGIAN KIRI
                // =================================================

                Expanded(
                  flex: 55,

                  child: Stack(
                    fit: StackFit.expand,

                    children: [

                      // FOTO
                      Image.asset(
                        'assets/download.jpg',
                        fit: BoxFit.cover,
                      ),

                      // OVERLAY BIRU
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(150, 34, 72, 118),
                              Color.fromARGB(90, 59, 113, 180),
                              Color.fromARGB(180, 30, 76, 135),
                            ],
                          ),
                        ),
                      ),

                      // GRADIENT BAWAH
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Color.fromARGB(95, 18, 52, 92),
                            ],
                          ),
                        ),
                      ),

                      // ISI KIRI
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 55,
                          vertical: 45,
                        ),

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [

                            // LOGO
                            kostayLogo(
                              white: true,
                              size: 22,
                            ),

                            const Spacer(),

                            const Text(
                              'WELCOME TO KOSTAY',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),

                            const SizedBox(height: 12),

                            // JUDUL
                            const Text(
                              'TEMUKAN KOS\n'
                              'YANG PAS UNTUKMU.',
                              style: TextStyle(
                                fontSize: 39,
                                height: 1.12,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                letterSpacing: 0.1,
                              ),
                            ),

                            const SizedBox(height: 16),

                            const Text(
                              'Cari kos nyaman sesuai kebutuhanmu.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),

                            const SizedBox(height: 24),

                            Container(
                              width: 55,
                              height: 3,
                              decoration: BoxDecoration(
                                color: const Color(0xFF8DC4FF),
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                            ),

                            const SizedBox(height: 27),

                            // FITUR
                            Row(
                              children: [
                                leftFeature(
                                  Icons.search_rounded,
                                  'Cari',
                                ),

                                const SizedBox(width: 27),

                                leftFeature(
                                  Icons.compare_arrows_rounded,
                                  'Bandingkan',
                                ),

                                const SizedBox(width: 27),

                                leftFeature(
                                  Icons.favorite_border_rounded,
                                  'Temukan',
                                ),
                              ],
                            ),

                            const SizedBox(height: 43),

                            const Text(
                              'Better room,\nbetter living.',
                              style: TextStyle(
                                fontSize: 15,
                                height: 1.35,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // =================================================
                // BAGIAN KANAN
                // =================================================

                Expanded(
                  flex: 45,

                  child: Container(
                    color: background,

                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 55,
                          vertical: 35,
                        ),

                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 500,
                          ),

                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              // LOGO
                              kostayLogo(
                                size: 20,
                              ),

                              const SizedBox(height: 40),

                              // ICON RUMAH
                              Container(
                                width: 55,
                                height: 55,

                                decoration: BoxDecoration(
                                  color: const Color(0xFFEAF2FF),
                                  borderRadius:
                                      BorderRadius.circular(16),
                                ),

                                child: const Icon(
                                  Icons.home_rounded,
                                  color: primaryBlue,
                                  size: 29,
                                ),
                              ),

                              const SizedBox(height: 17),

                              // TITLE
                              const Text(
                                'Welcome back!',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w800,
                                  color: darkBlue,
                                  height: 1.1,
                                ),
                              ),

                              const SizedBox(height: 8),

                              const Text(
                                'Masuk untuk melanjutkan perjalananmu.',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: textGrey,
                                ),
                              ),

                              const SizedBox(height: 29),

                              // NAMA
                              inputField(
                                label: 'Nama',
                                hint: 'Masukkan nama kamu',
                                icon:
                                    Icons.person_outline_rounded,
                                controller: nameController,
                              ),

                              const SizedBox(height: 17),

                              // EMAIL
                              inputField(
                                label: 'Email',
                                hint: 'Masukkan email',
                                icon: Icons.email_outlined,
                                controller: emailController,
                                keyboardType:
                                    TextInputType.emailAddress,
                              ),

                              const SizedBox(height: 17),

                              // PASSWORD
                              inputField(
                                label: 'Password',
                                hint: 'Masukkan password',
                                icon:
                                    Icons.lock_outline_rounded,
                                controller: passwordController,
                                obscureText: obscurePassword,

                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscurePassword =
                                          !obscurePassword;
                                    });
                                  },

                                  icon: Icon(
                                    obscurePassword
                                        ? Icons
                                            .visibility_off_outlined
                                        : Icons
                                            .visibility_outlined,
                                    color:
                                        const Color(0xFF8DA0B8),
                                    size: 20,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 2),

                              // LUPA PASSWORD
                              Align(
                                alignment:
                                    Alignment.centerRight,

                                child: TextButton(
                                  onPressed: () {},

                                  child: const Text(
                                    'Lupa password?',
                                    style: TextStyle(
                                      color: primaryBlue,
                                      fontSize: 12.5,
                                      fontWeight:
                                          FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),

                              // TOMBOL
                              SizedBox(
                                width: double.infinity,
                                height: 51,

                                child: ElevatedButton(
                                  onPressed: login,

                                  style:
                                      ElevatedButton.styleFrom(
                                    backgroundColor:
                                        primaryBlue,
                                    foregroundColor:
                                        Colors.white,
                                    elevation: 2,

                                    shadowColor:
                                        const Color.fromARGB(
                                      50,
                                      57,
                                      116,
                                      201,
                                    ),

                                    shape:
                                        RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12),
                                    ),
                                  ),

                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,

                                    children: [
                                      const Text(
                                        'Masuk',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight:
                                              FontWeight.w700,
                                        ),
                                      ),

                                      const SizedBox(width: 9),

                                      const Icon(
                                        Icons
                                            .arrow_forward_rounded,
                                        size: 19,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 21),

                              // PEMISAH
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: const Color(
                                        0xFFDDE5EF,
                                      ),
                                    ),
                                  ),

                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(
                                      horizontal: 14,
                                    ),

                                    child: Text(
                                      'atau',
                                      style: TextStyle(
                                        fontSize: 11.5,
                                        color: textGrey,
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: const Color(
                                        0xFFDDE5EF,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 18),

                              // GOOGLE
                              SizedBox(
                                width: double.infinity,
                                height: 48,

                                child: OutlinedButton(
                                  onPressed: () {},

                                  style:
                                      OutlinedButton.styleFrom(
                                    backgroundColor:
                                        Colors.white,

                                    side: const BorderSide(
                                      color: Color(0xFFDCE5F0),
                                    ),

                                    shape:
                                        RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12),
                                    ),
                                  ),

                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,

                                    children: [
                                      const Text(
                                        'G',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight:
                                              FontWeight.w800,
                                          color:
                                              Color(0xFF4285F4),
                                        ),
                                      ),

                                      const SizedBox(width: 9),

                                      const Text(
                                        'Masuk dengan Google',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight:
                                              FontWeight.w600,
                                          color: textDark,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 21),

                              // DAFTAR
                              Center(
                                child: Text.rich(
                                  TextSpan(
                                    style: const TextStyle(
                                      fontSize: 12.5,
                                      color: textGrey,
                                    ),

                                    children: [
                                      const TextSpan(
                                        text:
                                            'Belum punya akun? ',
                                      ),

                                      WidgetSpan(
                                        child:
                                            GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) =>
                                                        const RegisterPage(),
                                              ),
                                            );
                                          },

                                          child: const Text(
                                            'Daftar sekarang →',
                                            style: TextStyle(
                                              color:
                                                  primaryBlue,
                                              fontSize: 12.5,
                                              fontWeight:
                                                  FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          // =====================================================
          // TAMPILAN HP
          // =====================================================

          return SingleChildScrollView(
            child: Column(
              children: [

                // FOTO ATAS
                SizedBox(
                  height: 275,

                  child: Stack(
                    fit: StackFit.expand,

                    children: [
                      Image.asset(
                        'assets/download.jpg',
                        fit: BoxFit.cover,
                      ),

                      Container(
                        decoration:
                            const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(95, 30, 72, 120),
                              Color.fromARGB(195, 27, 70, 122),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(25),

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [
                            kostayLogo(
                              white: true,
                              size: 20,
                            ),

                            const Spacer(),

                            const Text(
                              'TEMUKAN KOS\n'
                              'YANG PAS UNTUKMU.',
                              style: TextStyle(
                                fontSize: 27,
                                height: 1.1,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // FORM
                Container(
                  width: double.infinity,
                  color: background,

                  padding: const EdgeInsets.all(25),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      kostayLogo(
                        size: 20,
                      ),

                      const SizedBox(height: 32),

                      const Text(
                        'Welcome back!',
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.w800,
                          color: darkBlue,
                        ),
                      ),

                      const SizedBox(height: 7),

                      const Text(
                        'Masuk untuk melanjutkan perjalananmu.',
                        style: TextStyle(
                          fontSize: 13,
                          color: textGrey,
                        ),
                      ),

                      const SizedBox(height: 28),

                      inputField(
                        label: 'Nama',
                        hint: 'Masukkan nama kamu',
                        icon:
                            Icons.person_outline_rounded,
                        controller: nameController,
                      ),

                      const SizedBox(height: 17),

                      inputField(
                        label: 'Email',
                        hint: 'Masukkan email',
                        icon: Icons.email_outlined,
                        controller: emailController,
                        keyboardType:
                            TextInputType.emailAddress,
                      ),

                      const SizedBox(height: 17),

                      inputField(
                        label: 'Password',
                        hint: 'Masukkan password',
                        icon:
                            Icons.lock_outline_rounded,
                        controller: passwordController,
                        obscureText: obscurePassword,

                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassword =
                                  !obscurePassword;
                            });
                          },

                          icon: Icon(
                            obscurePassword
                                ? Icons
                                    .visibility_off_outlined
                                : Icons
                                    .visibility_outlined,
                            color:
                                const Color(0xFF8DA0B8),
                          ),
                        ),
                      ),

                      const SizedBox(height: 2),

                      Align(
                        alignment: Alignment.centerRight,

                        child: TextButton(
                          onPressed: () {},

                          child: const Text(
                            'Lupa password?',
                            style: TextStyle(
                              color: primaryBlue,
                              fontSize: 12.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      SizedBox(
                        width: double.infinity,
                        height: 51,

                        child: ElevatedButton(
                          onPressed: login,

                          style:
                              ElevatedButton.styleFrom(
                            backgroundColor:
                                primaryBlue,
                            foregroundColor:
                                Colors.white,
                            elevation: 2,

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12),
                            ),
                          ),

                          child: const Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,

                            children: [
                              Text(
                                'Masuk',
                                style: TextStyle(
                                  fontWeight:
                                      FontWeight.w700,
                                ),
                              ),

                              SizedBox(width: 8),

                              Icon(
                                Icons
                                    .arrow_forward_rounded,
                                size: 19,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Center(
                        child: Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              color: textGrey,
                              fontSize: 12.5,
                            ),

                            children: [
                              const TextSpan(
                                text:
                                    'Belum punya akun? ',
                              ),

                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage(),
                                      ),
                                    );
                                  },

                                  child: const Text(
                                    'Daftar sekarang',
                                    style: TextStyle(
                                      color: primaryBlue,
                                      fontWeight:
                                          FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
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