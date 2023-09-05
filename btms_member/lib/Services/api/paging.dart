
class Paging<T> {
  final String? message;
  final bool? success;
  late final List<T>? data;
  List<dynamic>? content;
  final Map<String, dynamic>? rawData;

  static Paging<T> defaultInstance<T>() {
    final paging = Paging<T>();
    paging.content = null;
    return paging;
  }

  Paging({
    this.success,
    this.message,
    this.rawData,
  });

  // Convert json array to list
  void convertToList(Function fromJson) {
    data = content?.map<T>((x) => fromJson(x)).toList();
    content = null;
  }

  // Convert json array to list
  String convertToListV2(Function fromJson) {
    String token = '';
    //Account account = new Account();
    rawData!.forEach((key, value) {
      if (key == "token") {
        token = value;
      }
    });
    return token;
  }

  // ClubDetail convertToListV5(Function fromJson) {
  //   ClubDetail club = new ClubDetail();

  //     if(rawData != null){

  //         club = ClubDetail.fromJson(Paging.fromJson());

  //       }

  //   print("club=== " + club.toString());
  //   return club;
  // }

  factory Paging.fromJson(Map<String, dynamic> json) => Paging<T>(
        message: json['message'] as String?,
        success: json['success'] as bool?,
        rawData: json['data'] as Map<String, dynamic>?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'success': this.success,
        'message': this.message,
        'data': this.data,
      };
}
