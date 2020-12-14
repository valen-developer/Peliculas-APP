class MediaImagePath {
  String _value;

  MediaImagePath(String value) {
    this._value = value;
  }

  String get value => this._value;
  String get valueWithHttp => (this.value != null)
      ? 'https://image.tmdb.org/t/p/w500${this._value}'
      : 'https://library.ucf.edu/wp-content/uploads/sites/5/2015/08/photo-not-available.jpg';
}
