class Policy {
  final String policyId;
  final String hotelId;
  final String type;
  final String description;

  Policy({
    required this.policyId,
    required this.hotelId,
    required this.type,
    required this.description,
  });

  // Factory constructor to create an instance from a JSON object
  factory Policy.fromJson(Map<String, dynamic> json) {
    return Policy(
      policyId: json['policyId'],
      hotelId: json['hotelId'],
      type: json['type'],
      description: json['description'],
    );
  }

  // Method to convert an instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'policyId': policyId,
      'hotelId': hotelId,
      'type': type,
      'description': description,
    };
  }
}

class Payload {
  final List<Policy> policies;

  Payload({
    required this.policies,
  });

  factory Payload.fromJson(Map<String, dynamic> json) {
    var policiesList = json['policies'] as List;
    List<Policy> policies =
        policiesList.map((i) => Policy.fromJson(i)).toList();

    return Payload(
      policies: policies,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'policies': policies.map((policy) => policy.toJson()).toList(),
    };
  }
}

class HotelPolicyModel {
  final Payload payload;
  final String status;

  HotelPolicyModel({
    required this.payload,
    required this.status,
  });

  factory HotelPolicyModel.fromJson(Map<String, dynamic> json) {
    return HotelPolicyModel(
      payload: Payload.fromJson(json['payload']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payload': payload.toJson(),
      'status': status,
    };
  }
}
