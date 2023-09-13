class Jwt {
  late final String grantType;
  late final String accessToken;
  late final String refreshToken;

  Jwt({
    required this.grantType,
    required this.accessToken,
    required this.refreshToken,
  });

  Jwt.fromJson(Map<String, dynamic> json)
      : grantType = json["grantType"],
        accessToken = json["accessToken"],
        refreshToken = json["refreshToken"];
}
