import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // =========================
  // WARNA SAMA DENGAN HOME
  // =========================
  static const Color primaryBlue = Color(0xFF3974C9);
  static const Color darkBlue = Color(0xFF18345E);
  static const Color textDark = Color(0xFF26364D);
  static const Color textGrey = Color(0xFF8290A5);
  static const Color background = Color(0xFFF9FBFF);
  static const Color lightBlue = Color(0xFFEAF2FF);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void register() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua kolom harus diisi.'),
        ),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Konfirmasi password tidak sama.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pendaftaran berhasil!'),
      ),
    );
  }

  // =========================
  // STYLE TEXT FIELD
  // =========================
  InputDecoration inputDecoration({
    required String hintText,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: textGrey,
        fontSize: 14,
      ),
      prefixIcon: Icon(
        icon,
        color: primaryBlue,
      ),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: lightBlue,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: primaryBlue,
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 500,
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(45),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: darkBlue.withOpacity(0.08),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =========================
                // TOMBOL KEMBALI
                // =========================
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: darkBlue,
                  ),
                  tooltip: 'Kembali',
                ),

                const SizedBox(height: 15),

                // =========================
                // JUDUL
                // =========================
                const Text(
                  'Buat akun baru',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: darkBlue,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Daftar untuk mulai mencari kos impianmu.',
                  style: TextStyle(
                    color: textGrey,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 30),

                // =========================
                // NAMA LENGKAP
                // =========================
                const Text(
                  'Nama Lengkap',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: textDark,
                  ),
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: nameController,
                  decoration: inputDecoration(
                    hintText: 'Masukkan nama lengkap',
                    icon: Icons.person_outline,
                  ),
                ),

                const SizedBox(height: 18),

                // =========================
                // EMAIL
                // =========================
                const Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: textDark,
                  ),
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputDecoration(
                    hintText: 'Masukkan email',
                    icon: Icons.email_outlined,
                  ),
                ),

                const SizedBox(height: 18),

                // =========================
                // PASSWORD
                // =========================
                const Text(
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: textDark,
                  ),
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: passwordController,
                  obscureText: obscurePassword,
                  decoration: inputDecoration(
                    hintText: 'Masukkan password',
                    icon: Icons.lock_outline,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: primaryBlue,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // =========================
                // KONFIRMASI PASSWORD
                // =========================
                const Text(
                  'Konfirmasi Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: textDark,
                  ),
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: confirmPasswordController,
                  obscureText: obscureConfirmPassword,
                  decoration: inputDecoration(
                    hintText: 'Masukkan ulang password',
                    icon: Icons.lock_outline,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureConfirmPassword =
                              !obscureConfirmPassword;
                        });
                      },
                      icon: Icon(
                        obscureConfirmPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: primaryBlue,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // =========================
                // TOMBOL DAFTAR
                // =========================
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Daftar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                // =========================
                // LINK LOGIN
                // =========================
                Center(
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        color: textGrey,
                        fontSize: 14,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Sudah punya akun? ',
                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: primaryBlue,
                                fontWeight: FontWeight.bold,
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
    );
  }
}