import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('asset/image/ima.JPG'),
                ),
                title: Text(
                  'Monzer Albarbary',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                subtitle: Text('monzer.albar@gmail.com'),
              ),
              ListTileCoustom(
                tile: 'My Profile',
                icon: Icons.person_outline,
              ),
              ListTileCoustom(
                tile: 'Settings ',
                icon: Icons.settings_outlined,
              ),
              ListTileCoustom(
                tile: 'Notifications ',
                icon: Icons.notifications_none,
              ),
              ListTileCoustom(
                tile: 'Language ',
                icon: Icons.translate_sharp,
              ),
              ListTileCoustom(
                tile: 'FAQ ',
                icon: Icons.webhook,
              ),
              ListTileCoustom(
                tile: 'About App ',
                icon: Icons.system_security_update_warning_rounded,
              ),
              ListTileCoustom(
                tile: 'Logout ',
                icon: Icons.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTileCoustom extends StatelessWidget {
  ListTileCoustom({required this.icon, required this.tile});
  String tile;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          tile,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
