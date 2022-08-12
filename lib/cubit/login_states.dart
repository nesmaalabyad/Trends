abstract class loginStates{}
class loginintitialstates extends loginStates {}
class getlogindatasucssesstate extends loginStates{}


class buttonLayout extends loginStates{}
class getlogindataerrorstate extends loginStates{
  String error;
  getlogindataerrorstate(this.error);
}

