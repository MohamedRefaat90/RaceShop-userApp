class Address {
  String? type;
  List<double>? coordinates;
  String? name;
  String? city;
  String? street;
  int? buildingNumber;
  int? floorNumber;
  int? apartmentNumber;

  Address(
      {this.type,
      this.coordinates,
      this.name,
      this.city,
      this.street,
      this.buildingNumber,
      this.floorNumber,
      this.apartmentNumber});

  Address.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
    name = json['name'];
    city = json['city'];
    street = json['street'];
    buildingNumber = json['buildingNumber'];
    floorNumber = json['floorNumber'];
    apartmentNumber = json['apartmentNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    data['name'] = this.name;
    data['city'] = this.city;
    data['street'] = this.street;
    data['buildingNumber'] = this.buildingNumber;
    data['floorNumber'] = this.floorNumber;
    data['apartmentNumber'] = this.apartmentNumber;
    return data;
  }
}
