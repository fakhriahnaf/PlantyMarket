part of 'pages.dart';

class ItemDetailPage extends StatefulWidget {
  final Function onBackButtonPressed;
  final Transaction transaction;

  ItemDetailPage({
    this.onBackButtonPressed,
    this.transaction,
  });

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {

  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: mainColor,
          
          ),
          SafeArea(
            child: Container(
              color: Colors.white)
          ),
          SafeArea(child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(widget.transaction.items.picturePath),
              fit: BoxFit.cover
              )
            ),
          ),),
          SafeArea(child: ListView(
            children :[
              Column(
                children: [

                  ///BACK BUTTON
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          if(widget.onBackButtonPressed != null) {
                            widget.onBackButtonPressed();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                            color : Colors.black12,
                          ),
                          child: Image.asset('assets/back_arrow_white.png'),
                        )
                      )
                    )
                  ),

                  ///BODY
                  Container(
                    margin: EdgeInsets.only(top:180),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal:16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      color: Colors.white
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, //supaya rata kiri
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //nama barang
                                SizedBox(
                                  width: MediaQuery.of(context).size.width -134 ,// 32 +102,
                                  child: Text(
                                    widget.transaction.items.name,
                                    style: blackFontStyle2,
                                  ),
                                ),
                                //jarak sekat
                                SizedBox(
                                  height: 6,
                                ),
                                //bintang rate
                                Rating(widget.transaction.items.rate)
                              ],
                            ),
                            Row(
                              children: [
                                //button min
                                GestureDetector(
                                  onTap: (){
                                    setState((){
                                      quantity = max(1, quantity -1); 
                                    });
                                  },
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(width: 1),
                                      image: DecorationImage(
                                        image: AssetImage('assets/btn_min.png')
                                      )
                                    )
                                  ),
                                ),
                                //Quantitiy detail item (bisa buat nambahin jumlah barang)
                                SizedBox(
                                  width: 50,
                                  child: Text(quantity.toString(),
                                    textAlign: TextAlign.center,
                                    style: blackFontStyle2,
                                  ),
                                ),
                                //button Add
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity = min(999, quantity +1 );
                                    });
                                  },
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(width: 1),
                                      image: DecorationImage(
                                        image: AssetImage('assets/btn_add.png')
                                      )
                                    )
                                  ),
                                ),
                              ],
                            ),
                            Container()
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
                          child: Text(
                            widget.transaction.items.description,
                            style: greyFontStyle,
                          )
                        ),
                        Text(
                          'Spesification: ',
                          style: blackFontStyle3,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 4, 0, 41),
                          child: Text(
                            widget.transaction.items.spesification,
                            style: greyFontStyle,
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Price' ,
                                  style: greyFontStyle.copyWith(fontSize: 13),
                                ),
                                Text(
                                  NumberFormat.currency(
                                    locale: 'ID-IDR',
                                    symbol: 'IDR ',
                                    decimalDigits: 0,
                                  ).format(quantity * widget.transaction.items.price ),
                                  style: blackFontStyle2.copyWith(fontSize: 18),
                                ) 
                              ],
                            ),
                            
                            //button 
                            SizedBox(
                              width: 163,
                              height: 45,
                              child: RaisedButton(
                                onPressed: () {
                                  Get.to(PaymentPage(
                                    transaction: widget.transaction.copyWith(
                                    quantity: quantity,
                                    total : quantity * widget.transaction.items.price
                                    )
                                  ));
                                },
                                color: mainColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: Text(
                                  'Order Now',
                                  style: blackFontStyle3.copyWith(fontWeight: FontWeight.w500),
                                ),
                                
                              )
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ]
              )
            ]
          ),)

        ]
      ),
    );
  }
}