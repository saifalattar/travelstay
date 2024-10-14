class PriceDetails {
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final List<Hotel> hotelList;

  PriceDetails({
    required this.checkInDate,
    required this.checkOutDate,
    required this.hotelList,
  });

  factory PriceDetails.fromJson(Map<String, dynamic> json) {
    return PriceDetails(
      checkInDate: DateTime.parse(json['checkInDate']),
      checkOutDate: DateTime.parse(json['checkOutDate']),
      hotelList: (json['hotelList'] as List)
              .map((hotel) => Hotel.fromJson(hotel))
              .toList() ??
          [],
    );
  }
}

class Hotel {
  final String hotelId;
  final String hotelName;
  final int provider;
  final double totalPrice;
  final List<RatePlan> ratePlanList;
  final HotelDetails hotelDetailsList;

  Hotel({
    required this.hotelId,
    required this.hotelName,
    required this.provider,
    required this.totalPrice,
    required this.ratePlanList,
    required this.hotelDetailsList,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      hotelId: json['hotelId'],
      hotelName: json['hotelName'],
      provider: json['provider'],
      totalPrice: json['totalPrice'].toDouble(),
      hotelDetailsList: HotelDetails.fromJson(json['hotel']),
      ratePlanList: (json['ratePlanList'] as List)
          .map((ratePlan) => RatePlan.fromJson(ratePlan))
          .toList(),
    );
  }
}

class HotelDetails {
  final String hotelId;
  final String description;
  final String imageUrl;
  final String address;
  final String countryName;
  final String telephone;
  HotelDetails({
    required this.hotelId,
    required this.description,
    required this.imageUrl,
    required this.address,
    required this.countryName,
    required this.telephone,
  });

  factory HotelDetails.fromJson(Map<String, dynamic> json) {
    return HotelDetails(
      hotelId: json['hotelId'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      address: json['address'],
      countryName: json['countryName'],
      telephone: json['telephone'],
    );
  }
}

class RatePlan {
  final double totalPrice;
  final int roomStatus;
  final String ratePlanName;
  final String ratePlanId;
  final String roomName;
  final int standardOccupancy;
  final int inventoryCount;
  final int maxOccupancy;
  final String currency;
  final BedType bedType;
  final BreakfastType breakfastType;
  final RoomOccupancy roomOccupancy;
  final List<Price> priceList;
  final List<CancellationPolicy> cancellationPolicyList;

  RatePlan({
    required this.totalPrice,
    required this.roomStatus,
    required this.ratePlanName,
    required this.ratePlanId,
    required this.roomName,
    required this.standardOccupancy,
    required this.inventoryCount,
    required this.maxOccupancy,
    required this.currency,
    required this.bedType,
    required this.breakfastType,
    required this.roomOccupancy,
    required this.priceList,
    required this.cancellationPolicyList,
  });

  factory RatePlan.fromJson(Map<String, dynamic> json) {
    return RatePlan(
      totalPrice: json['totalPrice'].toDouble(),
      roomStatus: json['roomStatus'],
      ratePlanName: json['ratePlanName'],
      ratePlanId: json['ratePlanId'],
      roomName: json['roomName'],
      standardOccupancy: json['standardOccupancy'],
      inventoryCount: json['inventoryCount'],
      maxOccupancy: json['maxOccupancy'],
      currency: json['currency'],
      bedType: BedType.fromJson(json['bedType']),
      breakfastType: BreakfastType.fromJson(json['breakfastType']),
      roomOccupancy: RoomOccupancy.fromJson(json['roomOccupancy']),
      priceList: (json['priceList'] as List)
          .map((price) => Price.fromJson(price))
          .toList(),
      cancellationPolicyList: (json['ratePlanCancellationPolicyList'] as List)
          .map((policy) => CancellationPolicy.fromJson(policy))
          .toList(),
    );
  }
}

class BedType {
  final String name;
  final int defaultOccupancy;

  BedType({
    required this.name,
    required this.defaultOccupancy,
  });

  factory BedType.fromJson(Map<String, dynamic> json) {
    return BedType(
      name: json['name'],
      defaultOccupancy: json['defaultOccupancy'],
    );
  }
}

class BreakfastType {
  final String name;

  BreakfastType({required this.name});

  factory BreakfastType.fromJson(Map<String, dynamic> json) {
    return BreakfastType(
      name: json['name'],
    );
  }
}

class RoomOccupancy {
  final int adultCount;
  final int childCount;
  final int roomNum;

  RoomOccupancy({
    required this.adultCount,
    required this.childCount,
    required this.roomNum,
  });

  factory RoomOccupancy.fromJson(Map<String, dynamic> json) {
    return RoomOccupancy(
      adultCount: json['adultCount'],
      childCount: json['childCount'],
      roomNum: json['roomNum'],
    );
  }
}

class Price {
  final DateTime stayDate;
  final double price;
  final double mealAmount;
  final MealType mealType;

  Price({
    required this.stayDate,
    required this.price,
    required this.mealAmount,
    required this.mealType,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      stayDate: DateTime.parse(json['stayDate']),
      price: json['price'].toDouble(),
      mealAmount: json['mealAmount'].toDouble(),
      mealType: MealType.fromJson(json['mealType']),
    );
  }
}

class MealType {
  final String name;

  MealType({required this.name});

  factory MealType.fromJson(Map<String, dynamic> json) {
    return MealType(
      name: json['name'],
    );
  }
}

class CancellationPolicy {
  final double amount;
  final DateTime fromDate;

  CancellationPolicy({
    required this.amount,
    required this.fromDate,
  });

  factory CancellationPolicy.fromJson(Map<String, dynamic> json) {
    return CancellationPolicy(
      amount: json['amount'].toDouble(),
      fromDate: DateTime.parse(json['fromDate']),
    );
  }
}

class Payload {
  final PriceDetails priceDetails;

  Payload({required this.priceDetails});

  factory Payload.fromJson(Map<String, dynamic> json) {
    return Payload(
      priceDetails: PriceDetails.fromJson(json['priceDetails']),
    );
  }
}

class HotelApiResponse {
  final Payload payload;
  final String status;

  // Step 1: Create a private static variable to hold the instance

  // Step 2: Make the constructor private
  HotelApiResponse({
    required this.payload,
    required this.status,
  });

  factory HotelApiResponse.fromJson(Map<String, dynamic> json) {
    return HotelApiResponse(
      payload: Payload.fromJson(json['payload']),
      status: json['status'],
    );
  }
}
