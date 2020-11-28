part of 'pages.dart';

class AddressRegisterPage extends StatefulWidget {
  final Users users;
  final String password;
  final File pictureFile;

  AddressRegisterPage(this.users, this.password, this.pictureFile);

  @override
  _AddressRegisterPageState createState() => _AddressRegisterPageState();
}

class _AddressRegisterPageState extends State<AddressRegisterPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController portalcodeController = TextEditingController();
    //TextEditingController cityController = TextEditingController();
  bool isLoading = false;
  List<String> cities;
  String selectedCity;
  
  @override 
  void initState() {

    cities = ['Depok','jakarta', 'Bogor', 'Bekasi', 'Tanggerang'];
    selectedCity = cities[0];
  }

   
  @override
  Widget build(BuildContext context) {
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
              value: selectedCity,
              isExpanded: true,
              underline: SizedBox(),
              items: cities.map((e) => DropdownMenuItem(
                value:e,
                child: Text(e, style: blackFontStyle3),
              )).toList(),
              onChanged: (items){
                setState(() {
                  selectedCity = items;
                });
              }),
          ), 
          //tombol Register
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top:24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: (isLoading == true)? Center(child: loadingIndicator) 
            
            :RaisedButton(onPressed: () async{
              Users users = widget.users.copyWith(
                phoneNumber: phoneController.text,
                address: addressController.text,
                portalCode: portalcodeController.text,
                city: selectedCity,

              );
              setState(() {
                isLoading= true;
              });
              // ignore: deprecated_member_use
              await context.bloc<UserCubit>().signUp(users, widget.password,pictureFile: widget.pictureFile);

              // ignore: deprecated_member_use
              UserState state = context.bloc<UserCubit>().state;

                  if(state is UserLoaded) {
                    // ignore: deprecated_member_use
                    context.bloc<ItemCubit>().getItem();
                    // ignore: deprecated_member_use
                    context.bloc<TransactionCubit>().getTransactions();
                    Get.to(MainPage());
                  } else {
                    Get.snackbar(" ", " ", 
                    backgroundColor: "D9435E".toColor(),
                    icon: Icon(MdiIcons.closeCircleMultipleOutline, color: Colors.white),
                    titleText: Text("sign In Failed",style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600)),
                    messageText: Text((state as UserLoadingFailed).message,
                      style: GoogleFonts.poppins(color: Colors.white),)
                    );
                    setState(() {
                      isLoading = false;
                    });
                  }

            }, 
            elevation :0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
            color: mainColor,
            child:  Text('Creat an account', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),),
            ) , 
          ),
          //tombol Create Account
        ],
      ),
    );
      
  }
}