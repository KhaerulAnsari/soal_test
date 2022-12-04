class EmployeeModel {
  String? name;
  String? job;
  String? id;
  String? createdAt;

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'job': job,
      'id': id,
      'createdAt': createdAt,
    };
  }
}
