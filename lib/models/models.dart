class RocketDetails {
  final String name;
  final String type;
  final bool active;
  final int costPerLaunch;
  final double successRate;
  final String firstFlight;
  final String country;
  final String company;
  final String wikipedia;
  final String description;
  final String id;

  RocketDetails({
    required this.name,
    required this.type,
    required this.active,
    required this.costPerLaunch,
    required this.successRate,
    required this.firstFlight,
    required this.country,
    required this.company,
    required this.wikipedia,
    required this.description,
    required this.id,
  });

  factory RocketDetails.fromJson(Map<String, dynamic> json) {
    return RocketDetails(
      name: json['name'],
      type: json['type'],
      active: json['active'],
      costPerLaunch: json['cost_per_launch'],
      successRate: json['success_rate_pct'].toDouble(),
      firstFlight: json['first_flight'],
      country: json['country'],
      company: json['company'],
      wikipedia: json['wikipedia'],
      description: json['description'],
      id: json['id'],
    );
  }
}