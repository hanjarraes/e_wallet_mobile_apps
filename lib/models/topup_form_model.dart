class TopUpFormModel {
  final String? amount;
  final String? pin;
  final String? paymentMethodCode;

  TopUpFormModel({
    this.amount,
    this.pin,
    this.paymentMethodCode,
  });

  TopUpFormModel copyWith({
    String? amount,
    String? pin,
    String? paymentMethodCode,
  }) =>
      TopUpFormModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
      );

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'pin': pin,
    'payment_method_code': paymentMethodCode,
  };
}
