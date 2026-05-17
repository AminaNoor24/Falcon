import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailCtrl = TextEditingController();
  bool _sent = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_emailCtrl.text.trim().isEmpty) return;
    setState(() => _sent = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FalconColors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          color: FalconColors.background,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, size: 20, color: FalconColors.onSurface),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'FALCON',
                      style: GoogleFonts.crimsonPro(
                        fontSize: 20, fontWeight: FontWeight.w600,
                        letterSpacing: 4, color: FalconColors.onSurface,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
          child: Column(
            children: [
              const SizedBox(height: 16),

              // Heading
              _sent
                ? Text(
                    'Check your\nInbox.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.crimsonPro(
                      fontSize: 44, fontWeight: FontWeight.w600,
                      height: 1.15, color: FalconColors.onSurface,
                    ),
                  )
                : Column(
                    children: [
                      Text(
                        'Restore your',
                        style: GoogleFonts.crimsonPro(
                          fontSize: 44, fontWeight: FontWeight.w700,
                          height: 1.15, color: FalconColors.onSurface,
                        ),
                      ),
                      Text(
                        'Haven',
                        style: GoogleFonts.crimsonPro(
                          fontSize: 44, fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          height: 1.1, color: const Color.fromARGB(255, 176, 188, 172),
                        ),
                      ),
                    ],
                  ),
              Text(
                _sent
                    ? 'A recovery link has been sent to your email address.'
                    : '\n\nEnter your registered email and we\'ll send you a recovery link.',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 13, color: FalconColors.onSurfaceVar, height: 1.6,
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
                child: _sent ? _SuccessBody(email: _emailCtrl.text.trim()) : _FormBody(
                  emailCtrl: _emailCtrl,
                  onSubmit: _submit,
                ),
              ),

              const SizedBox(height: 32),

              // Back to login
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.chevron_left, size: 18, color: FalconColors.primary),
                    Text(
                      'Back to Login',
                      style: GoogleFonts.manrope(
                        fontSize: 14, fontWeight: FontWeight.w600,
                        color: FalconColors.primary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Footer
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _footerLink('PRIVACY POLICY'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(width: 4, height: 4, decoration: const BoxDecoration(color: FalconColors.outlineVar, shape: BoxShape.circle)),
                      ),
                      _footerLink('TERMS OF SERVICE'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '© 2026 FALCON SYSTEMS',
                    style: GoogleFonts.manrope(fontSize: 10, letterSpacing: 1.5, color: FalconColors.outline.withOpacity(0.4)),
                  ),
                ],
              ),
              const SizedBox(height: 24),
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

// ── Form state ──────────────────────────────────────────
class _FormBody extends StatelessWidget {
  final TextEditingController emailCtrl;
  final VoidCallback onSubmit;
  const _FormBody({required this.emailCtrl, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'REGISTERED MAIL',
            style: GoogleFonts.manrope(
              fontSize: 13, fontWeight: FontWeight.w700,
              letterSpacing: 2, color: FalconColors.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 28),

        // Email input
        TextField(
          controller: emailCtrl,
          keyboardType: TextInputType.emailAddress,
          style: GoogleFonts.manrope(fontSize: 15, color: FalconColors.onSurface),
          decoration: InputDecoration(
            hintText: 'Email Address',
            prefixIcon: Icon(Icons.mail_outline, size: 18, color: FalconColors.outline),
            hintStyle: GoogleFonts.manrope(fontSize: 14, color: FalconColors.outline.withOpacity(0.6)),
          ),
        ),
        const SizedBox(height: 32),

        // Send button
        ElevatedButton(
          onPressed: onSubmit,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('SEND RECOVERY LINK',
                style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 1.5),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Success state ────────────────────────────────────────
class _SuccessBody extends StatelessWidget {
  final String email;
  const _SuccessBody({required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 72, height: 72,
          decoration: BoxDecoration(
            color: FalconColors.primaryFixed.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.mark_email_read_outlined, size: 32, color: FalconColors.primary),
        ),
        const SizedBox(height: 20),
        Text(
          'Link sent to',
          style: GoogleFonts.manrope(fontSize: 13, color: FalconColors.onSurfaceVar),
        ),
        const SizedBox(height: 4),
        Text(
          email,
          style: GoogleFonts.manrope(fontSize: 15, fontWeight: FontWeight.w700, color: FalconColors.onSurface),
        ),
        const SizedBox(height: 24),
        Text(
          'Didn\'t receive it? Check your spam folder or try again.',
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(fontSize: 12, color: FalconColors.onSurfaceVar, height: 1.5),
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          onPressed: () {},
          child: Text('Resend Email',
            style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w600, color: FalconColors.onSurface),
          ),
        ),
      ],
    );
  }
}
