import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DirectoryService {
  final Ref ref;
  DirectoryService(this.ref);

  bool isPeruvianNumber(Phone contactPhone) =>
      contactPhone.normalizedNumber.isEmpty
          ? false
          : (contactPhone.normalizedNumber.substring(0, 4) == "+519");

  String formatNormalizedNumber(Phone contactPhone, bool spaces) {
    final formattedNumber = "${contactPhone.normalizedNumber.substring(3, 6)} "
        "${contactPhone.normalizedNumber.substring(6, 9)} "
        "${contactPhone.normalizedNumber.substring(9)}";
    return spaces ? formattedNumber : formattedNumber.replaceAll(" ", "");
  }
}

final directoryServiceProvider = Provider<DirectoryService>(
  (ref) => DirectoryService(ref),
);
