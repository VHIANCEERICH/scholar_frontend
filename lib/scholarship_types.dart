class ScholarshipTypes {
  static const Map<String, String> giftTypeOptions = {
    'Kingdom of Jesus Christ (KOJC Member)': 'ip_member',
  };

  static final Map<String, String> giftTypeLabelsByValue = Map.fromEntries(
    giftTypeOptions.entries.map((entry) => MapEntry(entry.value, entry.key)),
  );

  static const List<String> giftTypeLabels = [
    'Kingdom of Jesus Christ (KOJC Member)',
  ];

  static String giftTypeLabel(dynamic raw) {
    final value = (raw ?? '').toString().trim().toLowerCase();
    if (value.isEmpty) return '';
    if (giftTypeLabelsByValue.containsKey(value)) {
      return giftTypeLabelsByValue[value]!;
    }
    if (value.contains('ip') ||
        value.contains('kojc') ||
        value.contains('kingdom of jesus christ')) {
      return 'Kingdom of Jesus Christ (KOJC Member)';
    }
    return '';
  }

  static String giftTypePayload(String label) {
    final value = label.toLowerCase().trim();
    if (value.contains('pamulingan') ||
        value.contains('ip member') ||
        value.contains('kojc') ||
        value.contains('kingdom of jesus christ') ||
        value == 'ip') {
      return 'ip_member';
    }
    return '';
  }

  static String normalizedGiftType(dynamic raw) {
    final value = (raw ?? '').toString().trim().toLowerCase();
    if (value.isEmpty) return '';
    if (value.contains('pamulingan') ||
        value.contains('ip_member') ||
        value.contains('ip member') ||
        value.contains('kojc') ||
        value.contains('kingdom of jesus christ') ||
        value == 'ip') {
      return 'ip_member';
    }
    return '';
  }
}
