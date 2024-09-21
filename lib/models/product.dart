class Product{
  final String id;
  final String productName;
  final String productCode;
  final String productImage;
  final String quantity;
  final String unitPrice;
  final String totalPrice;
  final String CreateAt;

  Product(
      {
    required this.id,
    required this.productName,
    required this.productCode,
    required this.productImage,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    required this.CreateAt
      }
      );
}

