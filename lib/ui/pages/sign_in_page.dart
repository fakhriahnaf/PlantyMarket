part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool isLoading = false;
    return GeneralPage(
      title: 'Sign in',
      subtitle: 'loginkeun weh',
      child: Column(
        children: [
          //buat bikin kolom email
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text("emailAddress", style: blackFontStyle2,
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
              controller: emailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'type email address',
              ),
            ),
          ),
          //Buat bikin password
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text("Password", style: blackFontStyle2,
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
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'passcode',
              ),
            ),
          ), 
          //tombol Sign IN
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top:24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading ? loadingIndicator
            : RaisedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                ///penghubung ke backend database untuk menyimpan data
                 // ignore: deprecated_member_use
                 await context.bloc<UserCubit>().signIn(
                          emailController.text, passwordController.text);
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
              Get.to(SignUpPage());
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