class Version {
  final String name;
  final String protocol;

  Version(
    this.name,
    this.protocol,
  );

  @override
  String toString() {
    return 'Version{name: $name, protocol: $protocol}';
  }
}
