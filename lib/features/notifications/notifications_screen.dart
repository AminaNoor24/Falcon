import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:falcon/core/theme/app_theme.dart';
import 'package:falcon/shared/widgets/falcon_shell.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static const _today = [
    _Notif(Icons.calendar_month_outlined, Color(0xFF536253), 'Booking Accepted',
        'Julian Voss has accepted your ', 'Structural Integrity Audit', ' request for next Tuesday.', '2m ago', true),
    _Notif(Icons.chat_bubble_outline, Color(0xFF4F5E80), 'New Message',
        'Sarah Jenkins: "I\'ve attached the latest portfolio performance report for your review."', '', '', '1h ago', true),
  ];

  static const _earlier = [
    _Notif(Icons.check_circle_outline, Color(0xFFB9B8B8), 'Booking Completed',
        'The Annual Fiscal Strategy session with Marcus Thorne is now complete.', '', '', 'Yesterday', false),
    _Notif(Icons.star_outline, Color(0xFFB9B8B8), 'Review Reminder',
        'How was your experience with Helena? Share your feedback to help the Falcon community.', '', '', '2d ago', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FalconColors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(68),
        child: Container(
          height: 68,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: FalconColors.background,
            border: Border(bottom: BorderSide(color: FalconColors.outlineVar.withOpacity(0.3))),
          ),
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, size: 20, color: FalconColors.onSurface),
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
                Expanded(
                  child: Center(
                    child: Text('FALCON',
                      style: GoogleFonts.crimsonPro(
                        fontSize: 20, fontWeight: FontWeight.w600,
                        letterSpacing: 4, color: FalconColors.onSurface,
                      ),
                    ),
                  ),
                ),
                // Mark all read icon
                IconButton(
                  icon: const Icon(Icons.done_all_rounded, size: 22, color: FalconColors.primary),
                  tooltip: 'Mark all as read',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('All notifications marked as read',
                          style: GoogleFonts.manrope(fontSize: 13, color: Colors.white),
                        ),
                        backgroundColor: FalconColors.onSurface,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.all(16),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20),
          Text('Notifications',
            style: GoogleFonts.manrope(
              fontSize: 26, fontWeight: FontWeight.w700, color: FalconColors.onSurface,
            ),
          ),
          const SizedBox(height: 20),
          _GroupLabel('TODAY'),
          const SizedBox(height: 10),
          ..._today.map((n) => _NotifCard(notif: n)).toList(),
          const SizedBox(height: 20),
          _GroupLabel('EARLIER'),
          const SizedBox(height: 10),
          ..._earlier.map((n) => _NotifCard(notif: n)).toList(),
          const SizedBox(height: 40),
        ],
      ),
      bottomNavigationBar: FalconBottomNav(
        currentIndex: -1, // none selected — notifications is not a tab
        onTap: (i) {
          if (i == 2) return;
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
      ),
    );
  }
}

class _GroupLabel extends StatelessWidget {
  final String label;
  const _GroupLabel(this.label);
  @override
  Widget build(BuildContext context) => Text(label,
    style: GoogleFonts.manrope(fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 1.5, color: FalconColors.tertiary),
  );
}

class _NotifCard extends StatelessWidget {
  final _Notif notif;
  const _NotifCard({required this.notif});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FalconColors.surfaceLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: FalconColors.outlineVar.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48, height: 48,
            decoration: BoxDecoration(
              color: notif.iconColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(notif.icon, size: 22, color: notif.iconColor),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(notif.title,
                      style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: FalconColors.onSurface),
                    ),
                    Text(notif.time,
                      style: GoogleFonts.manrope(fontSize: 11, color: FalconColors.tertiary),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.manrope(fontSize: 13, color: FalconColors.onSurfaceVar, height: 1.5),
                    children: [
                      TextSpan(text: notif.body),
                      if (notif.boldPart.isNotEmpty)
                        TextSpan(text: notif.boldPart,
                          style: GoogleFonts.manrope(fontWeight: FontWeight.w700, color: FalconColors.onSurface)),
                      if (notif.bodyEnd.isNotEmpty)
                        TextSpan(text: notif.bodyEnd),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (notif.isUnread) ...[
            const SizedBox(width: 8),
            Container(width: 8, height: 8,
              decoration: const BoxDecoration(color: FalconColors.primary, shape: BoxShape.circle),
            ),
          ],
        ],
      ),
    );
  }
}

class _Notif {
  final IconData icon;
  final Color iconColor;
  final String title, body, boldPart, bodyEnd, time;
  final bool isUnread;
  const _Notif(this.icon, this.iconColor, this.title, this.body, this.boldPart, this.bodyEnd, this.time, this.isUnread);
}