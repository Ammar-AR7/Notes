import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback change_theme;
  HomeScreen({required this.change_theme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(
            onPressed: change_theme,
            icon: Icon(Icons.brightness_6),
          ),
        ],
        title: Text('Home'),
      ),
      body: Center(child: Text("Home")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: 'Campaing',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
    );
  }
}
