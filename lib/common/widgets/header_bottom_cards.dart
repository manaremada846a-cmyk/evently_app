import 'package:evently_app/theme/app_color.dart';
import 'package:flutter/material.dart';

class HeaderBottomCards extends StatelessWidget {
  const HeaderBottomCards({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;
    final contentColor = selected ? AppColors.whiteText : primary;
    final textColor = selected ? AppColors.whiteText : theme.splashColor;

    return ChoiceChip(
      selected: selected,
      onSelected: (_) => onSelected(),
      showCheckmark: false,
      backgroundColor: theme.cardColor,
      selectedColor: primary,
      surfaceTintColor: Colors.transparent,
      side: BorderSide(color: primary),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: contentColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: theme.textTheme.labelMedium!.copyWith(
              fontSize: 14,
              color: textColor ,
            ),
          ),
        ],
      ),
    );
  }
}