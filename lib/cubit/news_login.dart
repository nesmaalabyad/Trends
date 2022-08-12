class ShopLoginModel
{
  bool status =false;
  String message ='';
  UserModel? data ;
  ShopLoginModel({this.data , this.status=false,this.message=''});
  ShopLoginModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    message=json['message'];
    data=json['data']!=null?UserModel.fromJson(json['data']):null;
  }
}
class UserModel
{
  int id=0 ;
  String name ='';
  String email='' ;
  String phone='' ;
  String image ='';
  int points=0 ;
  int credit =0;
  String token ='';
  UserModel({this.token='',this.id=0,this.points=0,this.credit=0,this.name='',this.image='',this.phone='',this.email=''});

  // named constructor
  UserModel.fromJson(Map<String , dynamic> json)
  {
    id= json['id'] ;
    name= json['name'] ;
    email= json['email'] ;
    phone= json['phone'] ;
    image= json['image'] ;
    points= json['points'] ;
    credit= json['credit'] ;
    token= json['token'] ;
  }
}