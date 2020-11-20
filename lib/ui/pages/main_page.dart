part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: 'FAFAFC'.toColor(),
            ),
          ),

          //ISI HALAMAN
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index){
                setState(() {
                  selectedPage = index;
                });
              },
            children: [
              ///ITEM PAGE 
              Center(
                child: ItemPage(),
              ),
              ///PAGE ORDER
              Center(
                child: OrderHistoryPage()
              ),
              ///PAGE PROFILE
              Center(
                child: Text("Profile"),
              ), 
            ],
          ),
          ),

          //perpindahan halaman
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavbar(
              selectedIndex: selectedPage,
              onTap: (index) {
                setState(() {
                  selectedPage = index;
                });
                pageController.jumpToPage(selectedPage);
              },
            ),
          ),
        ],
      ),
    );
  }
}