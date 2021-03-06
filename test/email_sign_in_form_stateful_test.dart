import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:timetrackerfluttercourse/app/services/auth.dart';
import 'package:timetrackerfluttercourse/app/sign_in/email_sign_in_form_stateful.dart';

class MockAuth extends Mock implements AuthBase {}

void main() {

  MockAuth mockAuth;

  setUp(() {
    mockAuth = MockAuth();
  });

  Future<void> pumpEmailSignInForm(WidgetTester tester) async {
    await tester.pumpWidget(
        Provider<AuthBase>(
          create: (_) => mockAuth,
          child: MaterialApp(
              home: Scaffold(body: EmailSignInFormStateful()),
          ),
        ),
    );
  }

  testWidgets('When user does not enter email '
              'and password and taps on sign-in button, '
              'then signInWithEmailAndPassword is not called',
          (WidgetTester tester) async {
    await pumpEmailSignInForm(tester);
    
    final signInButton = find.text('Sign in');
    await tester.tap(signInButton);
    
    verifyNever(mockAuth.signInWithEmailAndPassword(any, any));
  });
}