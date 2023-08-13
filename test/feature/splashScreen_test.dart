// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/splashScreen_the_user_opens_the_application.dart';
import './step/splashScreen_the_splash_screen_is_displayed.dart';
import './step/splashScreen_the_user_should_see_the_logo_image.dart';
import './step/splashScreen_the_user_should_see_a_loading_indicator.dart';
import './step/splashScreen_the_user_is_logged_in_as_admin_with_email_admingmailcom.dart';
import './step/splashScreen_the_user_should_be_redirected_to_the_admin_dashboard.dart';
import './step/splashScreen_the_user_is_logged_in_as_a_student_with_email_other_than_admingmailcom.dart';
import './step/splashScreen_the_user_should_be_redirected_to_the_student_dashboard.dart';
import './step/splashScreen_the_user_is_not_logged_in.dart';
import './step/splashScreen_the_user_should_be_redirected_to_the_onboarding_screen.dart';

void main() {
  group('''User Authentication on Splash Screen''', () {
    testWidgets('''User sees the logo and loading indicator on the splash screen''', (tester) async {
      await theUserOpensTheApplication(tester);
      await theSplashScreenIsDisplayed(tester);
      await theUserShouldSeeTheLogoImage(tester);
      await theUserShouldSeeALoadingIndicator(tester);
    });
    testWidgets('''User is redirected to the admin dashboard if logged in as admin''', (tester) async {
      await theUserOpensTheApplication(tester);
      await theUserIsLoggedInAsAdminWithEmailAdmingmailcom(tester);
      await theSplashScreenIsDisplayed(tester);
      await theUserShouldBeRedirectedToTheAdminDashboard(tester);
    });
    testWidgets('''User is redirected to the student dashboard if logged in as a student''', (tester) async {
      await theUserOpensTheApplication(tester);
      await theUserIsLoggedInAsAStudentWithEmailOtherThanAdmingmailcom(tester);
      await theSplashScreenIsDisplayed(tester);
      await theUserShouldBeRedirectedToTheStudentDashboard(tester);
    });
    testWidgets('''User is redirected to the onboarding screen if not logged in''', (tester) async {
      await theUserOpensTheApplication(tester);
      await theUserIsNotLoggedIn(tester);
      await theSplashScreenIsDisplayed(tester);
      await theUserShouldBeRedirectedToTheOnboardingScreen(tester);
    });
  });
}
