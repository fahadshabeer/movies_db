
import 'dart:developer';

import 'package:dio/dio.dart';

class ExceptionHandler
{
  // Private method to handle errors and provide custom messages
  static String handleError(DioException error) {
    log("CREATE_GROUP_ERR",error:error.response?.data.toString());
    if (error.type == DioExceptionType.connectionTimeout) {
      return "Connection Timeout. Please try again later.";
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return "Receive Timeout. Please try again.";
    } else if (error.type == DioExceptionType.sendTimeout) {
      return "Send Timeout. Please check your connection.";
    }
    else if(error.type==DioExceptionType.connectionError){
      return "Something went wrong with your connection, please try again later";
    }else {
      return "${error.response?.data['error']??error.response?.statusMessage??"Unknown error occurred"}";
    }
  }
}