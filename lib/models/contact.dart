class Contact {
  final String name;
  final int AccountNumber;

  Contact(
    this.name,
    this.AccountNumber,
  );

  @override
  String toString() {
    return 'Contact{name: $name, AccountNumber: $AccountNumber}';
  }
}
