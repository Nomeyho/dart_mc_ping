class Version {
  final String name;
  final int protocol;

  Version.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.protocol = json['protocol'];

  @override
  String toString() {
    return 'Version{name: $name, protocol: $protocol}';
  }
}
