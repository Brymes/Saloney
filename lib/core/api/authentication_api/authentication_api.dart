
import 'package:starter_project/models/api_response.dart';

abstract class AuthenticationApi {
  // //Fcm
  // Future<ApiResponse> updateFcmToken(String token);

  /// Registration
  //SALOON
  Future<ApiResponse> registerSaloon({
    String userName,
    String email,
    String phone,
    String password,
    String nameOfSalon,
    String typeOfSalon,
    String location,
  });
  Future<ApiResponse> loginSaloon({
    String userName,
    String password,
  });



  //CUSTOMER
  Future<ApiResponse> registerCustomer({
    String userName,
    String email,
    String phone,
    String password,
  });

  Future<ApiResponse> loginCustomer({
    String userName,
    String password,
  });


}
