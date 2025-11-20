import 'package:flutter/material.dart';
import 'dart:math';
import '../components/custom_bottom_navbar.dart';

class FlipCard extends StatefulWidget {
  final Widget front;
  final Widget back;

  const FlipCard({super.key, required this.front, required this.back});

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        transitionBuilder: (child, animation) {
          final rotate = Tween(begin: pi, end: 0.0).animate(animation);

          return AnimatedBuilder(
            animation: rotate,
            builder: (context, childWidget) {
              final isBack = childWidget == widget.back;
              final value = isBack ? min(rotate.value, pi / 2) : rotate.value;

              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(value),
                child: childWidget,
              );
            },
            child: child,
          );
        },
        child: _isHovered ? widget.back : widget.front,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
      ),
    );
  }
}

class CombinedInfoPage extends StatefulWidget {
  const CombinedInfoPage({super.key});

  @override
  State<CombinedInfoPage> createState() => _CombinedInfoPageState();
}

class _CombinedInfoPageState extends State<CombinedInfoPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {});
    });
  }

  static const Color deepBlue = Color(0xFF0A4174);
  static const Color softBlue = Color(0xFF49769F);

  final List<String> beforeTips = [
    "Charge phones, power banks, and essential devices.",
    "Prepare flashlights and extra batteries.",
    "Unplug non-essential appliances.",
    "Keep refrigerator and freezer closed.",
    "Store water if your home uses an electric pump.",
  ];

  final List<String> duringTips = [
    "Use flashlights instead of candles.",
    "Keep fridge and freezer closed.",
    "Use generators outdoors only.",
    "Conserve your mobile battery.",
    "Follow official CEB updates.",
  ];

  final List<String> afterTips = [
    "Turn appliances back on gradually.",
    "Check food safety in fridge/freezer.",
    "Reset clocks and WiFi.",
    "Only plug in devices after power stabilizes.",
    "Inspect for electrical damage.",
  ];

  final List<String> energyTips = [
    "Use LED bulbs instead of incandescent ones.",
    "Turn off lights when leaving a room.",
    "Unplug chargers and appliances when not in use.",
    "Use natural light during the day.",
    "Limit use of high-energy appliances during peak hours.",
  ];

  final List<String> whenToCall = [
    "You notice a fallen power line.",
    "There is a burning smell from an electrical pole.",
    "Transformer is making unusual loud noises.",
    "Your whole neighbourhood loses power unexpectedly.",
    "You see sparks or exposed electrical wires.",
  ];

  final List<String> cebContacts = [
    "CEB Hotline (Emergency): 130",
    "WhatsApp: 52530130",
    "Dangerous hazards should be reported immediately.",
    "Visit CEB Website for planned outages.",
  ];

  final List<String> helpfulInfo = [
    "Stay at least 10 meters away from fallen lines.",
    "CEB may ask for pole number or location details.",
    "Check CEB official Facebook page for updates.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 252, 252),
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 226, 154, 29),
        backgroundColor: const Color.fromARGB(255, 254, 254, 254),
        centerTitle: true,
        title: const Text(
          "Electricity Safety & Information tips",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 25,
            letterSpacing: 0.5,
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            sectionHeader("Power Outage Safety Instructions"),
            buildThreeColumnSection(),
            const SizedBox(height: 30),

            sectionHeader("How to Save Energy at Home"),
            buildSection(
              "Energy Saving Tips",
              energyTips,
              Icons.energy_savings_leaf,
            ),

            const SizedBox(height: 30),

            sectionHeader("When to Contact CEB"),
            buildSection("When to Call CEB", whenToCall, Icons.phone_in_talk),
            const SizedBox(height: 16),

            buildSection(
              "Emergency Contacts",
              cebContacts,
              Icons.contact_phone,
            ),
            const SizedBox(height: 16),

            buildSection("Important Information", helpfulInfo, Icons.info),
          ],
        ),
      ),
    );
  }

  Widget sectionHeader(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildThreeColumnSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 700;

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: buildSection("Before", beforeTips, Icons.schedule),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: buildSection("During", duringTips, Icons.flash_on),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: buildSection("After", afterTips, Icons.check_circle),
              ),
            ],
          );
        }

        return Column(
          children: [
            buildSection("Before", beforeTips, Icons.schedule),
            const SizedBox(height: 16),
            buildSection("During", duringTips, Icons.flash_on),
            const SizedBox(height: 16),
            buildSection("After", afterTips, Icons.check_circle),
          ],
        );
      },
    );
  }

  // UPDATED — Added `IconData icon`
  Widget buildSection(String title, List<String> items, IconData icon) {
    return FlipCard(
      front: Card(
        elevation: 4,
        color: const Color.fromARGB(255, 27, 95, 189),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 28),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 251, 252, 253),
                ),
              ),
            ],
          ),
        ),
      ),

      back: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((text) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.circle, size: 8, color: softBlue),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.4,
                          color: deepBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
