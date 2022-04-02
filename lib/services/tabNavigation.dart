import 'package:flutter/material.dart';
import 'package:untitled2/homePage.dart';
import 'package:untitled2/lists.dart';
import 'package:untitled2/search.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  const TabNavigator({Key key, this.navigatorKey, this.tabItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (tabItem =="home"){
      child = HomePage();
    }
    else if(tabItem=="search"){
      child = SearchPage();
    }
      else if(tabItem == "lists"){
        child = ListsPage();
    }
      return Navigator(
        key: navigatorKey,
        onGenerateRoute: (routeSettings){
          return MaterialPageRoute(builder: (context) => child);
        },
      );
    }
  }
