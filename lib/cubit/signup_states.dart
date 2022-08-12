abstract class signupStates{}
class signupintitialstates extends signupStates {}
class getsignupdatasucssesstate extends signupStates{}


class buttonLayout extends signupStates{}
class getsignupdataerrorstate extends signupStates{
  String error;
  getsignupdataerrorstate(this.error);
}

