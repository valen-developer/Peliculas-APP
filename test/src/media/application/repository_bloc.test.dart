import 'package:flutter_test/flutter_test.dart';

import 'package:peliculasApp/src/media/application/mediaFavorites.bloc.dart';

import '../infrastructure/repositories/fakeRepository.dart';

void main() {
  test('shoud return false if save a null media', () async {
    FakeRepository fakeRepository = new FakeRepository();

    MediaFavoritesBloc mediaFavoritesBloc =
        new MediaFavoritesBloc(fakeRepository);

    bool resp = await mediaFavoritesBloc.save(null);

    expect(resp, false);
  });
}
