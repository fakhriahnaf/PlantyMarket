part of 'models.dart';

class Users extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String portalCode;
  final String phoneNumber;
  final String city;
  final String picturePath;
  static String token;

  Users(
    {
      this.id,
      this.name,
      this.email,
      this.address,
      this.portalCode,
      this.phoneNumber,
      this.city,
      this.picturePath,
    }
  );
  
  factory Users.fromJson(Map<String, dynamic> data) => Users(
    id: data['id'],
    name: data['name'],
    email: data['email'],
    address: data['address'],
    portalCode: data['portalCode'],
    phoneNumber: data['phoneNumber'],
    city: data['city'],
    picturePath: data['profile_photo_url'],
  );


  Users copyWith({
    int id,
    String name,
    String email,
    String address,
    String phoneNumber,
    String portalCode,
    String city,
    String picturePath,
  }) => Users(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    address: address ?? this.address,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    portalCode: portalCode ?? this.portalCode,
    city: city ?? this.city,
    picturePath: picturePath ?? this.picturePath,
  );

  @override
  // TODO: implement props
  List<Object> get props => [id, name, email, address, portalCode, phoneNumber, city, picturePath];

}

Users mockUsers = Users(
  id: 1,
  name: 'Juwita Cantika',
  email: 'juwita@mail.com',
  address: 'Duta Kencana 2 bogor',
  city: 'Bogor',
  portalCode: '16464',
  phoneNumber: '1231223213',
  picturePath: 'https://images.unsplash.com/photo-1605557834021-6d58b8f73e66?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'

);