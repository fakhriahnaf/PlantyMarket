part of 'widgets.dart';

class ItemCard extends StatelessWidget {

  final Items items;

  ItemCard(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 210,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)
        ]
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(16)
              ),
              image: DecorationImage(image: NetworkImage(items.picturePath), fit: BoxFit.cover)
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 12, 12, 16),
            width: 200,
            child: Text(
              items.name,
              style: blackFontStyle2,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Rating(items.rate),
          )
        ],
      ),
    );
  }
}
