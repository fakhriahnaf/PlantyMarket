part of 'models.dart';

enum TransactionStatus {delivered, on_delivered, pending, cancelled }

class Transaction extends Equatable {
  final int id;
  final Items items;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final TransactionStatus status;
  final Users users;

  Transaction(
    {
      
      this.id,
      this.items,
      this.quantity,
      this.dateTime,
      this.status,
      this.total,
      this.users,
    }
  );
  Transaction copyWith( 
    {
      int id,
      Items items,
      int quantity,
      int total,
      DateTime dateTime,
      TransactionStatus status,
      Users users,
    }
  ) {
    return Transaction(
      id: id ?? this.id,
      items: items ?? this.items,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
      dateTime: dateTime ?? this.dateTime,
      users: users ?? this.users,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [id, items, quantity, dateTime, status, users, total];

}
List<Transaction> mockTransaction = [
  Transaction(
    id: 0,
    items: mockItems[0],
    quantity: 10,
    total: (mockItems[0].price * 10 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.on_delivered,
    users: mockUsers,
  ),
  Transaction(
    id: 1,
    items: mockItems[1],
    quantity: 10,
    total: (mockItems[1].price * 10 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.delivered,
    users: mockUsers,
  ),
];