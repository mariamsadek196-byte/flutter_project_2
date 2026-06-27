import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/custom_drawer.dart';
import 'package:flutter_application_1/feature/auth/sign in to your home.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool notifications = true;
  bool darkMode = false;
  bool sound = true;
  bool location = true;

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
                    "Settings",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  CircleAvatar(
                    backgroundColor: Color(0xff2F4F46),
                    child: Text("MR", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const ProfileCard(),

              const SizedBox(height: 30),

              const SectionTitle(title: "ACCOUNT"),

              const SizedBox(height: 15),

              const SettingsTile(
                icon: Icons.person_outline,
                title: "Edit Profile",
                subtitle: "mariam sadek",
              ),

              const SettingsTile(
                icon: Icons.lock_outline,
                title: "Privacy",
                subtitle: "Manage your data",
              ),

              const SettingsTile(
                icon: Icons.security,
                title: "Security",
                subtitle: "Password • 2FA enabled",
              ),

              const SizedBox(height: 30),

              const SectionTitle(title: "PREFERENCES"),

              const SizedBox(height: 15),

              SettingsTile(
                icon: Icons.notifications_none,
                title: "Notifications",
                subtitle: "Alerts & reminders",
                isSwitch: true,
                switchValue: notifications,
                onChanged: (value) {
                  setState(() {
                    notifications = value;
                  });
                },
              ),

              SettingsTile(
                icon: Icons.dark_mode_outlined,
                title: "Dark Mode",
                subtitle: "Switch appearance",
                isSwitch: true,
                switchValue: darkMode,
                onChanged: (value) {
                  setState(() {
                    darkMode = value;
                  });
                },
              ),
              SettingsTile(
                icon: Icons.volume_up_outlined,
                title: "Sound Effects",
                subtitle: "Device feedback tones",
                isSwitch: true,
                switchValue: sound,
                onChanged: (value) {
                  setState(() {
                    sound = value;
                  });
                },
              ),

              SettingsTile(
                icon: Icons.public,
                title: "Location",
                subtitle: "Used for automations",
                isSwitch: true,
                switchValue: location,
                onChanged: (value) {
                  setState(() {
                    location = value;
                  });
                },
              ),

              const SizedBox(height: 30),

              const SectionTitle(title: "SYSTEM"),

              const SizedBox(height: 15),

              const SettingsTile(
                icon: Icons.devices_outlined,
                title: "Connected Devices",
                subtitle: "12 devices paired",
              ),

              const SettingsTile(
                icon: Icons.wifi,
                title: "Wi-Fi & Network",
                subtitle: "HomeNet_5G",
              ),

              const SettingsTile(
                icon: Icons.help_outline,
                title: "Help & Support",
                subtitle: "FAQs and contact",
              ),

              const SettingsTile(
                icon: Icons.info_outline,
                title: "About",
                subtitle: "Version 2.4.1",
              ),

              const SizedBox(height: 30),

              SettingsTile(
                icon: Icons.logout,
                title: "Sign Out",
                subtitle: "mariam sadek",
                iconColor: Colors.red,
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff2F4F46),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Color(0xff2F4F46)),
          ),

          SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rebecca Barbara",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "rebecca@home.io",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          Icon(Icons.edit, color: Colors.white),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  final bool isSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onChanged;
  final Color iconColor;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isSwitch = false,
    this.switchValue = false,
    this.onChanged,
    this.iconColor = Colors.black,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(15),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Row(
          children: [
            Icon(icon, color: iconColor),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),

            isSwitch
                ? Switch(value: switchValue, onChanged: onChanged)
                : const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
