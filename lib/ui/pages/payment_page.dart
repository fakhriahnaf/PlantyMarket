part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction; 
  
  PaymentPage({this.transaction});
  
  @override
  _PaymentPageState createState() => _PaymentPageState(); 

}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
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
                            image: DecorationImage(image: NetworkImage(widget.transaction.items.picturePath), 
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
                                widget.transaction.items.name,
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
                              ).format(widget.transaction.items.price),
                              style: greyFontStyle.copyWith(fontSize:13),
                            )
                          ],
                        )
                      ],
                    ),
                    Text(
                      '${ widget.transaction.quantity} items',
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
                        widget.transaction.items.name,
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
                        ).format(widget.transaction.total),
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
                        ).format(widget.transaction.total * 0.1),
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
                        ).format(widget.transaction.total * 1.1 + 20000),
                        style: blackFontStyle3.copyWith(fontWeight: FontWeight.w500, color: '1ABC9C'.toColor()),
                        textAlign: TextAlign.right,
                      ), 
                    )
                  ],
                ),
              ], 
            ),
          ),
          ///BAGIAN BAWAH
                    //// Bagian bawah
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding:
                EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to',
                  style: blackFontStyle3,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 80,
                        child: Text(
                          'Name',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin -
                            80,
                        child: Text(
                          widget.transaction.users.name,
                          style: blackFontStyle3,
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Phone Number',
                      style: greyFontStyle,
                    ),
                    Text(
                      widget.transaction.users.phoneNumber,
                      style: blackFontStyle3,
                      textAlign: TextAlign.right,
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
                        width: 80,
                        child: Text(
                          'Address',
                          style: greyFontStyle,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin -
                            80,
                        child: Text(
                          widget.transaction.users.address,
                          style: blackFontStyle3,
                          textAlign: TextAlign.right,
                        ))
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'portal code',
                      style: greyFontStyle,
                    ),
                    Text(
                      widget.transaction.users.portalCode,
                      style: blackFontStyle3,
                      textAlign: TextAlign.right,
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
                    Text(
                      'City',
                      style: greyFontStyle,
                    ),
                    Text(
                      widget.transaction.users.city,
                      style: blackFontStyle3,
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
              ],
            ),
          ),
          //// Checkout Button
          (isLoading)
              ? Center(
                  child: loadingIndicator,
                )
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  height: 45,
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      String paymentURL = await context
                          // ignore: deprecated_member_use
                          .bloc<TransactionCubit>()
                          .submitTransaction(widget.transaction.copyWith(
                              dateTime: DateTime.now(),
                              total: (widget.transaction.total * 1.1).toInt() +
                                  50000));

                      if (paymentURL != null) {
                        Get.to(PaymentMethodePage(paymentURL));
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(MdiIcons.closeCircleOutline,
                                color: Colors.white),
                            titleText: Text(
                              'Transaction Failed',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            messageText: Text(
                              'Please try again later.',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ));
                      }
                    },
                    elevation: 0,
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "Checkout Now",
                      style:
                          blackFontStyle3.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}