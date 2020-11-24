part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: 'Belanja Dong!', 
                  subtitle: 'hijaukan rumahmu dengan membeli barang dari kami',
                  picturePath: 'assets/plant_market.png',
                  buttonTap1: () {
                    Get.offAll(MainPage());
                  },
                  buttonTitle1: 'Find Plant',
                  buttonTap2: () {
                    Get.offAll(MainPage(initialPage: 1));
                  },
                  buttonTitle2: 'View My Order',
      ),
      
    );
  }
}