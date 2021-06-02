import 'dart:convert';

class BalancesModel {
  final Balances balances;
  BalancesModel({
    required this.balances,
  });

  BalancesModel copyWith({
    Balances? balances,
  }) {
    return BalancesModel(
      balances: balances ?? this.balances,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'balances': balances.toMap(),
    };
  }

  factory BalancesModel.fromMap(Map<String, dynamic> map) {
    return BalancesModel(
      balances: Balances.fromMap(map['balances']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BalancesModel.fromJson(String source) =>
      BalancesModel.fromMap(json.decode(source));

  @override
  String toString() => 'BalancesModel(balances: $balances)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BalancesModel && other.balances == balances;
  }

  @override
  int get hashCode => balances.hashCode;
}

class Balances {
  final User0 user0;
  final User1 user1;
  Balances({
    required this.user0,
    required this.user1,
  });

  Balances copyWith({
    User0? user0,
    User1? user1,
  }) {
    return Balances(
      user0: user0 ?? this.user0,
      user1: user1 ?? this.user1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user0': user0.toMap(),
      'user1': user1.toMap(),
    };
  }

  factory Balances.fromMap(Map<String, dynamic> map) {
    return Balances(
      user0: User0.fromMap(map['user0']),
      user1: User1.fromMap(map['user1']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Balances.fromJson(String source) =>
      Balances.fromMap(json.decode(source));

  @override
  String toString() => 'Balances(user0: $user0, user1: $user1)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Balances && other.user0 == user0 && other.user1 == user1;
  }

  @override
  int get hashCode => user0.hashCode ^ user1.hashCode;
}

class User0 {
  final int homeBalance;
  final int paymentBalance;
  User0({
    required this.homeBalance,
    required this.paymentBalance,
  });

  User0 copyWith({
    int? homeBalance,
    int? paymentBalance,
  }) {
    return User0(
      homeBalance: homeBalance ?? this.homeBalance,
      paymentBalance: paymentBalance ?? this.paymentBalance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'homeBalance': homeBalance,
      'paymentBalance': paymentBalance,
    };
  }

  factory User0.fromMap(Map<String, dynamic> map) {
    return User0(
      homeBalance: map['homeBalance']?.toInt(),
      paymentBalance: map['paymentBalance']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory User0.fromJson(String source) => User0.fromMap(json.decode(source));

  @override
  String toString() =>
      'User0(homeBalance: $homeBalance, paymentBalance: $paymentBalance)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User0 &&
        other.homeBalance == homeBalance &&
        other.paymentBalance == paymentBalance;
  }

  @override
  int get hashCode => homeBalance.hashCode ^ paymentBalance.hashCode;
}

class User1 {
  final int homeBalance;
  final int paymentBalance;
  User1({
    required this.homeBalance,
    required this.paymentBalance,
  });

  User1 copyWith({
    int? homeBalance,
    int? paymentBalance,
  }) {
    return User1(
      homeBalance: homeBalance ?? this.homeBalance,
      paymentBalance: paymentBalance ?? this.paymentBalance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'homeBalance': homeBalance,
      'paymentBalance': paymentBalance,
    };
  }

  factory User1.fromMap(Map<String, dynamic> map) {
    return User1(
      homeBalance: map['homeBalance']?.toInt(),
      paymentBalance: map['paymentBalance']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory User1.fromJson(String source) => User1.fromMap(json.decode(source));

  @override
  String toString() =>
      'User1(homeBalance: $homeBalance, paymentBalance: $paymentBalance)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User1 &&
        other.homeBalance == homeBalance &&
        other.paymentBalance == paymentBalance;
  }

  @override
  int get hashCode => homeBalance.hashCode ^ paymentBalance.hashCode;
}
