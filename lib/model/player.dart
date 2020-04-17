class Player {
  final String name;
  final String id;

  Player.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.id = json['id'];

  @override
  String toString() {
    return 'Player{name: $name, id: $id}';
  }
}
