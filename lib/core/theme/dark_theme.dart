class DarkTheme {

DarkTheme._();
static  DarkTheme? _instance;

static DarkTheme? get instance{

if(_instance==null) _instance=DarkTheme._();
return _instance;
}

 }