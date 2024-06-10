import 'package:flutter/material.dart';
import '../../../Model/item_class.dart';

class Cart extends StatelessWidget {
  final List<Item> cartItems;
  final Function(int) onRemoveItem;

  Cart({required this.cartItems, required this.onRemoveItem});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: cartItems.length,
      separatorBuilder: (context, index) => const Divider(color: Colors.grey),
      itemBuilder: (context, index) {
        final cartItem = cartItems[index];
        return ListTile(
          title: Text(cartItem.name),
          subtitle: Text("Price: \$${cartItem.price}"),
          trailing: GestureDetector(
            onTap: () {
              onRemoveItem(index);
            },
            child: const MouseRegion(cursor:SystemMouseCursors.click,child: Icon(Icons.minimize)),
          ),
        );
      },
    );
  }
}
