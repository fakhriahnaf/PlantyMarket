part of 'pages.dart';

class AddressRegisterPage extends StatefulWidget {
  @override
  _AddressRegisterPageState createState() => _AddressRegisterPageState();
}

class _AddressRegisterPageState extends State<AddressRegisterPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController portalcodeController = TextEditingController();
    //TextEditingController cityController = TextEditingController();
    bool isLoading = false;
    return GeneralPage(
      title: 'Register',
      subtitle: 'Create your account',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          //buat bikin kolom nomor HP
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text("Phone Number", style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black)
            ),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'type phone number',
              ),
            ),
          ),
          //kolom address
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text("Address", style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black)
            ),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'type address location',
              ),
            ),
          ),
          //kolom portal code
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text("Phone Number", style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black)
            ),
            child: TextField(
              controller: portalcodeController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'type portalcode sign',
              ),
            ),
          ),
          //Buat masukin nama kota (dropdown)
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text("City Address", style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black)
            ),
            //buat masukin dropdown
            child: DropdownButton(
              isExpanded: true,
              underline: SizedBox(),
              items: [
              DropdownMenuItem(
                child: Text(
                  'Jakarta', 
                  style: blackFontStyle3,
                  )
                ),
              DropdownMenuItem(
                child: Text(
                  'Bogor', 
                  style: blackFontStyle3,
                  )
                ),
              DropdownMenuItem(
                child: Text(
                  'Depok', 
                  style: blackFontStyle3,
                  )
                ),
            ], onChanged: (item) {}),
          ), 
          //tombol Register
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top:24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading ? SpinKitFadingCircle(
              size:45,
              color:mainColor,
            ) : RaisedButton(onPressed: () {}, 
            elevation :0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
            color: mainColor,
            child:  Text('SignIn', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),),
            ) , 
          ),
          //tombol Create Account
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top:24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading ? SpinKitFadingCircle(
              size:45,
              color:mainColor,
            ) : RaisedButton(onPressed: () {
              Get.to(MainPage());
            }, 
            elevation :0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
            color: greyColor,
            child:  Text('Create A new Account', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),),
            ) , 
          ),
        ],
      ),
    );
      
  }
}