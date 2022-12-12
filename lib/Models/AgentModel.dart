class AgentModel {
  int? id;
  String name;
  String password;
  bool isAdmin;

  AgentModel(
      {this.id,
        required this.name,
        required this.password,
        this.isAdmin = false});
}