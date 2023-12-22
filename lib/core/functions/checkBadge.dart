import 'package:pharmadicum/data/datasource/static.dart';

bool checkBadge() {
  if(items.isNotEmpty){
    isBadge = true;
  }
  else{
    isBadge = false;
  }
  return isBadge;
}
