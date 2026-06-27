import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/custom_drawer.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),

      backgroundColor: const Color(0xffF5F4F0),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //================ AppBar =================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),

                  Text(
                    "Analytics",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  CircleAvatar(
                    backgroundColor: Color(0xff2F4F46),
                    child: Text("MR", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text("This Week", style: TextStyle(color: Colors.grey)),

              const SizedBox(height: 5),

              const Text(
                "Energy Usage",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              const UsageCard(),

              const SizedBox(height: 30),

              const Text(
                "Daily Breakdown",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              const AnalyticsCard(
                title: "Monday",
                subtitle: "",
                value: "5.2 kWh",
                progress: .55,
              ),

              const AnalyticsCard(
                title: "Tuesday",
                subtitle: "",
                value: "6.8 kWh",
                progress: .75,
              ),

              const AnalyticsCard(
                title: "Wednesday",
                subtitle: "",
                value: "7.1 kWh",
                progress: .82,
              ),

              const AnalyticsCard(
                title: "Thursday",
                subtitle: "",
                value: "4.9 kWh",
                progress: .50,
              ),

              const AnalyticsCard(
                title: "Friday",
                subtitle: "",
                value: "6.3 kWh",
                progress: .70,
              ),

              const SizedBox(height: 30),

              const Text(
                "Top Consumers",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              const AnalyticsCard(
                icon: Icons.ac_unit,
                title: "AC Unit",
                subtitle: "Bedroom",
                value: "12.4 kWh",
                progress: .82,
              ),

              const AnalyticsCard(
                icon: Icons.power_settings_new,
                title: "Refrigerator",
                subtitle: "Kitchen",
                value: "9.8 kWh",
                progress: .66,
              ),

              const AnalyticsCard(
                icon: Icons.lightbulb_outline,
                title: "Lighting",
                subtitle: "All Rooms",
                value: "7.2 kWh",
                progress: .48,
              ),

              const AnalyticsCard(
                icon: Icons.thermostat_outlined,
                title: "Thermostat",
                subtitle: "Living Room",
                value: "5.1 kWh",
                progress: .35,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

//================ Usage Card =================

class UsageCard extends StatelessWidget {
  const UsageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xff2F4F46),
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total this month", style: TextStyle(color: Colors.white70)),

          SizedBox(height: 15),

          Text(
            "48.2 kWh",
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 15),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_downward, color: Colors.white, size: 18),
              SizedBox(width: 5),
              Text("12% vs last month", style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}

//================ Analytics Card =================

class AnalyticsCard extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;
  final String value;
  final double progress;

  const AnalyticsCard({
    super.key,
    this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          if (icon != null)
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xff2F4F46)),
            ),

          if (icon != null) const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    Text(
                      value,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],

                const SizedBox(height: 8),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation(Color(0xff5E8B7E)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
