import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';
import '../../shared/widgets/falcon_shell.dart';

class PostServiceScreen extends StatefulWidget {
  const PostServiceScreen({super.key});
  @override
  State<PostServiceScreen> createState() => _PostServiceScreenState();
}

class _PostServiceScreenState extends State<PostServiceScreen> {
  bool _isRemote = true;
  bool _isFixed = true;
  String? _selectedCategory;
  final _tags = ['Design', 'Visualization'];

  static const _categories = [
    'Product Design', 'Technology', 'Marketing',
    'Strategy', 'Writing', 'Finance', 'Legal', 'Engineering',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FalconColors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(68),
        child: Container(
          height: 68,
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  padding: EdgeInsets.zero,
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
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=2'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text('Post a Service',
              style: GoogleFonts.manrope(fontSize: 30, fontWeight: FontWeight.w700, color: FalconColors.onSurface),
            ),
            const SizedBox(height: 4),
            Text('Define your craft. Shared excellence begins with a clear vision.',
              style: GoogleFonts.manrope(fontSize: 13, color: FalconColors.onSurfaceVar, height: 1.5),
            ),
            const SizedBox(height: 28),

            // 1. Service Identity
            _SectionTitle('1. Service Identity'),
            const SizedBox(height: 14),
            _FormField(label: 'Title of Service', hint: 'e.g. Architectural Visualization Masterclass'),
            const SizedBox(height: 16),
            _FormField(label: 'Description', hint: 'Describe the outcome, the process, and the value...', maxLines: 4),

            const SizedBox(height: 28),
            const Divider(color: FalconColors.surfaceHighest),
            const SizedBox(height: 28),

            // 2. Classification
            _SectionTitle('2. Classification'),
            const SizedBox(height: 14),
            _DropdownField(
              label: 'Category',
              value: _selectedCategory,
              items: _categories,
              onChanged: (v) => setState(() => _selectedCategory = v),
            ),

            const SizedBox(height: 28),
            const Divider(color: FalconColors.surfaceHighest),
            const SizedBox(height: 28),

            // 3. Pricing & Delivery
            _SectionTitle('3. Pricing & Delivery'),
            const SizedBox(height: 14),
            Row(children: [
              _RadioOption(label: 'Fixed Price', value: true, groupValue: _isFixed, onChanged: (v) => setState(() => _isFixed = v)),
              const SizedBox(width: 20),
              _RadioOption(label: 'Hourly Rate', value: false, groupValue: _isFixed, onChanged: (v) => setState(() => _isFixed = v)),
            ]),
            const SizedBox(height: 16),
            Row(children: [
              Expanded(child: _FormField(label: 'Price (USD)', hint: '0.00', type: TextInputType.number)),
              const SizedBox(width: 16),
              Expanded(child: _FormField(label: 'Delivery Time', hint: 'e.g. 5 Business Days')),
            ]),

            const SizedBox(height: 28),
            const Divider(color: FalconColors.surfaceHighest),
            const SizedBox(height: 28),

            // 4. Service Location
            _SectionTitle('4. Service Location'),
            const SizedBox(height: 14),
            Row(children: [
              _ToggleTab(label: 'Remote', active: _isRemote, onTap: () => setState(() => _isRemote = true)),
              const SizedBox(width: 10),
              _ToggleTab(label: 'Local', active: !_isRemote, onTap: () => setState(() => _isRemote = false)),
            ]),
            const SizedBox(height: 14),
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: FalconColors.surfaceMid,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: FalconColors.outlineVar.withOpacity(0.3)),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_outlined, size: 18, color: FalconColors.outline),
                    const SizedBox(width: 6),
                    Text('Global Service (Remote)',
                      style: GoogleFonts.manrope(fontSize: 13, color: FalconColors.outline),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 28),
            const Divider(color: FalconColors.surfaceHighest),
            const SizedBox(height: 28),

            // 5. Search Optimization
            _SectionTitle('5. Search Optimization'),
            const SizedBox(height: 14),
            _FormField(label: 'Tags', hint: 'Add keywords (e.g. CAD, Architecture, Rendering)'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8, runSpacing: 8,
              children: _tags.map((t) => _TagChip(label: t, onRemove: () => setState(() => _tags.remove(t)))).toList(),
            ),

            const SizedBox(height: 32),

            // CTA Buttons
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('PUBLISH SERVICE', style: GoogleFonts.manrope(fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: 1.5)),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {},
              child: Text('Save as Draft', style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.w600, color: FalconColors.onSurface)),
            ),

            const SizedBox(height: 28),

            // Portfolio Media
            _SectionTitle('Portfolio Media'),
            const SizedBox(height: 6),
            Text('SHOWCASE YOUR BEST WORK',
              style: GoogleFonts.manrope(fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.w600, color: FalconColors.tertiary),
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  _AddImageBox(),
                  const SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1448375240586-882707db888b?w=200&q=80',
                      width: 100, height: 100, fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(width: 100, height: 100, color: FalconColors.surfaceHigh),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text('Upload up to 10 high-resolution images or videos. Landscape orientation preferred for listing previews.',
              style: GoogleFonts.manrope(fontSize: 11, color: FalconColors.tertiary, height: 1.5),
            ),

            const SizedBox(height: 24),

            // Standards card
            Container(
              decoration: BoxDecoration(color: FalconColors.onSurface, borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Falcon Standards',
                    style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  _StandardItem('01', 'Atmospheric Precision', 'Every listing should reflect the clarity and engineering excellence of the Falcon brand.'),
                  const SizedBox(height: 12),
                  _StandardItem('02', 'Transparency', 'Be explicit about what is included in your delivery time. Reliability is our luxury.'),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);
  @override
  Widget build(BuildContext context) => Text(
    title,
    style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w700, color: FalconColors.onSurface),
  );
}

