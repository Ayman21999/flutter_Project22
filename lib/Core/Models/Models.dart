class Products {
  String id;

  String name;

  String price;

  String img;

  Products({this.id, this.img, this.name, this.price});

  Products.fromJeso(Map<String, dynamic> map, String id)
      : this.id = id ?? '',
        this.price = map['price'] ?? '',
        this.name = map['name'] ?? '',
        this.img = map['img'] ?? '';

  toJson() {
    return {'id': id, 'name': name, 'price': price, 'img': img};
  }
}
