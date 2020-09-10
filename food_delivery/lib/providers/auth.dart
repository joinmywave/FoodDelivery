import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/models/cart_Item.dart';
import 'package:food_delivery/models/order.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/models/user_model.dart';
import 'package:food_delivery/services/order_service.dart';
import 'package:food_delivery/services/user_service.dart';
import 'package:uuid/uuid.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserServices _userServices = UserServices();
  OrderServices _orderServices = OrderServices();
  UserModel _userModel;

//  getter
  UserModel get userModel => _userModel;
  Status get status => _status;
  User get user => _user;
  List<OrderModel> orders = [];

  final formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  AuthProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onStateChanged);
  }

  Future<bool> signIn() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _firestore.collection('users').doc(result.user.uid).set({
          'name': name.text.trim(),
          'email': email.text.trim(),
          'uid': result.user.uid,
          "favouriteFood": [],
          "favouriteRestaurant": []
        });
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void clearController() {
    name.text = "";
    password.text = "";
    email.text = "";
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(user.uid);
    notifyListeners();
  }

  Future<void> _onStateChanged(User firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(user.uid);
    }
    notifyListeners();
  }

  Future<bool> addToCart({ProductModel product, int quantity}) async {
    print("THE PRODUC IS: ${product.toString()}");
    print("THE qty IS: ${quantity.toString()}");

    try {
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List<CartItemModel> usercart = _userModel.cart;
      bool itemExists = false;
      Map<String, dynamic> cartItem = {
        "id": cartItemId,
        "name": product.name,
        "image": product.image,
        "restaurantId": product.restaurantId,
        "totalRestaurantSale": product.price * quantity,
        "productId": product.id,
        "price": product.price,
        "quantity": quantity
      };

      for (CartItemModel item in usercart) {
        if (item.productId == cartItem["productId"]) {
//          call increment quantity
          cartItem["id"] = item.id;
          item.quantity = item.quantity + quantity;
          itemExists = true;
          break;
        }
      }
      CartItemModel item = CartItemModel.fromMap(cartItem);

      _userServices.addToCart(userId: _user.uid, cartItem: item);

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  getOrders() async {
    orders = await _orderServices.getUserOrders(userId: _user.uid);
    notifyListeners();
  }

  Future<bool> removeFromCart({CartItemModel cartItem}) async {
    print("THE PRODUC IS: ${cartItem.toString()}");

    try {
      _userServices.removeFromCart(userId: _user.uid, cartItem: cartItem);
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }
}
