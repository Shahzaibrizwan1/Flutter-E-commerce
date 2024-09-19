import 'package:ecomm_firebase/screens/accountscreen/acount_screen.dart';
import 'package:ecomm_firebase/screens/favouriteScreen/favourite_screen.dart';
import 'package:ecomm_firebase/screens/home/home.dart';
import 'package:ecomm_firebase/screens/order_screen/order_screen.dart';
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
        const AccountScreen(),
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
                  ScreenTransitionAnimationType.slide,
            ),
            onNavBarHideAnimation: OnHideAnimationSettings(
              duration: Duration(milliseconds: 100),
              curve: Curves.linear,
            ),
          ),
          confineToSafeArea: true,
          navBarHeight: kBottomNavigationBarHeight,
          navBarStyle:
              _navBarStyle, // Choose the nav bar style with this property
        ),
      );
}
