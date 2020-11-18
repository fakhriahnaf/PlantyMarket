part of 'models.dart';


class Items extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String spesification;
  final int price;
  final double rate;

  Items(
    {
      this.id,
      this.picturePath,
      this.name,
      this.description,
      this.spesification,
      this.price,
      this.rate,
    }
  );

  @override
  // TODO: implement props
  List<Object> get props => [id, picturePath,name,description, spesification, price, rate];
}

List<Items> mockItems = [
  Items(
    id: 1,
    picturePath: "https://images.unsplash.com/photo-1517848568502-d03fa74e1964?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    name: "monstera",
    description: "ini barang bagus dan murah tentunya menunjang estetika",
    spesification: "tinggi batang 12cm, pot cantik",
    price: 15000,
    rate: 4.2,
  ),
  Items(
    id: 2,
    picturePath: "https://images.unsplash.com/photo-1517848568502-d03fa74e1964?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    name: "monstera",
    description: "ini barang bagus dan murah tentunya menunjang estetika",
    spesification: "tinggi batang 12cm, pot cantik",
    price: 15000,
    rate: 4.2,
  ),

];
