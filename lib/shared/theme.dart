part of  'shared.dart';
//import 'package:PlantyMarket/shared/shared.dart';
const double defaultMargin = 24;

//Color mainColor = "FFC700".toColor();
Color greyColor = "8D92A3".toColor();
Color mainColor = "A4CFC0".toColor();



Widget loadingIndicator = SpinKitFadingCircle(
              size:45,
              color:mainColor,
            ); 

TextStyle blackFontStyle = GoogleFonts.poppins().copyWith(color: Colors.black,fontSize:22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins().copyWith(color: Colors.black,fontSize:16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(color: Colors.black);


TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);




