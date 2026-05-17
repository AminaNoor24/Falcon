import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscure = true;
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FalconColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          child: Column(
            children: [
              const SizedBox(height: 24),
              // Brand header
              Text(
                'FALCON',
                style: GoogleFonts.crimsonPro(
                  fontSize: 52, fontWeight: FontWeight.w600,
                  letterSpacing: 8, color: FalconColors.onSurface,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'EXPERIENCE ELEVATED SERVICE',
                style: GoogleFonts.manrope(
                  fontSize: 10, fontWeight: FontWeight.w500,
                  letterSpacing: 2.5, color: FalconColors.tertiary,
                ),
              ),
              const SizedBox(height: 40),
              // Card
              Container(
                decoration: BoxDecoration(
                  color: FalconColors.surfaceLowest,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: FalconColors.outlineVar.withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF211A17).withOpacity(0.05),
                      blurRadius: 30, offset: const Offset(0, 8),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Welcome Back',
                        style: GoogleFonts.crimsonPro(
                          fontSize: 36, fontWeight: FontWeight.w600,
                          color: FalconColors.onSurface,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Sign in to access your world',
                        style: GoogleFonts.manrope(
                          fontSize: 14, color: FalconColors.onSurfaceVar,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Email
                    _InputField(
                      controller: _emailCtrl,
                      hint: 'name@company.com',
                      icon: Icons.mail_outline,
                      type: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    // Password
                    _InputField(
                      controller: _passCtrl,
                      hint: '••••••••',
                      icon: Icons.lock_outline,
                      obscure: _obscure,
                      suffix: IconButton(
                        icon: Icon(
                          _obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          size: 18, color: FalconColors.outline,
                        ),
                        onPressed: () => setState(() => _obscure = !_obscure),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ForgotPasswordScreen())),
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.manrope(
                            fontSize: 12, color: FalconColors.primary, fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Sign In button
                    ElevatedButton(
                      onPressed: () {
                        const testEmail = 'test@falcon.com';
                        const testPassword = 'password123';

                        if (_emailCtrl.text.trim() == testEmail &&
                            _passCtrl.text == testPassword) {
                          Navigator.of(context).pushReplacementNamed('/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Invalid email or password.',
                                style: GoogleFonts.manrope(fontSize: 13, color: Colors.white),
                              ),
                              backgroundColor: FalconColors.onSurface,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              margin: const EdgeInsets.all(16),
                            ),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('SIGN IN',
                            style: GoogleFonts.manrope(fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: 2),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward, size: 18),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    // Divider
                    Row(children: [
                      const Expanded(child: Divider(color: FalconColors.outlineVar)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text('Or continue with',
                          style: GoogleFonts.manrope(fontSize: 11, color: FalconColors.outline, letterSpacing: 0.5),
                        ),
                      ),
                      const Expanded(child: Divider(color: FalconColors.outlineVar)),
                    ]),
                    const SizedBox(height: 20),
                    // Social buttons
                    Row(children: [
                      Expanded(child: _SocialButton(label: 'Google', icon: Icons.g_mobiledata_rounded)),
                      const SizedBox(width: 12),
                      Expanded(child: _SocialButton(label: 'Facebook', icon: Icons.facebook_rounded)),
                    ]),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("New to Falcon? ",
                  style: GoogleFonts.manrope(fontSize: 14, color: FalconColors.onSurfaceVar),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text('Create an account',
                    style: GoogleFonts.manrope(
                      fontSize: 14, color: FalconColors.primary,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: FalconColors.primary,
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 24),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                _footerLink('Privacy Policy'),
                const SizedBox(width: 20),
                _footerLink('Terms of Service'),
              ]),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerLink(String label) => Text(
    label.toUpperCase(),
    style: GoogleFonts.manrope(fontSize: 10, letterSpacing: 1.5, color: FalconColors.outline),
  );
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType type;
  final bool obscure;
  final Widget? suffix;

  const _InputField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.type = TextInputType.text,
    this.obscure = false,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      obscureText: obscure,
      style: GoogleFonts.manrope(fontSize: 15, color: FalconColors.onSurface),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, size: 18, color: FalconColors.outline),
        suffixIcon: suffix,
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;
  const _SocialButton({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: FalconColors.surfaceLow,
        side: BorderSide(color: FalconColors.outlineVar.withOpacity(0.4)),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: FalconColors.onSurface),
          const SizedBox(width: 8),
          Text(label, style: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w600, color: FalconColors.onSurface)),
        ],
      ),
    );
  }
}
