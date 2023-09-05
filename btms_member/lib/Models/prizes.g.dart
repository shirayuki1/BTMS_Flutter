// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'prizes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prizes _$PrizesFromJson(Map<String, dynamic> json) {
  String price = json['price'].toString();
  double pricedouble = double.parse(price.toString());

  return Prizes(
    prize_Id: json['prize_Id'] as int?,
    tournament_Id: json['tournament_Id'] as int?,
    name: json['name'] as String?,
    rank: json['rank'] as int?,
    price: pricedouble,
  );
}

Map<String, dynamic> _$PrizesToJson(Prizes instance) => <String, dynamic>{
      'prize_Id': instance.prize_Id,
      'tournament_Id': instance.tournament_Id,
      'name': instance.name,
      // 'roundNumber': instance.roundNumber,
      // 'startTime': instance.startTime,
      'price': instance.price,
      'rank': instance.rank,
    };
