import 'package:flutter/material.dart';
import 'setting.dart';
import 'analytics.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final PageController _controller = PageController();

  int currentIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F4F0),

      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: const [
          HomePage(),
          SettingScreen(),
          SizedBox(),
          AnalyticsScreen(),
        ],
      ),

      bottomNavigationBar: CustomBottomBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 2) return;

          setState(() {
            currentIndex = index;
          });

          _controller.jumpToPage(index);
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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

        const Text(
          "My Home",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const CircleAvatar(
          backgroundColor: Color(0xff2F4F46),
          child: Text("RB", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Wednesday, June 20",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),

        SizedBox(height: 10),

        Text(
          "Good evening,\nMariam",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 10),

        Text(
          "You have 3 rooms active\nand 12 devices running.",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

class _HomePageState extends State<HomePage> {
  List rooms = [
    {
      "image": Assets.imagesSL1600,
      "name": "Living Room",
      "devices": "4 Devices",
    },
    {
      "image": Assets.images610HTO5zJwLACSX679,
      "name": "Bedroom",
      "devices": "3 Devices",
    },
    {
      "image": Assets.images81R0_kjIXLACSX679,
      "name": "Kitchen",
      "devices": "2 Devices",
    },
  ];

  List devices = [
    {
      "image": Assets.imagesSL1600,
      "title": "Smart Lamp",
      "room": "Living Room",
      "on": true,
    },
    {
      "image": Assets.images610HTO5zJwLACSX679,
      "title": "Smart TV",
      "room": "Bedroom",
      "on": false,
    },
    {
      "image": Assets.images81R0_kjIXLACSX679,
      "title": "Air Conditioner",
      "room": "Living Room",
      "on": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeAppBar(),

            const SizedBox(height: 25),

            const GreetingSection(),

            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                weatherCard(Icons.thermostat, "22°C", "Inside"),
                weatherCard(Icons.wb_sunny_outlined, "18°C", "Outside"),
                weatherCard(Icons.water_drop, "58%", "Humidity"),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Rooms",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            ListView.builder(
              itemCount: rooms.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: RoomCard(
                    image: rooms[index]["image"],
                    roomName: rooms[index]["name"],
                    devices: rooms[index]["devices"],
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Devices",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 18),
                ),
              ],
            ),

            const SizedBox(height: 15),

            ListView.builder(
              itemCount: devices.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: DeviceCard(
                    image: devices[index]["image"],
                    title: devices[index]["title"],
                    room: devices[index]["room"],
                    selected: devices[index]["on"],
                    onTap: () {
                      setState(() {
                        devices[index]["on"] = !devices[index]["on"];
                      });
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget weatherCard(IconData icon, String value, String title) {
    return Container(
      width: 95,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(height: 5),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(title),
        ],
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final String image;
  final String roomName;
  final String devices;

  const RoomCard({
    super.key,
    required this.image,
    required this.roomName,
    required this.devices,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(image, width: 40, height: 40),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  roomName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(devices, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          const Icon(Icons.arrow_forward_ios, size: 18),
        ],
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  final String image;
  final String title;
  final String room;
  final bool selected;
  final VoidCallback onTap;

  const DeviceCard({
    super.key,
    required this.image,
    required this.title,
    required this.room,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: selected ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Image.asset(image, width: 40, height: 40),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selected ? Colors.white : Colors.black,
                    ),
                  ),

                  Text(
                    room,
                    style: TextStyle(
                      color: selected ? Colors.white70 : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              selected ? Icons.toggle_on : Icons.toggle_off,
              color: selected ? Colors.white : Colors.grey,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: "Analytics",
        ),
      ],
    );
  }
}

class Assets {
  static const imagesSL1600 = "assets/images/s-l1600.webp";

  static const images610HTO5zJwLACSX679 =
      "assets/images/610HTO5zJwL._AC_SX679_.jpg";

  static const images81R0_kjIXLACSX679 =
      "assets/images/81R0+kjI-XL._AC_SX679_.jpg";
}
