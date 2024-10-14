import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  const HotelCard(
      {super.key,
      required this.hotelName,
      required this.location,
      required this.image,
      required this.pricePerNight,
      required this.currency,
      required this.mealTypeName,
      required this.checkInDate,
      required this.checkOutDate,
      required this.roomName,
      required this.price,
      required this.onPressed});

  final String hotelName;
  final String location;
  final String pricePerNight;
  final String price;
  final String currency;
  final String checkInDate;
  final String checkOutDate;
  final String mealTypeName;
  final String roomName;
  final String image;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.17,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              image,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                Text(
                  location,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                Text(
                  mealTypeName,
                  style: const TextStyle(color: Colors.blue, fontSize: 12),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                Text(
                  roomName,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                Text(
                  "$checkInDate / $checkOutDate",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Row(
                  children: [
                    Text(
                      '$pricePerNight $currency per night',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  '$price $currency Total Price',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('See Details',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Add To List',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
