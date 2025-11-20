import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class AnswerOption extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool showResult;
  final VoidCallback onTap;

  const AnswerOption({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.showResult,
    required this.onTap,
  });

  Color _backgroundColor() {
    // Before showing result, all options are white except maybe a slight tint on selected
    if (!showResult) {
      return isSelected ? AppColors.white.withOpacity(0.9) : AppColors.white;
    }

    // After result is shown:
    if (isCorrect) return AppColors.correct; // green
    if (isSelected && !isCorrect) return AppColors.wrong; // red

    return AppColors.white;
  }

  Color _borderColor() {
    if (!showResult && isSelected) return const Color.fromRGBO(10, 65, 116, 1);
    if (showResult && isCorrect) return AppColors.correct;
    if (showResult && isSelected && !isCorrect) return AppColors.wrong;
    return AppColors.steel;
  }

  Color _textColor() {
    if (showResult && (isCorrect || isSelected)) {
      return AppColors.white;
    }
    return AppColors.navy;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap, // 👈 THIS MUST BE SET
        borderRadius: BorderRadius.circular(18),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: _backgroundColor(),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: _borderColor(), width: 1.3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: _textColor(),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (showResult && isCorrect)
                const Icon(Icons.check_circle, color: AppColors.white),
              if (showResult && isSelected && !isCorrect)
                const Icon(Icons.cancel, color: AppColors.white),
            ],
          ),
        ),
      ),
    );
  }
}
