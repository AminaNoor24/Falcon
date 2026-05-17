import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';
import '../../shared/widgets/falcon_shell.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  static const _favoriteServices = [
  _FavService('Asset Concierge', 'https://picsum.photos/seed/asset/400/200'),
  _FavService('Private Charter', 'https://picsum.photos/seed/charter/400/200'),
  ];

  static const _menuItems = [
    _MenuItem(Icons.notifications_outlined, 'Notification Settings'),
    _MenuItem(Icons.security_outlined, 'Privacy & Security'),
    _MenuItem(Icons.help_outline, 'Help & Support'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FalconColors.background,
      appBar: const FalconAppBar(showBack: false, showAvatar: false),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20),

          // Avatar + name
          Center(
            child: Stack(
              children: [
                Container(
                  width: 100, height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: FalconColors.primaryContainer, width: 2.5),
                  ),
                  child: const CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=2'),
                  ),
                ),
                Positioned(
                  bottom: 4, right: 4,
                  child: Container(
                    width: 18, height: 18,
                    decoration: BoxDecoration(
                      color: FalconColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: FalconColors.background, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Center(
            child: Text('Julian Voss',
              style: GoogleFonts.manrope(fontSize: 22, fontWeight: FontWeight.w700, color: FalconColors.onSurface),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: FalconColors.primaryFixed.withOpacity(0.5),
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text('RECEIVER',
                style: GoogleFonts.manrope(fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.5, color: FalconColors.primary),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Stats row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: FalconColors.surfaceLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: FalconColors.outlineVar.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Expanded(child: _StatItem(value: '12', label: 'COMPLETED')),
                Container(width: 1, height: 36, color: FalconColors.outlineVar),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star_rounded, size: 14, color: FalconColors.primary),
                      const SizedBox(width: 4),
                      _StatItem(value: '4.7', label: 'RECEIVER RATING'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Edit + Settings buttons
          Row(children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: FalconColors.sage,
                  foregroundColor: FalconColors.onSurface,
                  minimumSize: const Size(0, 46),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: Text('Edit Profile', style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(0, 46),
                  side: BorderSide(color: FalconColors.outlineVar.withOpacity(0.5)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: FalconColors.surfaceLow,
                ),
                child: Text('Settings', style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w600, color: FalconColors.onSurface)),
              ),
            ),
          ]),
          const SizedBox(height: 16),

          // Switch to provider
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: FalconColors.surfaceLow,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: FalconColors.outlineVar.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Service Provider', style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: FalconColors.onSurface)),
                      Text('List your assets and start earning.',
                        style: GoogleFonts.manrope(fontSize: 12, color: FalconColors.onSurfaceVar),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: FalconColors.onSurface,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('SWITCH',
                      style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 1, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Profile completeness
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('PROFILE COMPLETENESS',
                style: GoogleFonts.manrope(fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: 1.5, color: FalconColors.tertiary),
              ),
              Text('85%', style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w700, color: FalconColors.onSurface)),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: LinearProgressIndicator(
              value: 0.85,
              minHeight: 6,
              backgroundColor: FalconColors.surfaceHighest,
              valueColor: const AlwaysStoppedAnimation<Color>(FalconColors.primary),
            ),
          ),
          const SizedBox(height: 24),

          // Favorite services
          Text('MY FAVORITE SERVICES',
            style: GoogleFonts.manrope(fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: 1.5, color: FalconColors.tertiary),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 130,
            child: Row(
              children: _favoriteServices.map((s) => Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
                  child: Stack(
                    children: [
                      Image.network(s.imageUrl, width: double.infinity, height: 130, fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(color: FalconColors.surfaceHigh),
                      ),
                      Positioned(
                        bottom: 8, left: 8, right: 8,
                        child: Text(s.title,
                          style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white,
                            shadows: [Shadow(color: Colors.black45, blurRadius: 8)]),
                        ),
                      ),
                    ],
                  ),
                ),
              )).toList(),
            ),
          ),
          const SizedBox(height: 24),

          // Management tools
          Text('MANAGEMENT TOOLS',
            style: GoogleFonts.manrope(fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: 1.5, color: FalconColors.tertiary),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: FalconColors.surfaceLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: FalconColors.outlineVar.withOpacity(0.2)),
            ),
            child: Column(
              children: _menuItems.asMap().entries.map((e) {
                final i = e.key;
                final item = e.value;
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(item.icon, size: 20, color: FalconColors.onSurfaceVar),
                      title: Text(item.label,
                        style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w500, color: FalconColors.onSurface),
                      ),
                      trailing: Icon(Icons.chevron_right, size: 18, color: FalconColors.outline),
                      onTap: () {},
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    ),
                    if (i < _menuItems.length - 1)
                      Divider(indent: 52, endIndent: 16, color: FalconColors.surfaceHighest, height: 0),
                  ],
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 30),

          // Log out
          TextButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed('/login'),
            child: Text('LOG OUT',
              style: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w600, letterSpacing: 1.5, color: Colors.red.shade400),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value, label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(value, style: GoogleFonts.manrope(fontSize: 22, fontWeight: FontWeight.w700, color: FalconColors.onSurface)),
      Text(label, style: GoogleFonts.manrope(fontSize: 10, fontWeight: FontWeight.w500, letterSpacing: 0.5, color: FalconColors.tertiary)),
    ],
  );
}

class _FavService {
  final String title, imageUrl;
  const _FavService(this.title, this.imageUrl);
}

class _MenuItem {
  final IconData icon;
  final String label;
  const _MenuItem(this.icon, this.label);
}
