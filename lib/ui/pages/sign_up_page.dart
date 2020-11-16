part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    bool isLoading = false;
    return GeneralPage(
      title: 'Register',
      subtitle: 'bikin akun weh',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: 110,
            height: 110,
            margin: EdgeInsets.only(top:26),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/photo_border.png'))
            ),
            child: Container(
              decoration: BoxDecoration(
                shape:BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1605405809413-635a61f3d40a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
                    fit: BoxFit.cover
                ),
              )
            ),
          ),
          //buat kolom nama
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text("Full Name", style: blackFontStyle2,
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
              controller: nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'type your fullname',
              ),
            ),
          ),
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
            child: isLoading ? SpinKitFadingCircle(
              size:45,
              color:mainColor,
            ) : RaisedButton(onPressed: () {
              Get.to(AddressRegisterPage());
            }, 
            elevation :0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
            color: mainColor,
            child:  Text('Continue', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),),
            ) , 
          ),
          
        ],
      ),
    );
      
  }
}