class _FormField extends StatelessWidget {
  final String label, hint;
  final int maxLines;
  final TextInputType type;
  const _FormField({required this.label, required this.hint, this.maxLines = 1, this.type = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w600, color: FalconColors.onSurfaceVar)),
        TextField(
          maxLines: maxLines,
          keyboardType: type,
          style: GoogleFonts.manrope(fontSize: 14, color: FalconColors.onSurface),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.manrope(fontSize: 13, color: FalconColors.outline.withOpacity(0.6)),
          ),
        ),
      ],
    );
  }
}

class _DropdownField extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  const _DropdownField({required this.label, required this.value, required this.items, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w600, color: FalconColors.onSurfaceVar)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          hint: Text('Select a category', style: GoogleFonts.manrope(fontSize: 14, color: FalconColors.outline)),
          decoration: const InputDecoration(),
          items: items.map((i) => DropdownMenuItem(value: i, child: Text(i, style: GoogleFonts.manrope(fontSize: 14)))).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _RadioOption extends StatelessWidget {
  final String label;
  final bool value, groupValue;
  final ValueChanged<bool> onChanged;
  const _RadioOption({required this.label, required this.value, required this.groupValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(children: [
        Radio<bool>(value: value, groupValue: groupValue, onChanged: (_) => onChanged(value), activeColor: FalconColors.primary),
        Text(label, style: GoogleFonts.manrope(fontSize: 14, color: FalconColors.onSurface)),
      ]),
    );
  }
}

class _ToggleTab extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _ToggleTab({required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: active ? FalconColors.primary : FalconColors.surfaceLowest,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: active ? FalconColors.primary : FalconColors.outlineVar.withOpacity(0.5)),
        ),
        child: Text(label,
          style: GoogleFonts.manrope(
            fontSize: 13, fontWeight: FontWeight.w600,
            color: active ? Colors.white : FalconColors.onSurfaceVar,
          ),
        ),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;
  const _TagChip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: FalconColors.primaryFixed.withOpacity(0.4),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w600, color: FalconColors.primary)),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: onRemove,
            child: Icon(Icons.close, size: 14, color: FalconColors.primary),
          ),
        ],
      ),
    );
  }
}

class _AddImageBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, height: 100,
      decoration: BoxDecoration(
        color: FalconColors.surfaceMid,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: FalconColors.outlineVar.withOpacity(0.4), style: BorderStyle.solid),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt_outlined, size: 24, color: FalconColors.outline),
          const SizedBox(height: 4),
          Text('Add Image', style: GoogleFonts.manrope(fontSize: 11, color: FalconColors.outline)),
        ],
      ),
    );
  }
}

class _StandardItem extends StatelessWidget {
  final String num, title, desc;
  const _StandardItem(this.num, this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(num, style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w700, color: FalconColors.primaryContainer)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.manrope(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white)),
              const SizedBox(height: 2),
              Text(desc, style: GoogleFonts.manrope(fontSize: 12, color: Colors.white60, height: 1.4)),
            ],
          ),
        ),
      ],
    );
  }
}
