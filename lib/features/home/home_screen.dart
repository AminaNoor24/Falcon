import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:falcon/features/notifications/notifications_screen.dart';
import 'package:falcon/core/theme/app_theme.dart';
// ignore: unused_import
import 'package:falcon/shared/widgets/falcon_shell.dart';
import 'package:falcon/features/services/service_detail_screen.dart';
import 'package:falcon/features/services/post_service_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _categories = ['Design', 'Technology', 'Marketing', 'Writing', 'Finance', 'Legal'];

  static const _featured = [
    _Service('PRODUCT DESIGN', 'Minimalist Brand Identity',
        'Creating timeless visual languages for the next generation of startups.',
        'Starts at \$1,200', '4.9',
        'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=600&q=80'),
    _Service('STRATEGY', 'Digital Growth Audit',
        'Analyze and optimize your user funnel with data-driven insights.',
        'Starts at \$850', '5.0',
        'https://images.unsplash.com/photo-1497366216548-37526070297c?w=600&q=80'),
    _Service('TECHNOLOGY', 'Custom SaaS Development',
        'End-to-end architecture and development for high-performance platforms.',
        'Starts at \$3,500', '4.8',
        'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=600&q=80'),
  ];

  static const _nearby = [
    _Provider('Elena Vance', 'Interior Architect', '1.2 miles', 'https://i.pravatar.cc/150?img=47'),
    _Provider('Marcus Thorne', 'Systems Engineer', '0.8 miles', 'https://i.pravatar.cc/150?img=8'),
    _Provider('Sarah Chen', 'UX Researcher', '2.4 miles', 'https://i.pravatar.cc/150?img=25'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FalconColors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: _HomeAppBar(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PostServiceScreen())),
        backgroundColor: FalconColors.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        child: const Icon(Icons.add, size: 26),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 24),
          // Hero text
          Text('Find your next\nexpert.',
            style: GoogleFonts.manrope(fontSize: 34, fontWeight: FontWeight.w700, height: 1.2, color: FalconColors.onSurface),
          ),
          const SizedBox(height: 10),
          Text('Connect with the world\'s most elite specialists in design, engineering, and strategic writing.',
            style: GoogleFonts.manrope(fontSize: 14, color: FalconColors.onSurfaceVar, height: 1.5),
          ),
          const SizedBox(height: 20),
          // Search bar
          Container(
            decoration: BoxDecoration(
              color: FalconColors.surfaceLowest,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: FalconColors.outlineVar.withOpacity(0.4)),
            ),
            child: Row(
              children: [
                const SizedBox(width: 14),
                Icon(Icons.search, size: 18, color: FalconColors.outline),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for "UI/UX Design"',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: GoogleFonts.manrope(fontSize: 13, color: FalconColors.outline),
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(color: FalconColors.primary, borderRadius: BorderRadius.circular(8)),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      minimumSize: Size.zero,
                    ),
                    child: Text('Search', style: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          // Categories
          _SectionHeader(title: 'Categories', actionLabel: 'View All', onAction: () {}),
          const SizedBox(height: 12),
          SizedBox(
            height: 36,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) => _CategoryChip(label: _categories[i], selected: i == 0),
            ),
          ),
          const SizedBox(height: 28),
          // Featured Services
          _SectionHeader(title: 'Featured Services', actionLabel: null, onAction: null),
          const SizedBox(height: 14),
          ..._featured.map((s) => _FeaturedCard(service: s)).toList(),
          const SizedBox(height: 8),
          // Nearby
          _SectionHeader(title: 'Nearby', actionLabel: 'Show map', onAction: () {}),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: FalconColors.surfaceLow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: _nearby.map((p) => _NearbyTile(provider: p)).toList(),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: FalconColors.background,
      child: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Left: menu icon
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.menu, size: 20, color: FalconColors.onSurface),
            ),
            Center(
              child: Text('FALCON',
                style: GoogleFonts.crimsonPro(
                  fontSize: 20, fontWeight: FontWeight.w600,
                  letterSpacing: 4, color: FalconColors.onSurface,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.notifications_outlined, size: 22, color: FalconColors.onSurface),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const NotificationsScreen()),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=2')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;
  const _SectionHeader({required this.title, this.actionLabel, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: FalconColors.onSurface)),
        if (actionLabel != null)
          GestureDetector(
            onTap: onAction,
            child: Text(actionLabel!, style: GoogleFonts.manrope(fontSize: 13, color: FalconColors.primary, fontWeight: FontWeight.w600)),
          ),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _CategoryChip({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? FalconColors.primary : FalconColors.surfaceLowest,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: selected ? FalconColors.primary : FalconColors.outlineVar.withOpacity(0.5)),
      ),
      child: Text(
        label,
        style: GoogleFonts.manrope(
          fontSize: 13, fontWeight: FontWeight.w600,
          color: selected ? Colors.white : FalconColors.onSurfaceVar,
        ),
      ),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  final _Service service;
  const _FeaturedCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ServiceDetailScreen())),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: FalconColors.surfaceLowest,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: FalconColors.outlineVar.withOpacity(0.25)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(service.imageUrl, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: FalconColors.surfaceHigh),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(service.category,
                    style: GoogleFonts.manrope(fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: 1.5, color: FalconColors.tertiary),
                  ),
                  const SizedBox(height: 4),
                  Text(service.title, style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w700, color: FalconColors.onSurface)),
                  const SizedBox(height: 4),
                  Text(service.desc,
                    style: GoogleFonts.manrope(fontSize: 13, color: FalconColors.onSurfaceVar, height: 1.4),
                    maxLines: 2, overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(service.price, style: GoogleFonts.manrope(fontSize: 13, color: FalconColors.onSurface, fontWeight: FontWeight.w500)),
                      Row(children: [
                        Icon(Icons.star_rounded, size: 14, color: FalconColors.primary),
                        const SizedBox(width: 3),
                        Text(service.rating, style: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w600, color: FalconColors.onSurface)),
                      ]),
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

class _NearbyTile extends StatelessWidget {
  final _Provider provider;
  const _NearbyTile({required this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(radius: 22, backgroundImage: NetworkImage(provider.avatarUrl)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(provider.name, style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: FalconColors.onSurface)),
                Text('${provider.role} · ${provider.distance}',
                  style: GoogleFonts.manrope(fontSize: 12, color: FalconColors.onSurfaceVar),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, size: 18, color: FalconColors.outline),
        ],
      ),
    );
  }
}

class _Service {
  final String category, title, desc, price, rating, imageUrl;
  const _Service(this.category, this.title, this.desc, this.price, this.rating, this.imageUrl);
}

class _Provider {
  final String name, role, distance, avatarUrl;
  const _Provider(this.name, this.role, this.distance, this.avatarUrl);
}
