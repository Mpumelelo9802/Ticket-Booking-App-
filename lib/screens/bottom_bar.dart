import 'package:booktickets/screens/home_screen.dart';
import 'package:flutter/material.dart';
// Ensure this path is correct

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(), // Ensure ListDemo is properly imported
    const Text("Search"),
    const Text("Tickets"),
    const Text("Profile"),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      _animationController.forward().then((_) {
        _animationController.reset();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      reverseDuration: const Duration(milliseconds: 300),
    );
    _animation =
        Tween<double>(begin: 1.0, end: 1.2).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex], // Display the selected widget
      bottomNavigationBar: BottomAppBar(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, 'Home', 0),
                _buildNavItem(Icons.search, 'Search', 1),
                _buildNavItem(Icons.airplane_ticket, 'Tickets', 2),
                _buildNavItem(Icons.person, 'Profile', 3),
              ],
            ),
            Positioned(
              bottom: 0,
              left: (MediaQuery.of(context).size.width / 5) * _selectedIndex,
              child: Container(
                height: 4.0,
                width: MediaQuery.of(context).size.width / 5,
                color: Color.fromARGB(255, 205, 191, 7),
              ),
            ),
          ],
        ),
        color: Colors.black,
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Icon(
                    icon,
                    color: isSelected
                        ? const Color.fromARGB(255, 205, 191, 7)
                        : Colors.white,
                    size: 28.0 * (isSelected ? _animation.value : 1.0),
                  );
                },
              ),
              if (isSelected)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    label,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 205, 191, 7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
