
// Paging2 cartFromJson(String str) => Paging2.fromJson(json.decode(str));
// String cartToJson(Paging2 data) => json.encode(data.toJson());
class Paging2<T> {
  final String? message;
  late final List<T>? data;
  //List<dynamic>? content;
  List<dynamic>? rawContent;

  // static Paging2<T> defaultInstance<T>() {
  //   final paging = Paging2<T>();
  //   paging.data = null;
  //   return paging;
  // }
  Paging2({
    this.message,
    this.rawContent,
  });

  // Convert json array to list
  void convertToList(Function fromJson) {
    data = rawContent?.map<T>((x) => fromJson(x)).toList();
    rawContent = null;
  }

  factory Paging2.fromJson(Map<String, dynamic> json) => Paging2<T>(
        message: json['@odata.context'] as String?,
        rawContent: json['value'] as List?,
      );

  Map<String, dynamic> toJson() => {
        '@odata.context': this.message,
        'value': this.data,
      };
}
