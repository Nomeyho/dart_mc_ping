/// Minecraft server version
class Version {
  /// Version name
  final String name;

  /// Protocol version
  final int protocol;

  Version.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.protocol = json['protocol'];

  @override
  String toString() {
    return 'Version{name: $name, protocol: $protocol}';
  }
}
