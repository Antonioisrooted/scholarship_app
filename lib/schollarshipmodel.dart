class Sponsorships{
  String name;
  String description;
  Sponsorships(
      this.name,
      this.description,
      );
  Sponsorships.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }
}