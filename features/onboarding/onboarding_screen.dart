import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:deen_connect/features/home/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class OnboardingItem {
  final String title;
  final String description;
  final String image;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.image,
  });
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _items = [
    OnboardingItem(
      title: 'Never Miss a Prayer',
      description:
          'Get accurate prayer times automatically based on your location.',
      image: 'assets/images/onboarding/prayer.png',
    ),
    OnboardingItem(
      title: 'Find Qibla Instantly',
      description: 'Locate the Qibla direction easily wherever you are.',
      image: 'assets/images/onboarding/qibla.png',
    ),
    OnboardingItem(
      title: 'Daily Hadith & Ayah',
      description:
          'Receive daily Hadith and Ayah to reflect and grow spiritually.',
      image: 'assets/images/onboarding/hadith.png',
    ),
    OnboardingItem(
      title: 'Daily Quran & Tafsir',
      description: 'Read Quran daily with authentic tafsir and translations.',
      image: 'assets/images/onboarding/quran.png',
    ),
    OnboardingItem(
      title: 'Tasbeeh Counter',
      description: 'Keep track of your dhikr with a simple tasbeeh counter.',
      image: 'assets/images/onboarding/tasbeeh.png',
    ),
    OnboardingItem(
      title: 'Daily Duas & Azkar',
      description: 'Authentic daily duas and azkar for every moment.',
      image: 'assets/images/onboarding/dua.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 165, 142, 120),
              Color.fromARGB(255, 88, 67, 57),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // PAGES
              PageView.builder(
                controller: _controller,
                itemCount: _items.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 40),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 26, vertical: 32),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 219, 193, 163),
                              Color.fromARGB(255, 182, 157, 132),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.28),
                              blurRadius: 28,
                              offset: const Offset(0, 18),
                            ),
                            BoxShadow(
                              color: const Color.fromARGB(255, 61, 50, 34)
                                  .withOpacity(0.35),
                              blurRadius: 8,
                              offset: const Offset(-4, -4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // 🖼 BIGGER IMAGE
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              child: Image.asset(
                                item.image,
                                key: ValueKey(item.image),
                                height: 280, // Image height increased
                                fit: BoxFit.contain,
                              ),
                            ),

                            const SizedBox(height: 32),

                            // TITLE
                            Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF4A3728),
                                height: 1.25,
                              ),
                            ),

                            const SizedBox(height: 16),

                            // DESCRIPTION
                            Text(
                              item.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16, // Font size increased
                                color: Color.fromARGB(255, 88, 72, 59),
                                height: 1.6,
                              ),
                            ),

                            // Spacer to push dots up
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              // DOTS - POSITIONED HIGHER UP
              Positioned(
                bottom: 130, // YEH VALUE BADHAYEN - DOTS OPER AAYENGE
                left: 0,
                right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: _items.length,
                    effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 20,
                      spacing: 10,
                      activeDotColor: Colors.white,
                      dotColor: Colors.white38,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 0,
                    ),
                  ),
                ),
              ),

              // SKIP BUTTON
              Positioned(
                bottom: 70, // SKIP BUTTON POSITION
                left: 24,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              // NEXT / BEGIN BUTTON
              Positioned(
                bottom: 70, // SAME LEVEL AS SKIP BUTTON
                right: 24,
                child: _currentPage == _items.length - 1
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomeScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF806254),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          elevation: 10,
                          shadowColor: Colors.black.withOpacity(0.25),
                        ),
                        child: const Text(
                          'Begin Journey',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 450),
                            curve: Curves.easeInOutCubic,
                          );
                        },
                        child: Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 14,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xFF806254),
                            size: 24,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
