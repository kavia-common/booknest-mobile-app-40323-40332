# Reusable UI Widgets (HomeScreen)

This app provides several reusable widgets to keep HomeScreen clean and consistent:

- widgets/section_header.dart
  Compact header row with optional trailing action (e.g., "See All").
- widgets/section_divider.dart
  Subtle divider line to separate sections.
- widgets/section_spacer.dart
  Sliver spacer to add vertical breathing room between sections.
- widgets/hint_chip.dart
  Small non-interactive label chip for contextual hints (e.g., "Top picks").
- widgets/shimmer_box.dart
  Lightweight shimmer-like placeholder to hint loading (visual polish).

Usage examples:
- Featured header:
  SectionHeader(title: 'Featured', actionLabel: 'See All', onAction: ...)
- Between sections:
  const SectionDivider()
  const SectionSpacer(height: 8)
- Context label:
  const HintChip(label: 'Top picks')
