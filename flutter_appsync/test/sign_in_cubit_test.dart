import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter_appsync/amplifyconfiguration.dart';
import 'package:flutter_appsync/business/log_in_cubit/log_in_cubit.dart';
import 'package:flutter_appsync/data/sign_in_dl/auth_repository.dart';
import 'package:flutter_appsync/models/ModelProvider.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockSignInRepository extends Mock implements AuthRepository {}

//We will test the SignIn functionality in three different ways

//class to test the sign in cubits
void main() {
  MockSignInRepository mockSignInRepository;

//  AmplifyAPI aamplifyAPI = AmplifyAPI();
  AmplifyAuthCognito aamplifyAuthCognito = AmplifyAuthCognito();
  // AmplifyDataStore aamplifyDataStore =
  //     AmplifyDataStore(modelProvider: ModelProvider.instance);
  // AmplifyStorageS3 aamplifyStorageS3 = AmplifyStorageS3();

  //quick amplify setup method
  Future<void> aamplifyConfig() async {
    try {
      // add Amplify plugins
      await Amplify.addPlugins([
        //      aamplifyAPI,
        aamplifyAuthCognito,
        //      aamplifyStorageS3,
        //      aamplifyDataStore
      ]);

      // configure Amplify
      //
      // note that Amplify cannot be configured more than once!
      await Amplify.configure(amplifyconfig);
      print("~~~~ Amplify Init Successful");
    } catch (e) {
      // error handling can be improved for sure!
      // but this will be sufficient for the purposes of this tutorial
      print('An error occurred while configuring Amplify: $e');
    }
  }

  //pre-test setup
  setUp(() async {
    mockSignInRepository = MockSignInRepository();

    return await aamplifyConfig();
  });

  //good practice to group tests in categories
  //Old way of testing blocs
  group('Sign In the old way', () {
    final username = 'levcguzman77@gmail.com';
    final password = 'my_secure_password';

    final SignInResult res = SignInResult(isSignedIn: false);

    test('Vanilla Sign In', () {
      when(mockSignInRepository.attemptSignIn(username, password))
          .thenAnswer((realInvocation) async => res);

      final signInBloc = LoginCubit();

      signInBloc.attemptLogin(username, password);

      List<LoginState> failedLogin = [
        LoginInitial(),
        LoginLoading(),
        LoginError()
      ];

      expectLater(signInBloc.stream, emitsInOrder(failedLogin));
    });
  });

  //2nd way of testing: introducing bloc_test

  //test('Sign in test, the newer way')
}
