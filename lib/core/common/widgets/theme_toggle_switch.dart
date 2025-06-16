import 'package:az_task/core/app/theme_cubit/theme_cubit.dart.dart';
import 'package:az_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit , bool>(
      builder: (context, state) {
        return GestureDetector(
          onTap: ()=> context.read<ThemeCubit>().toggleTheme(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:
                  state
                      ? AppColors.backgroundDark
                      : AppColors.backgroundLight,
              border: Border.all(
                color:
                    state ? AppColors.borderDark : AppColors.borderLight,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(25),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: state ? 30 : 2,
                  right: state ? 2 : 30,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          state ? AppColors.primary : AppColors.secondary,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(25),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: state ? 1.0 : 0.0,
                        child: const Icon(
                          Icons.nightlight_round,
                          size: 16,
                          color: AppColors.textPrimaryDark,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: state ? 30 : 2,
                  right: state ? 2 : 30,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: state ? 0.0 : 1.0,
                    child: const Icon(
                      Icons.wb_sunny,
                      size: 16,
                      color: AppColors.textPrimaryLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
