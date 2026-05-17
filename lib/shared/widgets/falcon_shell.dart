import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';

// ─────────────────────────────────────────────
// TOP APP BAR  (image 7 style)
// back arrow left · FALCON centred · avatar right
// ─────────────────────────────────────────────
class FalconAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBack;
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool showAvatar;

  const FalconAppBar({
    super.key,
    this.showBack = true,
    this.actionLabel,
    this.onAction,
    this.showAvatar = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: FalconColors.background,
        border: Border(bottom: BorderSide(color: FalconColors.outlineVar.withOpacity(0.3))),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Left: back button or spacer
            SizedBox(
              width: 40,
              child: showBack
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back, size: 20),
                      onPressed: () => Navigator.of(context).maybePop(),
                      padding: EdgeInsets.zero,
                      color: FalconColors.onSurface,
                    )
                  : const SizedBox(),
            ),
            // Centre: FALCON wordmark
            Expanded(
              child: Center(
                child: Text(
                  'FALCON',
                  style: GoogleFonts.crimsonPro(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 4,
                    color: FalconColors.onSurface,
                  ),
                ),
              ),
            ),
            // Right: avatar or action label or spacer
            SizedBox(
              width: 40,
              child: actionLabel != null
                  ? GestureDetector(
                      onTap: onAction,
                      child: Text(
                        actionLabel!,
                        style: GoogleFonts.manrope(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                          color: FalconColors.primary,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    )
                  : showAvatar
                      ? const CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?img=8',
                          ),
                        )
                      : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// BOTTOM NAV BAR  (image 6 style)
// pill highlight on active item
// ─────────────────────────────────────────────
class FalconBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const FalconBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _items = [
    _NavItem(Icons.home_outlined, Icons.home, 'HOME'),
    _NavItem(Icons.search_outlined, Icons.search, 'SEARCH'),
    _NavItem(Icons.calendar_today_outlined, Icons.calendar_today, 'BOOKINGS'),
    _NavItem(Icons.person_outline, Icons.person, 'PROFILE'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: FalconColors.surfaceLowest,
        border: Border(top: BorderSide(color: FalconColors.outlineVar.withOpacity(0.3))),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_items.length, (i) {
            final item = _items[i];
            final selected = i == currentIndex;
            return GestureDetector(
              onTap: () => onTap(i),
              behavior: HitTestBehavior.opaque,
              child: SizedBox(
                width: 72,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: selected ? FalconColors.primaryContainer.withOpacity(0.45) : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Icon(
                        selected ? item.activeIcon : item.icon,
                        size: 22,
                        color: selected ? FalconColors.primary : FalconColors.outline,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.label,
                      style: GoogleFonts.manrope(
                        fontSize: 9,
                        fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                        letterSpacing: 0.8,
                        color: selected ? FalconColors.primary : FalconColors.outline,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const _NavItem(this.icon, this.activeIcon, this.label);
}
