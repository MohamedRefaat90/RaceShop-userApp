class ApiLinks {
  // Auth API
  static const String baseURL = "https://ecommerce-api-lrnu.onrender.com";

  // ==================== Auth ============================
  static const String signup = "$baseURL/api/v1/auth/signup";
  static const String login = "$baseURL/api/v1/auth/login";
  static const String forgotPassword = "$baseURL/api/v1/auth/forgotPassword";
  static const String resetPassword = "$baseURL/api/v1/auth/resetPassword";
  static const String confirmEmail = "$baseURL/api/v1/auth/confirmEmail";
  static const String resendOtp = "$baseURL/api/v1/auth/resendOtp";

  // ==================== Home ============================
  static const String categories = "$baseURL/api/v1/home/categories";
}
