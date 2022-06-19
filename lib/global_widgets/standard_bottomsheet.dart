import 'package:authentication_firebase/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StandardBottomsheet extends StatelessWidget {
  final String title;
  final String message;

  final String primaryButtonText;
  final String? secondaryButtonText;

  final void Function() primaryAction;
  final void Function()? secondaryAction;

  const StandardBottomsheet({
    Key? key,
    required this.title,
    required this.message,
    required this.primaryAction,
    this.secondaryAction,
    required this.primaryButtonText,
    this.secondaryButtonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 220),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
            const SizedBox(height: 24),
            Text(message, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (secondaryButtonText != null) ...[
                  ElevatedButton(
                    onPressed: secondaryAction,
                    child: Text(secondaryButtonText!, style: TextStyle(color: AppColors.grey900)),
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.white,
                      animationDuration: const Duration(milliseconds: 400),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                ElevatedButton(
                  onPressed: primaryAction,
                  child: Text(primaryButtonText, style: const TextStyle(color: AppColors.white)),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.greenMarineLight)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
