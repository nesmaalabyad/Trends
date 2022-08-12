abstract class Newsstates{}
class Newsintitialstates extends Newsstates {}
class getsportdatasucssesstate extends Newsstates{}
class getsciencedatasucssesstate extends Newsstates{}
class getbuisnessdatasucssesstate extends Newsstates{}
class getTechnologydatasucssesstate extends Newsstates{}
class geteconomydatasucssesstate extends Newsstates{}
class gethealthdatasucssesstate extends Newsstates{}
class getgeneraldatasucssesstate extends Newsstates{}
class NewsGetSearchSuccessState extends Newsstates{}
class NewsGetSearchLoadingState extends Newsstates{}


class buttonLayout extends Newsstates{}
class getsportdataerrorstate extends Newsstates{
  String error;
  getsportdataerrorstate(this.error);
}
class getsciencedataerrorstate extends Newsstates{
  String error;
  getsciencedataerrorstate(this.error);
}
class getbuisnessdataerrorstate extends Newsstates{
  String error;
  getbuisnessdataerrorstate(this.error);
}
class getTechnologydataerrorstate extends Newsstates{
  String error;
  getTechnologydataerrorstate(this.error);
}
class geteconomydataerrorstate extends Newsstates{
  String error;
  geteconomydataerrorstate(this.error);
}
class gethealthdataerrorstate extends Newsstates{
  String error;
  gethealthdataerrorstate(this.error);
}
class getgeneraldataerrorstate extends Newsstates{
  String error;
  getgeneraldataerrorstate(this.error);
}
class NewsGetSearchErrorState extends Newsstates{
  String error;
  NewsGetSearchErrorState(this.error);
}
