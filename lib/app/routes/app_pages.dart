import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/intro/login/bindings/login_binding.dart';
import '../modules/intro/login/views/login_view.dart';
import '../modules/intro/register/bindings/register_binding.dart';
import '../modules/intro/register/views/register_view.dart';
import '../modules/intro/resetPass/bindings/reset_pass_binding.dart';
import '../modules/intro/resetPass/views/reset_pass_view.dart';
import '../modules/main/addProduct/bindings/add_product_binding.dart';
import '../modules/main/addProduct/views/add_product_view.dart';
import '../modules/main/editProduct/bindings/edit_product_binding.dart';
import '../modules/main/editProduct/views/edit_product_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASS,
      page: () => ResetPassView(),
      binding: ResetPassBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT,
      page: () => EditProductView(),
      binding: EditProductBinding(),
    ),
  ];
}
