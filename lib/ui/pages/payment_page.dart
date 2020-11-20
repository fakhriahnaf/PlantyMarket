part of 'pages.dart';

class PaymentPage extends StatelessWidget {

  final Transaction transaction;
  
  PaymentPage(
    { 
      this.transaction
    }
  );
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Payment',
      subtitle: 'silahkan di bayar ye',
      onBackButtonPressed: (){},
      backColor: 'FAFAFC'.toColor(),
      child: Column(
        children: [
          ///BAGIAN ATAS
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal:defaultMargin, vertical:16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //header tagline
                Text(
                  'Item Oredered',
                  style: blackFontStyle3,
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //gambar Barang
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(right:12),
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.circular(8),
                            image: DecorationImage(image: NetworkImage(transaction.items.picturePath), 
                            fit: BoxFit.cover)
                          ),
                        ),
                        //nama barang + HARGA
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width -189,
                                // - 2 * defaultMargin (jarak border)
                                // - 60 (jarak gambar)
                                // -12 (jarak gambar ke judul)
                                // -78, (jarak jumlah item)
                                                          child: Text(
                                transaction.items.name,
                                style: blackFontStyle2,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0,
                              ).format(transaction.items.price),
                              style: greyFontStyle.copyWith(fontSize:13),
                            )
                          ],
                        )
                      ],
                    ),
                    Text(
                      '${ transaction.quantity} items',
                      style: greyFontStyle.copyWith(fontSize:13),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top:16, bottom: 8),
                  child: Text(
                    'Detail Transaction',
                    style: blackFontStyle3,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(
                        transaction.items.name,
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin -5,
                      child: Text(
                        NumberFormat.currency(
                          locale: 'id-ID',
                          symbol: 'IDR',
                          decimalDigits: 0
                        ).format(transaction.quantity * transaction.items.price),
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ), 
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(
                        'Ongkir',
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin -5,
                      child: Text(
                        NumberFormat.currency(
                          locale: 'id-ID',
                          symbol: 'IDR',
                          decimalDigits: 0
                        ).format(20000),
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ), 
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(
                        'TAX 10%',
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin -5,
                      child: Text(
                        NumberFormat.currency(
                          locale: 'id-ID',
                          symbol: 'IDR',
                          decimalDigits: 0
                        ).format(transaction.quantity * transaction.items.price * 0.1),
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ), 
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(
                        'Total',
                        style: greyFontStyle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin -5,
                      child: Text(
                        NumberFormat.currency(
                          locale: 'id-ID',
                          symbol: 'IDR',
                          decimalDigits: 0
                        ).format(transaction.items.price * transaction.quantity * 1.1 + 20000),
                        style: blackFontStyle3.copyWith(fontWeight: FontWeight.w500, color: '1ABC9C'.toColor()),
                        textAlign: TextAlign.right,
                      ), 
                    )
                  ],
                ),
                
              ], 
            ),
          )
        ]
      ),
      
    );
  }
}