class Player {
  final String name;
  final String id;

  Player(
    this.name,
    this.id,
  );

  @override
  String toString() {
    return 'Player{name: $name, id: $id}';
  }
}
