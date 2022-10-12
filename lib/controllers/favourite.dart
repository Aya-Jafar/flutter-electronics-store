
import 'package:get/get.dart';
import 'package:get_x_first_trial/models/favourite.dart';
import 'package:get_x_first_trial/services/favourite.dart';


class FavController extends GetxController {
  RxList<Favourite> FavList = <Favourite>[].obs;

  @override
  void onInit() {
    getAllFavourites();
    super.onInit();
  }

  Future<RxList<Favourite>> getAllFavourites() async {
    FavList.value = await FavService.getAllFavourite();
    return FavList;
  }

  void deleteFav({required int id}) async {
    (await FavService.deleteFavourite(id: id));
    FavList.removeWhere((element) => element.id == id);
  }
}
