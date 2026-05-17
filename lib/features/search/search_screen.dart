import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';
import '../../shared/widgets/falcon_shell.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FalconColors.background,
      appBar: const FalconAppBar(showBack: false),
      body: Center(
        child: Text('Search',
          style: GoogleFonts.manrope(fontSize: 22, fontWeight: FontWeight.w600, color: FalconColors.onSurface),
        ),
      ),
    );
  }
}
