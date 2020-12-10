class MediaImagePath {
  String _value;

  MediaImagePath(String value) {
    this._value = value;
  }

  String get value => this._value;
  String get valueWithHttp => 'https://image.tmdb.org/t/p/w500${this._value}';
}
