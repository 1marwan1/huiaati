// ignore: constant_identifier_names
enum TypeImageInMarker { ME_LOCATION, CUSTOMER_LOCATION, PERSON_PROVIEL }

extension TypeImageInMarkerX on TypeImageInMarker {
  String value() {
    switch (this) {
      case TypeImageInMarker.ME_LOCATION:
        return "assets/icons/me.png";
      case TypeImageInMarker.CUSTOMER_LOCATION:
        return "assets/icons/customer.png";
      case TypeImageInMarker.PERSON_PROVIEL:
        return "assets/icons/prson.png";
    }
  }
}
