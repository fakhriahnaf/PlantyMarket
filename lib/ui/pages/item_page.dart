part of 'pages.dart';


class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double listItemWidth = MediaQuery.of(context).size.width -2 *defaultMargin;
    return ListView(
      children: [
        Column(
          children: [
            ///HEADER
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text('Plant Market', style: blackFontStyle,),
                      Text('Lets Go Green', style: greyFontStyle.copyWith(fontWeight: FontWeight.w300)),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // ignore: deprecated_member_use
                      image: DecorationImage(image: NetworkImage((context.bloc<UserCubit>().state as UserLoaded).users.picturePath),
                        fit: BoxFit.cover
                      )
                    ),
                  )
                ],
              )
            ),
            ///LIST OF ITEM
            Container(
              height: 258,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: mockItems.map((e) => Padding(
                      padding: EdgeInsets.only(
                        left: (e == mockItems.first) ? defaultMargin : 0,
                        right: defaultMargin,
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(ItemDetailPage(
                            transaction: Transaction(
                              items: e,
                              // ignore: deprecated_member_use
                              users: (context.bloc<UserCubit>().state as UserLoaded).users
                            ),
                            onBackButtonPressed: () {
                              Get.back();
                            },
                          ));
                        },
                        
                        child: ItemCard(e)),
                    )).toList(),
                  ),
                ],
              )
            ),
            ///LIST OF ITEM(TABS)
            Container(
              width: double.infinity, 
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    titles: ['New Arival', 'Popular', 'Recomended'],
                    selectedIndex: selectedIndex,
                    onTap: (index){
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                   height: 16, 
                  ),
                  Builder(
                    builder: (_){
                      List<Items> items = (selectedIndex == 0 ) 
                      ? mockItems 
                      : (selectedIndex == 1) 
                      ? [] 
                      : [];
                      return Column(
                        children: items.map((e) => Padding(
                          padding: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),

                          child: ListItem(items:e, itemWidth: listItemWidth),
                        )).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
                    height: 80,
                  )
          ],
        )
      ],
    );
  }
}