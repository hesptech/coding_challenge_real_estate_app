import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
import 'package:coding_challenge_real_estate_app/config/config.dart';


class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {

  void _onItemTapped(int index) {
    setState(() {
      //_selectedIndex = index;
      //print(loggedIn);
      if (index == 0) {
        //context.push('/listings');
        Navigator.pushNamed(context, '/');
      } else if (index == 1) {
        //context.push('/listings');
        Navigator.pushNamed(context, 'favorites');
      } else if (index == 2) {
        //context.push('/listings');
        Navigator.pushNamed(context, 'listings');
      } else if (index == 3) {
        //context.push('/listings');
        Navigator.pushNamed(context, 'listings');
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      //selectedFontSize: 0.0, 
      unselectedFontSize: 14.0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppTheme.kOnPrimary,
      selectedItemColor: AppTheme.kPrimaryColor,
      unselectedItemColor: AppTheme.kSecondaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      iconSize: 32,
      items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(
          icon: Icon( 
            Icons.home, 
            size: 36.0, 
            shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 3.0, offset: Offset(0, 2.0))],
            ),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.favorite, 
          shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(0, 2.0))], 
          ),
          label: 'Favorite'
        ),
        BottomNavigationBarItem(
          icon: Icon( 
            Icons.settings, 
            shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(0, 2.0))], 
            ),
          label: 'Setting'
        ),
        BottomNavigationBarItem(
          icon: Icon( 
            Icons.manage_accounts, 
            shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(0, 2.0))], 
            ),
          label: 'Profile'
        ),
      ],
      //currentIndex: _selectedIndex,
      currentIndex: 0,
      onTap: _onItemTapped,
    );
  }
}