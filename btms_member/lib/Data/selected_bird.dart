import 'package:get/get.dart';

class SelectedBird {
  final String? name, bannerUrl1, status1, gender1;
  final double? weight1, height1;
  final int? bird_id;
  var isSelected = false.obs;
  SelectedBird({
    this.name,
    this.bird_id,
    required this.isSelected,
    this.bannerUrl1,
    this.height1,
    this.weight1,
    this.gender1,
    this.status1,
  });
}
