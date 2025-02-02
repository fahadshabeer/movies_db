import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNav extends StatefulWidget {
  final PageController pageController;

  const CustomBottomNav({super.key, required this.pageController});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int selected = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: selected,
        unselectedItemColor: Colors.grey.shade400,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        selectedFontSize: 14.sp,
        unselectedFontSize: 14.sp,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        onTap: (index) {
          widget.pageController.jumpToPage(index);
          selected = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart_circle), label: "Favorites"),
        ]);
  }
}
