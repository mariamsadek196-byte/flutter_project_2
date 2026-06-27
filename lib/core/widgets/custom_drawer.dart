import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xff2F4F46)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(radius: 28, child: Text("RB")),
                SizedBox(height: 10),
                Text(
                  "mariam sadek",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text("Smart Home", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),

          ListTile(leading: Icon(Icons.home), title: Text("Home")),

          ListTile(leading: Icon(Icons.settings), title: Text("Settings")),

          ListTile(leading: Icon(Icons.bar_chart), title: Text("Analytics")),
        ],
      ),
    );
  }
}
