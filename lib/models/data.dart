import 'dart:convert';

class Data {
  final String email;
  final String income;
  final String expenditure;
  final String time;
  final String risk;
  final String regime;
  final double bills;
  final double recharges;

  Data({
    required this.email,
    required this.income,
    required this.expenditure,
    required this.time,
    required this.risk,
    required this.regime,
    required this.bills,
    required this.recharges,
  });

  Data copyWith({
    String? email,
    String? income,
    String? expenditure,
    String? time,
    String? risk,
    String? regime,
    double? bills,
    double? recharges,
  }) {
    return Data(
      email: email ?? this.email,
      income: income ?? this.income,
      expenditure: expenditure ?? this.expenditure,
      time: time ?? this.time,
      risk: risk ?? this.risk,
      regime: regime ?? this.regime,
      bills: bills ?? this.bills,
      recharges: recharges ?? this.recharges,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'email': email});
    result.addAll({'income': income});
    result.addAll({'expenditure': expenditure});
    result.addAll({'time': time});
    result.addAll({'risk': risk});
    result.addAll({'regime': regime});
    result.addAll({'bills': bills});
    result.addAll({'recharges': recharges});
  
    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      email: map['email'] ?? '',
      income: map['income'] ?? '',
      expenditure: map['expenditure'] ?? '',
      time: map['time'] ?? '',
      risk: map['risk'] ?? '',
      regime: map['regime'] ?? '',
      bills: map['bills']?.toDouble() ?? 0.0,
      recharges: map['recharges']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(email: $email, income: $income, expenditure: $expenditure, time: $time, risk: $risk, regime: $regime, bills: $bills, recharges: $recharges)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Data &&
      other.email == email &&
      other.income == income &&
      other.expenditure == expenditure &&
      other.time == time &&
      other.risk == risk &&
      other.regime == regime &&
      other.bills == bills &&
      other.recharges == recharges;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      income.hashCode ^
      expenditure.hashCode ^
      time.hashCode ^
      risk.hashCode ^
      regime.hashCode ^
      bills.hashCode ^
      recharges.hashCode;
  }
}
