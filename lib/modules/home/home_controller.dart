import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';


enum NavBarItem { APPS, DOWNLOADS, AJUSTES }

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  NavBarItem navBarController = NavBarItem.APPS;

  @action
  pickItem(int i) {
    switch (i) {
      case 0:
        navBarController = NavBarItem.APPS;
        break;
      case 1:
        navBarController = NavBarItem.DOWNLOADS;
        break;
      case 2:
        navBarController = NavBarItem.AJUSTES;
        break;
    }
  }
}
