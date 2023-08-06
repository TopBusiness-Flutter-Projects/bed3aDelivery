class DepositedModel {
  int? totalSize;
  String? limit;
  String? offset;
  List<Deposit>? deposit;

  DepositedModel({this.totalSize, this.limit, this.offset, this.deposit});

  DepositedModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['deposit'] != null) {
      deposit = <Deposit>[];
      json['deposit'].forEach((v) {
        deposit!.add(Deposit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_size'] = totalSize;
    data['limit'] = limit;
    data['offset'] = offset;
    if (deposit != null) {
      data['deposit'] = deposit!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Deposit {
  int? id;
  int? bed3aDeliveryId;
  int? userId;
  String? userType;
  double? credit;
  String? transactionType;
  String? createdAt;
  String? updatedAt;

  Deposit(
      {this.id,
        this.bed3aDeliveryId,
        this.userId,
        this.userType,
        this.credit,
        this.transactionType,
        this.createdAt,
        this.updatedAt});

  Deposit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bed3aDeliveryId = json['delivery_man_id'];
    userId = json['user_id'];
    userType = json['user_type'];
    credit = json['credit'].toDouble();
    transactionType = json['transaction_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['delivery_man_id'] = bed3aDeliveryId;
    data['user_id'] = userId;
    data['user_type'] = userType;
    data['credit'] = credit;
    data['transaction_type'] = transactionType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
