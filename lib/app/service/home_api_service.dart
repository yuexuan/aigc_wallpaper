import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/category_model.dart';
import '../model/product_page_model.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: "http://10.0.0.2:13861")
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET("/cate/all")
  Future<CategoryModel> allCate();

  @POST("/products/page")
  Future<ProductPageModel> productsOfPage();
}
