part of 'widgets.dart';




class ListItem extends StatelessWidget {
  final Items items;
  final double itemWidth;

  ListItem({
    @required
    this.items,
    this.itemWidth
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right:12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), 
            image: DecorationImage(image: NetworkImage(items.picturePath), fit: BoxFit.cover)
          ),
        ),
        SizedBox(
          width: itemWidth - 182,//(60 - 12 - 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                items.name,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip, 
              ),
              Text(
                NumberFormat.currency(
                  symbol: 'IDR ',
                  decimalDigits: 0,
                  locale: 'id-ID'
                ).format(items.price),
                style: greyFontStyle.copyWith(fontSize: 13),
              )
            ],
          ),
        ),
        Rating(items.rate)
      ],
    );
  }
}