extension OnString on String{

  String get getName =>  this.replaceFirst("/", "");
}