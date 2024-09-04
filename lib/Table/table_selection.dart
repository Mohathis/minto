import 'package:flutter/material.dart';
import 'package:minto_app/Menu/Menu_model.dart';
import 'package:minto_app/Menu/Menu_items.dart';
import 'package:minto_app/Table/tablemodel.dart';

void main(){
  runApp(MaterialApp(home: tableSelection(),));
}

class tableSelection extends StatelessWidget {

    final List<Tablemodel> tables = [
      Tablemodel(tableNumber: 1, isOccupied: false, imagepath: 'assets/icons/table1.jpeg',seats: 6),
      Tablemodel(tableNumber: 2, isOccupied: true, imagepath: "assets/icons/table2.jpeg",seats: 4),
      Tablemodel(tableNumber: 3, isOccupied: false, imagepath: "assets/icons/images (13).jpeg",seats: 2),
      Tablemodel(tableNumber: 4, isOccupied: false, imagepath: "assets/icons/images (12).jpeg",seats: 6),
      Tablemodel(tableNumber: 5, isOccupied: true, imagepath: "assets/icons/images (11).jpeg",seats: 4),
      Tablemodel(tableNumber: 6, isOccupied: false, imagepath: "assets/icons/images (14).jpeg",seats: 8),
      Tablemodel(tableNumber: 7, isOccupied: true, imagepath: "assets/icons/images (15).jpeg",seats: 4),
      Tablemodel(tableNumber: 8, isOccupied: true, imagepath: "assets/icons/images (16).jpeg",seats: 6),
      Tablemodel(tableNumber: 9, isOccupied: false, imagepath: "assets/icons/images (17).jpeg",seats: 10)
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Center(child: Text("Select a Table")),
      ),
      body: ListView.builder(
          itemCount: tables.length,
          itemBuilder: (context, index){
        final table = tables[index];
        return ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(table.imagepath),radius: 30,),
          title: Text('Table ${table.tableNumber}',style: TextStyle(color: Colors.black),),
          subtitle: Text(table.isOccupied ? 'Occupied' : 'Open',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
          trailing:  Text('${table.seats} Seats',style: TextStyle(color: Colors.black),),
          tileColor: table.isOccupied ? Colors.green : Colors.white,
          onTap: () {
            if (!table.isOccupied){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Menu_Items()));
            }
          },
        );
      }),
    );
  }
}
