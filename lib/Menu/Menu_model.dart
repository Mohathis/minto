class menuItems{
  final String name;
  final int price;
  final String imagepath;
  bool isSelected;
  int quantity;

  menuItems({
    required this.name,required this.price,required this.imagepath,this.isSelected = false,this.quantity = 1,
});
}