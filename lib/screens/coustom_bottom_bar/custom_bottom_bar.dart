import 'package:ecomm_firebase/screens/favouriteScreen/favourite_screen.dart';
import 'package:ecomm_firebase/screens/home/home.dart';
import "package:flutter/material.dart";
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomNaviagtionBar extends StatefulWidget {
  const CustomNaviagtionBar({
    super.key,
  });

  @override
  _CustomNaviagtionBarState createState() => _CustomNaviagtionBarState();
}

class _CustomNaviagtionBarState extends State<CustomNaviagtionBar> {
  final PersistentTabController _controller = PersistentTabController();
  late final bool _hideNavBar = false;
  final List<ScrollController> _scrollControllers = [
    ScrollController(),
    ScrollController(),
  ];

  final NavBarStyle _navBarStyle = NavBarStyle.simple;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = PersistentTabController(initialIndex: 1);
  //   _hideNavBar = false;
  // }

  // @override
  // void dispose() {
  //   for (final element in _scrollControllers) {
  //     element.dispose();
  //   }
  //   super.dispose();
  // }

  List<Widget> _buildScreens() => [
        const Home(),
        const FavouriteScreen(),
        const FavouriteScreen(),
        const FavouriteScreen(),
      ];

  // Color? _getSecondaryItemColorForSpecificStyles() =>
  //     _navBarStyle == NavBarStyle.style7 ||
  //             _navBarStyle == NavBarStyle.style10 ||
  //             _navBarStyle == NavBarStyle.style15 ||
  //             _navBarStyle == NavBarStyle.style16 ||
  //             _navBarStyle == NavBarStyle.style17 ||
  //             _navBarStyle == NavBarStyle.style18
  //         ? Colors.white
  //         : null;

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: "Home",
          opacity: 0.7,
          activeColorPrimary: Colors.blue,
          activeColorSecondary: _navBarStyle == NavBarStyle.style7 ||
                  _navBarStyle == NavBarStyle.style10
              ? Colors.white
              : null,
          inactiveColorPrimary: Colors.grey,
          scrollController: _scrollControllers.first,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart),
          title: "Shopping",
          activeColorPrimary: Colors.deepOrange,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: _navBarStyle == NavBarStyle.style7 ||
                  _navBarStyle == NavBarStyle.style10
              ? Colors.white
              : null,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.favorite),
          title: "Favorite",
          activeColorPrimary: Colors.indigo,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: _navBarStyle == NavBarStyle.style7 ||
                  _navBarStyle == NavBarStyle.style10
              ? Colors.white
              : null,
          scrollController: _scrollControllers.last,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: "profile",
          activeColorPrimary: Colors.blueAccent,
          inactiveColorPrimary: Colors.grey,
          // activeColorSecondary: _getSecondaryItemColorForSpecificStyles(),
        ),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        // appBar: AppBar(
        //   title: const Text("Navigation Bar Demo"),
        //   backgroundColor: Colors.grey.shade900,
        // ),
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: false,
          stateManagement: true,
          hideNavigationBarWhenKeyboardAppears: true,
          popBehaviorOnSelectedNavBarItemPress: PopBehavior.once,
          hideOnScrollSettings: HideOnScrollSettings(
            hideNavBarOnScroll: true,
            scrollControllers: _scrollControllers,
          ),
          padding: const EdgeInsets.only(top: 8),
          // floatingActionButton: IconButton(
          //   icon: Container(
          //     padding: const EdgeInsets.all(12),
          //     decoration: const BoxDecoration(
          //         shape: BoxShape.circle, color: Colors.orange),
          //     child: const Icon(
          //       Icons.add,
          //       color: Colors.white,
          //     ),
          //   ),
          //   onPressed: () {},
          // ),

          backgroundColor: Colors.white,
          isVisible: !_hideNavBar,
          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 400),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              duration: Duration(milliseconds: 300),
              screenTransitionAnimationType:
                  ScreenTransitionAnimationType.fadeIn,
            ),
            onNavBarHideAnimation: OnHideAnimationSettings(
              duration: Duration(milliseconds: 100),
              curve: Curves.bounceInOut,
            ),
          ),
          confineToSafeArea: true,
          navBarHeight: kBottomNavigationBarHeight,
          navBarStyle:
              _navBarStyle, // Choose the nav bar style with this property
        ),
      );
}
