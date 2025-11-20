import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../components/custom_bottom_navbar.dart';
import '../theme/app_theme.dart';

//
// ─────────────────────────────────────────────
// STATIC ELECTRICITY ALERT
// ─────────────────────────────────────────────
//

enum ElectricityAlertLevel { green, yellow, orange, red }

class ElectricityAlert {
  final ElectricityAlertLevel level;
  final String message;

  ElectricityAlert({required this.level, required this.message});
}

class ElectricityAlertService {
  ElectricityAlert getCurrentAlert() {
    return ElectricityAlert(
      level: ElectricityAlertLevel.orange,
      message: "Localised electricity outages reported in some regions.",
    );
  }
}

//
// ─────────────────────────────────────────────
// STATIC OUTAGE INFO WITH MEANINGFUL STATUS
// ─────────────────────────────────────────────
//

class OutageInfo {
  final String area;
  final String status; // Scheduled, In Progress, Restored
  final String expectedRestoration;

  OutageInfo({
    required this.area,
    required this.status,
    required this.expectedRestoration,
  });
}

class OutageService {
  List<OutageInfo> getOutages() {
    return [
      OutageInfo(
        area: "Port Louis",
        status: "Power Cut in Progress",
        expectedRestoration: "Around 5:00 PM",
      ),
      OutageInfo(
        area: "Triolet",
        status: "Scheduled Outage (Coming Soon)",
        expectedRestoration: "Tomorrow Morning",
      ),
      OutageInfo(
        area: "Moka",
        status: "Power Restored",
        expectedRestoration: "Restored at 1:45 PM",
      ),
    ];
  }
}

//
// ─────────────────────────────────────────────
// RANDOM KID-FRIENDLY TIPS
// ─────────────────────────────────────────────
//

final List<String> kidTips = [
  "Turn off the lights when leaving a room 💡",
  "Don’t leave the fridge door open too long 🧊",
  "Unplug chargers when not in use 🔌",
  "Use a fan instead of AC when possible 🌬️",
  "Let sunlight brighten your room ☀️",
  "Take shorter showers to save geyser energy 🚿",
];

String getRandomTip() {
  kidTips.shuffle();
  return kidTips.first;
}

//
// ─────────────────────────────────────────────
// RIGHT SIDE — VIDEO PANEL
// ─────────────────────────────────────────────
//

class RightSideVideoPanel extends StatelessWidget {
  const RightSideVideoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = YoutubePlayerController.fromVideoId(
      videoId: 't09pAwLICC4',
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "📺 Watch & Learn!",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: YoutubePlayer(
              controller: controller,
              backgroundColor: Colors.black,
            ),
          ),
        ),

        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.25),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            "⚡ Tip of the Moment: ${getRandomTip()}",
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

//
// ─────────────────────────────────────────────
// MAIN HOMEPAGE – RESPONSIVE
// ─────────────────────────────────────────────
//

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Color _alertColor(ElectricityAlertLevel lvl) {
    switch (lvl) {
      case ElectricityAlertLevel.green:
        return Colors.green;
      case ElectricityAlertLevel.yellow:
        return Colors.yellow.shade700;
      case ElectricityAlertLevel.orange:
        return Colors.orange;
      case ElectricityAlertLevel.red:
        return Colors.red;
    }
  }

  String _alertEmoji(ElectricityAlertLevel lvl) {
    switch (lvl) {
      case ElectricityAlertLevel.green:
        return "🟢";
      case ElectricityAlertLevel.yellow:
        return "🟡";
      case ElectricityAlertLevel.orange:
        return "🟠";
      case ElectricityAlertLevel.red:
        return "🔴";
    }
  }

  Color _statusColor(String status) {
    if (status.contains("Scheduled")) return Colors.blueAccent;
    if (status.contains("Progress")) return Colors.redAccent;
    if (status.contains("Restored")) return Colors.green;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    final alert = ElectricityAlertService().getCurrentAlert();
    final outages = OutageService().getOutages();
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: AppColors.navy,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: isMobile
              ? Column(
                  children: [
                    _leftSide(alert, outages),
                    const SizedBox(height: 30),
                    const RightSideVideoPanel(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _leftSide(alert, outages)),
                    const SizedBox(width: 25),
                    const Expanded(
                      flex: 1,
                      child: RightSideVideoPanel(),
                    ),
                  ],
                ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }

  //
  // LEFT PANEL BUILDER
  //
  Widget _leftSide(ElectricityAlert alert, List<OutageInfo> outages) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        // ELECTRICITY ALERT
        //
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _alertColor(alert.level).withOpacity(0.20),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _alertColor(alert.level), width: 2),
          ),
          child: Row(
            children: [
              Text(_alertEmoji(alert.level), style: const TextStyle(fontSize: 32)),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  alert.message,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        //
        // OUTAGES
        //
        const Text(
          "Electricity Outages",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        ...outages.map(
          (o) => Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: _statusColor(o.status).withOpacity(0.35),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    o.status,
                    style: TextStyle(
                      color: _statusColor(o.status),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  o.area,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "🕒 ${o.expectedRestoration}",
                  style: const TextStyle(color: AppColors.white),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 30),

        //
        // EXPLORE
        //
        const Text(
          "Explore",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),

        _featureCard(
          icon: Icons.bolt,
          title: "Outage Dashboard",
          subtitle: "Live updates & info",
          route: '/dashboard',
        ),

        _featureCard(
          icon: Icons.quiz,
          title: "Energy Quiz",
          subtitle: "Fun for all ages",
          route: '/quiz',
        ),

        _featureCard(
          icon: Icons.child_care,
          title: "Kids Energy Tips",
          subtitle: "Learn with Sparky ⚡",
          route: '/tips/kids',
        ),

        _featureCard(
          icon: Icons.health_and_safety,
          title: "Safety Tips",
          subtitle: "Before, during & after outages",
          route: '/tips',
        ),
      ],
    );
  }

  Widget _featureCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String route,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.amber, size: 35),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: AppColors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
