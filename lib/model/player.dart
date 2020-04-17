/// Minecraft Player
class Player {
  /// Player's name
  final String name;
  /// PLayers UUID, e.g. d22caef6-e313-499e-95bc-456598bf1401
  final String id;

  Player.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.id = json['id'];

  @override
  String toString() {
    return 'Player{name: $name, id: $id}';
  }
}
