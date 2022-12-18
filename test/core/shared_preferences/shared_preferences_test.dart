import 'package:baker_soft_shop/core/shared_preferences/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/src/mock.dart';
import 'package:mockito/annotations.dart';
import 'shared_preferences_test.mocks.dart';

@GenerateMocks([SharedPreferencesAbstract])
void main() {
  late MockSharedPreferencesAbstract sharedPreferencesAbstractMock;

  setUp(() {
    sharedPreferencesAbstractMock = MockSharedPreferencesAbstract();
  });

  group('Shared preferences simple test', () {
    test('Save in Shared preferences test', () async {
      //set-up
      when(sharedPreferencesAbstractMock.setString('test', 'randomKey'))
          .thenAnswer((_) async => true);
      await sharedPreferencesAbstractMock.setString('test', 'randomKey');
      //verify
      verify(sharedPreferencesAbstractMock.setString('test', 'randomKey'));
    });
    test('Get data from Shared preferences test', () async {
      //set-up
      when(sharedPreferencesAbstractMock.getString('test'))
          .thenAnswer((_) => 'randomKey');
      //act
      sharedPreferencesAbstractMock.getString('test');
      //verify
      verify(sharedPreferencesAbstractMock.getString('test'));
    });
  });
}
