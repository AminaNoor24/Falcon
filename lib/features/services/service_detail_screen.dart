import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:falcon/core/theme/app_theme.dart';
import 'package:falcon/shared/widgets/falcon_shell.dart';

class ServiceDetailScreen extends StatefulWidget {
  const ServiceDetailScreen({super.key});
  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  int _selectedPackage = 1;

  static const _packages = [
    _Package('Basic', '\$450', ['Visual Inspection', 'Digital Summary', '3D Modeling'], false),
    _Package('Standard', '\$850', ['Full Laser Scan', 'Thermal Imaging', '24h Consultation'], true),
    _Package('Premium', '\$1,800', ['Everything in Standard', 'Certified Report', 'Site Visit'], false),
  ];

  static const _reviews = [
    _Review('Alexander R.', '2 WEEKS AGO', 5,
        'The structural audit was incredibly thorough. Julian explained the scan results in a way that was easy to understand. Highly recommended for premium estate owners.'),
    _Review('Helena M.', '1 MONTH AGO', 5,
        'Exceptional precision. The report saved us from a very expensive renovation error. The technology used is clearly next-gen.'),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      backgroundColor: FalconColors.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.85),
            radius: 18,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, size: 16, color: FalconColors.onSurface),
              onPressed: () => Navigator.of(context).maybePop(),
              padding: EdgeInsets.zero,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.85),
              radius: 18,
              child: const Icon(Icons.favorite_border, size: 16, color: FalconColors.onSurface),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.85),
              radius: 18,
              child: const Icon(Icons.share_outlined, size: 16, color: FalconColors.onSurface),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero image — dark architectural photo
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                      'https://images.unsplash.com/photo-1486325212027-8081e485255e?w=800&q=80',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: const Color(0xFF1A2332),
                        child: const Icon(Icons.image_outlined, color: Colors.white24, size: 48),
                      ),
                    ),
                  ),

                  // White card sliding over image
                  Container(
                    decoration: const BoxDecoration(
                      color: FalconColors.surfaceLowest,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                    ),
                    transform: Matrix4.translationValues(0, -24, 0),
                    padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Badge + rating
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: FalconColors.surfaceHigh,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text('PREMIUM ENGINEERING',
                                style: GoogleFonts.manrope(fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: 1, color: FalconColors.onSurfaceVar),
                              ),
                            ),
                            Row(children: [
                              const Icon(Icons.star_rounded, size: 16, color: FalconColors.primary),
                              const SizedBox(width: 4),
                              Text('4.9', style: GoogleFonts.manrope(fontSize: 15, fontWeight: FontWeight.w700, color: FalconColors.onSurface)),
                            ]),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Title
                        Text('Structural Integrity\nAudit',
                          style: GoogleFonts.manrope(fontSize: 28, fontWeight: FontWeight.w700, height: 1.15, color: FalconColors.onSurface),
                        ),
                        const SizedBox(height: 16),

                        // Provider row
                        Row(children: [
                          const CircleAvatar(radius: 20, backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=8')),
                          const SizedBox(width: 12),
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Julian Voss', style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w700, color: FalconColors.onSurface)),
                              Text('Lead Structural Architect', style: GoogleFonts.manrope(fontSize: 12, color: FalconColors.onSurfaceVar)),
                            ],
                          )),
                          TextButton(
                            onPressed: () {},
                            child: Text('View Profile',
                              style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w600, color: FalconColors.primary),
                            ),
                          ),
                        ]),
                        const SizedBox(height: 14),
                        Divider(color: FalconColors.surfaceHighest),
                        const SizedBox(height: 12),

                        // Meta row
                        Row(children: [
                          _MetaChip(icon: Icons.timer_outlined, label: '3-5 Days Delivery'),
                          const SizedBox(width: 20),
                          _MetaChip(icon: Icons.verified_outlined, label: 'Verified Professional'),
                        ]),
                        const SizedBox(height: 24),

                        // About
                        Text('About Service',
                          style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: FalconColors.onSurface),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "A comprehensive forensic analysis of your property's structural health. Using Falcon's proprietary scanning technology, our team identifies potential stress points, foundation shifts, and material fatigue before they become critical issues. Includes a 24-page certified report and 3D terrain modeling.",
                          style: GoogleFonts.manrope(fontSize: 14, color: FalconColors.onSurfaceVar, height: 1.6),
                        ),
                        const SizedBox(height: 16),

                        // Tags
                        Wrap(spacing: 8, runSpacing: 8,
                          children: ['#Engineering', '#SafetyAudit', '#LuxuryRealEstate']
                              .map((t) => _TagPill(label: t)).toList(),
                        ),
                        const SizedBox(height: 28),

                        // Service Packages
                        Text('Service Packages',
                          style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: FalconColors.onSurface),
                        ),
                        const SizedBox(height: 14),
                        SizedBox(
                          height: 230,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: _packages.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 12),
                            itemBuilder: (_, i) => _PackageCard(
                              pkg: _packages[i],
                              selected: i == _selectedPackage,
                              onTap: () => setState(() => _selectedPackage = i),
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),

                        // Reviews
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Client Reviews',
                              style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: FalconColors.onSurface),
                            ),
                            Text('See All (142)',
                              style: GoogleFonts.manrope(fontSize: 13, color: FalconColors.primary, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        ..._reviews.map((r) => _ReviewCard(review: r)).toList(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom bar — book button + nav
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Book button bar
              Container(
                margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A2332),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    // Chat icon box
                    Container(
                      width: 48, height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A2332),
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: Colors.white.withOpacity(0.15)),
                      ),
                      child: const Icon(Icons.chat_bubble_outline_rounded, color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 8),
                    // Sage green button
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: FalconColors.sage,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Center(
                            child: Text('Hire / Book Service',
                              style: GoogleFonts.manrope(
                                fontSize: 14, fontWeight: FontWeight.w700,
                                color: const Color(0xFF1A2332),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

                            // Bottom nav — no item selected
                            FalconBottomNav(
                              currentIndex: -1,
                              onTap: (i) {
                                if (i == 2) return;
                                Navigator.of(context).popUntil((route) => route.isFirst);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              }

// ── Sub-widgets ──────────────────────────────────────────

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _MetaChip({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) => Row(children: [
    Icon(icon, size: 14, color: FalconColors.onSurfaceVar),
    const SizedBox(width: 5),
    Text(label, style: GoogleFonts.manrope(fontSize: 12, color: FalconColors.onSurfaceVar)),
  ]);
}

class _TagPill extends StatelessWidget {
  final String label;
  const _TagPill({required this.label});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: FalconColors.primaryFixed.withOpacity(0.35),
      borderRadius: BorderRadius.circular(99),
    ),
    child: Text(label, style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w600, color: FalconColors.primary)),
  );
}

class _PackageCard extends StatelessWidget {
  final _Package pkg;
  final bool selected;
  final VoidCallback onTap;
  const _PackageCard({required this.pkg, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 185,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1A2332) : FalconColors.surfaceHigh,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (pkg.recommended)
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: FalconColors.sage, borderRadius: BorderRadius.circular(6)),
                child: Text('RECOMMENDED',
                  style: GoogleFonts.manrope(fontSize: 9, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: Colors.white),
                ),
              ),
            Text(pkg.name,
              style: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w600,
                color: selected ? Colors.white60 : FalconColors.onSurfaceVar),
            ),
            const SizedBox(height: 4),
            Text(pkg.price,
              style: GoogleFonts.manrope(fontSize: 28, fontWeight: FontWeight.w700,
                color: selected ? Colors.white : FalconColors.onSurface),
            ),
            const SizedBox(height: 10),
            ...pkg.features.map((f) => Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(Icons.check_circle_outline, size: 13,
                  color: selected ? FalconColors.sage : FalconColors.primary),
                const SizedBox(width: 5),
                Expanded(child: Text(f,
                  style: GoogleFonts.manrope(fontSize: 11,
                    color: selected ? Colors.white70 : FalconColors.onSurfaceVar),
                )),
              ]),
            )).toList(),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: selected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: selected ? Colors.white : FalconColors.outlineVar),
              ),
              child: Text('Select',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w700,
                  color: selected ? const Color(0xFF1A2332) : FalconColors.onSurface),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final _Review review;
  const _ReviewCard({required this.review});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                const Icon(Icons.person_outline, size: 16, color: FalconColors.outline),
                const SizedBox(width: 6),
                Text(review.name, style: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w700, color: FalconColors.onSurface)),
              ]),
              Text(review.time, style: GoogleFonts.manrope(fontSize: 10, letterSpacing: 0.5, color: FalconColors.tertiary)),
            ],
          ),
          const SizedBox(height: 4),
          Row(children: List.generate(5, (i) =>
            Icon(i < review.stars ? Icons.star_rounded : Icons.star_outline_rounded,
              size: 14, color: FalconColors.primary),
          )),
          const SizedBox(height: 8),
          Text(review.body, style: GoogleFonts.manrope(fontSize: 13, color: FalconColors.onSurfaceVar, height: 1.5)),
          const SizedBox(height: 14),
          Divider(color: FalconColors.surfaceHighest),
        ],
      ),
    );
  }
}

class _Package {
  final String name, price;
  final List<String> features;
  final bool recommended;
  const _Package(this.name, this.price, this.features, this.recommended);
}

class _Review {
  final String name, time, body;
  final int stars;
  const _Review(this.name, this.time, this.stars, this.body);
}
