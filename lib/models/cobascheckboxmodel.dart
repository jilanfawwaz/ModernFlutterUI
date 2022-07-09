class CobaCheckboxModel {
  final String id;
  final String title;
  final bool isSelected;

  CobaCheckboxModel({
    required this.id,
    required this.title,
    this.isSelected = false,
  });
}
