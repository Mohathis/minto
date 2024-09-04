import 'package:flutter/material.dart';

import 'Menu_model.dart';

class Menu_Items extends StatefulWidget {

  @override
  State<Menu_Items> createState() => _Menu_ItemsState();
}

class _Menu_ItemsState extends State<Menu_Items> {

  final List<menuItems> menuItem = [
    menuItems(name: 'Burger', price: 10, imagepath: "assets/icons/burger.jpeg"),
    menuItems(name: 'Nuggets', price: 4, imagepath: "assets/icons/nuggets.jpeg"),
    menuItems(name: 'Pizza', price: 14, imagepath: "assets/icons/pizza.jpeg"),
    menuItems(name: 'Broasted', price: 7, imagepath: "assets/icons/broasted.jpeg"),
    menuItems(name: 'Chicken Grill', price: 5, imagepath: "assets/icons/chickengrill.jpeg"),
    menuItems(name: 'Apple Juice', price: 3, imagepath: "assets/icons/applejuice.jpeg"),
    menuItems(name: 'Sandwich', price: 4, imagepath: "assets/icons/sandwich.jpeg"),
    menuItems(name: 'Royal Falooda', price: 6, imagepath: "assets/icons/falooda.jpeg"),
  ];

  void _onItemSelect(menuItems item){
    setState(() {
      item.isSelected = ! item.isSelected;
      if (!item.isSelected){
        item.quantity = 1;
      }
    });
  }

  void _onQuantityChange(menuItems item,int change){
    setState(() {
      item.quantity = (item.quantity + change).clamp(1, 99);
    });
  }


  void _placeOrder(){
    final selectedItems = menuItem.where((item) => item.isSelected).toList();

    if (selectedItems.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Select Your Food...')));
      return;
    }

    
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Order Successfull...")));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: _placeOrder, child: Text('Order Now',style: TextStyle(color: Colors.white),))
        ],
        backgroundColor: Colors.redAccent,
        title: Center(child: Text("Menu")),),
      body: ListView.builder(
          itemCount: menuItem.length,
          itemBuilder: (context, index){
            final item = menuItem[index];
            return ListTile(
              leading: Image.asset(item.imagepath),
              title: Text(item.name),
              subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                trailing: item.isSelected ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(icon: Icon(Icons.remove), onPressed: ()=> _onQuantityChange(item, -1), ),
                    Text('${item.quantity}'),
                    IconButton(icon: Icon(Icons.add), onPressed: ()=> _onQuantityChange(item, 1), )
                  ],
                )
                : null,
              onTap: () => _onItemSelect(item),
              tileColor: item.isSelected ? Colors.blueAccent : null,
            );
          }),
    );
  }
}
