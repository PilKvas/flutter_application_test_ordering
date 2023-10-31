// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  UserModel(
      {this.secondAdress,
      required this.name,
      required this.email,
      required this.number,
      required this.country,
      required this.city,
      required this.adress,
      required this.postcode});

  final String adress;
  final String city;
  final String country;
  final String email;
  final String name;
  final String number;
  final String postcode;
  final String? secondAdress;

  @override
  String toString() {
    return 'SenderModel(name: $name, email: $email, number: $number, country: $country, city: $city, adress: $adress, postcode: $postcode)';
  }
}

enum SenderTabState {
  add,
  select,
}

enum RecipientTabState {
  add,
  select,
}
