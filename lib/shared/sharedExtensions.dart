extension getSpecificDate on DateTime {
  String getDisplayedDate() {
    String date = "";
    switch (weekday) {
      case 1:
        date += "Mon";
        break;
      case 2:
        date += "Tue";
        break;
      case 3:
        date += "Wed";
        break;
      case 4:
        date += "Thu";
        break;
      case 5:
        date += "Fri";
        break;
      case 6:
        date += "Sat";
        break;
      case 7:
        date += "Sun";
        break;
      default:
        date += "";
        break;
    }
    date += " $day ";
    List months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    date += months[month - 1];
    return date;
  }
}
