part of 'pages.dart';
//part of 'illustration_page.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(builder: (_,state) {
      if (state is TransactionLoaded) {
        if (state.transactions.length == 0) {
          return IllustrationPage(
            title: 'Belanja Dong!', 
            subtitle: 'hijaukan rumahmu dengan membeli barang dari kami',
            picturePath: 'assets/plant_market.png',
            buttonTap1: () {},
            buttonTitle1: 'Find Plant',
          );
        } else {
          double listItemWidth = MediaQuery.of(context).size.width -2 * defaultMargin;
          return ListView(
            children: [
              Column(
                children: [
                  //HEADER
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: defaultMargin),
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your order',
                          style: blackFontStyle
                        ),
                        Text(
                          'completly knockdown the bags',
                          style: greyFontStyle.copyWith(fontWeight: FontWeight.w300)
                        )
                      ],
                    )
                  ),
                  ///BODY
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        CustomTabBar(
                          titles: ['in Progress', 'Complete'],
                          selectedIndex: selectedIndex,
                          onTap: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          }
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Builder(builder: (_){
                          List<Transaction> transactions = (selectedIndex == 0) ? state.transactions.where((element) => 
                                element.status == TransactionStatus.on_delivered ||
                                element.status == TransactionStatus.pending)
                              .toList(): state.transactions.where((element) => 
                                element.status == TransactionStatus.delivered ||
                                element.status == TransactionStatus.cancelled)
                              .toList();
                              return Column(
                              children: transactions
                              .map((e) => Padding(
                                padding: const EdgeInsets.only(right: defaultMargin, left: defaultMargin, bottom: 16),
                                child: OrderListItem(transaction: e, itemWidth: listItemWidth),
                              )).toList(),
                            );
                        })
                      ]
                    )
                  )
                ],
              ),
            ],
          );
        }
      }
      else {
        return Center(
          child: loadingIndicator,
        );
      }
    });
  }
}