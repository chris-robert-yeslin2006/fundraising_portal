import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../../dashboard/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  _buildHeader(),
                  const SizedBox(height: 48),
                  _buildLoginForm(),
                  const SizedBox(height: 24),
                  _buildLoginButton(),
                  const SizedBox(height: 16),
                  _buildSignUpLink(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.welcome,
          style: AppTextStyles.heading1,
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.loginSubtitle,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        CustomTextField(
          label: AppStrings.email,
          hint: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
          prefixIcon: const Icon(Icons.email_outlined),
        ),
        const SizedBox(height: 24),
        CustomTextField(
          label: AppStrings.password,
          hint: 'Enter your password',
          obscureText: true,
          controller: _passwordController,
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: const Icon(Icons.visibility_off_outlined),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return CustomButton(
      text: AppStrings.login,
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
      },
    );
  }

  Widget _buildSignUpLink() {
    return Center(
      child: TextButton(
        onPressed: () {
          // Handle sign up navigation
        },
        child: RichText(
          text: TextSpan(
            text: "Don't have an account? ",
            style: AppTextStyles.bodyMedium,
            children: [
              TextSpan(
                text: AppStrings.signUp,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
