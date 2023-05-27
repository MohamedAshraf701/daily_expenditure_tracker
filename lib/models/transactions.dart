class transactions {
  final String createdAt;
  final String date;
  final List<dynamic> participants;
  final String payer;
  final dynamic payments;
  final String total;
  final String type;

  transactions(
      {required this.createdAt,
      required this.date,
      required this.participants,
      required this.payer,
      required this.payments,
      required this.total,
      required this.type});
}
