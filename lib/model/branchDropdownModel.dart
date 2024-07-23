class BranchDropdownModel {
  int? branchID;
  String? branchName;
  String? branchCode;

  BranchDropdownModel({this.branchID, this.branchName, this.branchCode});

  BranchDropdownModel.fromJson(Map<String, dynamic> json) {
    branchID = json['BranchID'];
    branchName = json['BranchName'];
    branchCode = json['BranchCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BranchID'] = this.branchID;
    data['BranchName'] = this.branchName;
    data['BranchCode'] = this.branchCode;
    return data;
  }
}