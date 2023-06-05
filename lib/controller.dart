import 'package:get/get.dart';
import 'package:orelldata/service.dart';

class Controller extends GetxController {
  var isLoading = true.obs;
  var productList = [].obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await Http.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
