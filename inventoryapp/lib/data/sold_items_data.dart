import '../Model/item_class.dart';
import '../Model/sold_item_class.dart';

class SoldItemsData {
  static List<SoldItem> soldItems = [
    SoldItem(
      item: Item(
          id: 1,
          name: 'Product 1',
          category: 'Category 1',
          price: '12.99',
          margin: '2.50',
          quantity: '5'),
      date: DateTime.now(),
    ),
    SoldItem(
      item: Item(
          id: 2,
          name: 'Product 2',
          category: 'Category 2',
          price: '15.99',
          margin: '3.00',
          quantity: '10'),
      date: DateTime.now(),
    ),
    SoldItem(
      item: Item(
          id: 3,
          name: 'Product 3',
          category: 'Category 3',
          price: '9.99',
          margin: '1.50',
          quantity: '20'),
      date: DateTime.now(),
    ),
    SoldItem(
      item: Item(
          id: 4,
          name: 'Product 4',
          category: 'Category 4',
          price: '19.99',
          margin: '4.00',
          quantity: '8'),
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    SoldItem(
      item: Item(
          id: 5,
          name: 'Product 5',
          category: 'Category 5',
          price: '22.99',
          margin: '5.00',
          quantity: '12'),
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    SoldItem(
      item: Item(
          id: 6,
          name: 'Product 6',
          category: 'Category 1',
          price: '8.99',
          margin: '1.00',
          quantity: '7'),
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
    SoldItem(
      item: Item(
          id: 7,
          name: 'Product 7',
          category: 'Category 2',
          price: '16.99',
          margin: '2.75',
          quantity: '9'),
      date: DateTime.now().subtract(Duration(days: 7)),
    ),
    SoldItem(
      item: Item(
          id: 8,
          name: 'Product 8',
          category: 'Category 3',
          price: '13.99',
          margin: '2.25',
          quantity: '11'),
      date: DateTime.now().subtract(Duration(days: 8)),
    ),
    SoldItem(
      item: Item(
          id: 9,
          name: 'Product 9',
          category: 'Category 4',
          price: '17.99',
          margin: '3.25',
          quantity: '6'),
      date: DateTime.now().subtract(Duration(days: 9)),
    ),
    SoldItem(
      item: Item(
          id: 10,
          name: 'Product 10',
          category: 'Category 5',
          price: '11.99',
          margin: '1.75',
          quantity: '14'),
      date: DateTime.now().subtract(Duration(days: 10)),
    ),
    SoldItem(
      item: Item(
          id: 11,
          name: 'Product 11',
          category: 'Category 1',
          price: '21.99',
          margin: '4.50',
          quantity: '13'),
      date: DateTime.now().subtract(Duration(days: 11)),
    ),
    SoldItem(
      item: Item(
          id: 12,
          name: 'Product 12',
          category: 'Category 2',
          price: '14.99',
          margin: '2.50',
          quantity: '10'),
      date: DateTime.now().subtract(Duration(days: 12)),
    ),
    SoldItem(
      item: Item(
          id: 13,
          name: 'Product 13',
          category: 'Category 3',
          price: '18.99',
          margin: '3.75',
          quantity: '15'),
      date: DateTime.now().subtract(Duration(days: 13)),
    ),
    SoldItem(
      item: Item(
          id: 14,
          name: 'Product 14',
          category: 'Category 4',
          price: '10.99',
          margin: '1.25',
          quantity: '5'),
      date: DateTime.now().subtract(Duration(days: 14)),
    ),
    SoldItem(
      item: Item(
          id: 15,
          name: 'Product 15',
          category: 'Category 5',
          price: '12.49',
          margin: '1.50',
          quantity: '7'),
      date: DateTime.now().subtract(Duration(days: 15)),
    ),
    SoldItem(
      item: Item(
          id: 16,
          name: 'Product 16',
          category: 'Category 1',
          price: '20.99',
          margin: '4.00',
          quantity: '6'),
      date: DateTime.now().subtract(Duration(days: 16)),
    ),
    SoldItem(
      item: Item(
          id: 17,
          name: 'Product 17',
          category: 'Category 2',
          price: '23.99',
          margin: '5.50',
          quantity: '8'),
      date: DateTime.now().subtract(Duration(days: 17)),
    ),
    SoldItem(
      item: Item(
          id: 18,
          name: 'Product 18',
          category: 'Category 3',
          price: '25.99',
          margin: '6.00',
          quantity: '4'),
      date: DateTime.now().subtract(Duration(days: 18)),
    ),
    SoldItem(
      item: Item(
          id: 19,
          name: 'Product 19',
          category: 'Category 4',
          price: '27.99',
          margin: '6.50',
          quantity: '3'),
      date: DateTime.now().subtract(Duration(days: 19)),
    ),
    SoldItem(
      item: Item(
          id: 20,
          name: 'Product 20',
          category: 'Category 5',
          price: '29.99',
          margin: '7.00',
          quantity: '2'),
      date: DateTime.now().subtract(Duration(days: 20)),
    ),
    SoldItem(
      item: Item(
          id: 21,
          name: 'Product 21',
          category: 'Category 1',
          price: '31.99',
          margin: '7.50',
          quantity: '9'),
      date: DateTime.now().subtract(Duration(days: 21)),
    ),
    SoldItem(
      item: Item(
          id: 22,
          name: 'Product 22',
          category: 'Category 2',
          price: '33.99',
          margin: '8.00',
          quantity: '12'),
      date: DateTime.now().subtract(Duration(days: 22)),
    ),
    SoldItem(
      item: Item(
          id: 23,
          name: 'Product 23',
          category: 'Category 3',
          price: '35.99',
          margin: '8.50',
          quantity: '15'),
      date: DateTime.now().subtract(Duration(days: 23)),
    ),
    SoldItem(
      item: Item(
          id: 24,
          name: 'Product 24',
          category: 'Category 4',
          price: '37.99',
          margin: '9.00',
          quantity: '18'),
      date: DateTime.now().subtract(Duration(days: 24)),
    ),
    SoldItem(
      item: Item(
          id: 25,
          name: 'Product 25',
          category: 'Category 5',
          price: '39.99',
          margin: '9.50',
          quantity: '20'),
      date: DateTime.now().subtract(Duration(days: 25)),
    ),
    SoldItem(
      item: Item(
          id: 26,
          name: 'Product 26',
          category: 'Category 1',
          price: '41.99',
          margin: '10.00',
          quantity: '25'),
      date: DateTime.now().subtract(Duration(days: 26)),
    ),
    SoldItem(
      item: Item(
          id: 27,
          name: 'Product 27',
          category: 'Category 2',
          price: '43.99',
          margin: '10.50',
          quantity: '30'),
      date: DateTime.now().subtract(Duration(days: 27)),
    ),
    SoldItem(
      item: Item(
          id: 28,
          name: 'Product 28',
          category: 'Category 3',
          price: '45.99',
          margin: '11.00',
          quantity: '35'),
      date: DateTime.now().subtract(Duration(days: 28)),
    ),
    SoldItem(
      item: Item(
          id: 29,
          name: 'Product 29',
          category: 'Category 4',
          price: '47.99',
          margin: '11.50',
          quantity: '40'),
      date: DateTime.now().subtract(Duration(days: 29)),
    ),
    SoldItem(
      item: Item(
          id: 30,
          name: 'Product 30',
          category: 'Category 5',
          price: '49.99',
          margin: '12.00',
          quantity: '45'),
      date: DateTime.now().subtract(Duration(days: 30)),
    ),
  ];
}
