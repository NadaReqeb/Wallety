import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class RouterHelper {
  RouterHelper._();
  static RouterHelper routerHelper = RouterHelper._();
  GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>();
  routingToSpecificWidget(Widget widget) {
    BuildContext context = routerKey.currentState!.context;
    routerKey.currentState!
        .pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  routingToSpecificWidgetWithoutPop(Widget widget) {
    BuildContext context = routerKey.currentState!.context;
    routerKey.currentState!.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  routingToSpecificWidgetWithPop(Widget widget) {
    BuildContext context = routerKey.currentState!.context;
    routerKey.currentState!
        .pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
class RouterClass {
  RouterClass._();
  static RouterClass routerClass = RouterClass._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  pushToSpecificScreenByName(String screenName) {
    navKey.currentState!.pushNamed(screenName);
  }

  pushToSpecificScreenUsingWidget(Widget widget) {
    BuildContext?  context = navKey.currentContext;
    navKey.currentState!.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  popFunction() {
    navKey.currentState!.pop();
  }
  routingToSpecificWidgetWithoutPop(Widget widget) {
    // BuildContext  context = routerKey.currentState!.context;
    BuildContext?  context = navKey.currentContext;

    navKey.currentState!.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  // Map<String, Widget Function(BuildContext)> map = {
  //   'screen1': (context) => Page1(),
  //   'screen2': (context) => Page2(),
  // };
}
