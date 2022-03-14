import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerece_app/blocs/repositories/product/base_product_repo.dart';
import 'package:ecommerece_app/model/product_model.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;
  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapShot(doc)).toList();
    });
  }
}