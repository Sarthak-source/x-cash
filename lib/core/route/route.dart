import 'package:get/get.dart';
import 'package:xcash_app/view/components/bottom-nav-bar/bottom_nav_bar.dart';
import 'package:xcash_app/view/screens/Profile/profile_screen.dart';
import 'package:xcash_app/view/screens/add-money/add_money_history/add_money_history_screen.dart';
import 'package:xcash_app/view/screens/auth/change_password/change_password_screen.dart';
import 'package:xcash_app/view/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:xcash_app/view/screens/auth/login/login_screen.dart';
import 'package:xcash_app/view/screens/auth/registration/registration_screen.dart';
import 'package:xcash_app/view/screens/edit_profile/edit_profile_screen.dart';
import 'package:xcash_app/view/screens/invoice/create_invoice/create_invoice_screen.dart';
import 'package:xcash_app/view/screens/invoice/my_invoice/my_invoice_screen.dart';
import 'package:xcash_app/view/screens/notification/notification_screen.dart';
import 'package:xcash_app/view/screens/onboard/onboard_screen.dart';
import 'package:xcash_app/view/screens/splash/splash_screen.dart';
import 'package:xcash_app/view/screens/terms-services/terms_services_screen.dart';
import 'package:xcash_app/view/screens/transaction/transaction_history_screen.dart';
import 'package:xcash_app/view/screens/voucher/my_voucher/my_voucher_screen.dart';
import 'package:xcash_app/view/screens/wallet/my_wallet_screen.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_history/withdraw_history_screen.dart';
import 'package:xcash_app/view/screens/withdrawals/withdraw_money/withdraw_money_screen.dart';

class RouteHelper{

  static const String splashScreen = "/splash_screen";
  static const String onboardScreen = "/onboard_screen";
  static const String loginScreen = "/login_screen";
  static const String forgotPasswordScreen = "/forgot_password_screen";
  static const String changePasswordScreen = "/change_password_screen";
  static const String registrationScreen = "/registration_screen";
  static const String bottomNavBar = "/bottom_nav_bar";
  static const String myWalletScreen = "/my_wallet_screen";
  static const String addMoneyHistoryScreen = "/add_money_history_screen";

  static const String myInvoiceScreen = "/my_invoice_screen";
  static const String createInvoiceScreen = "/create_invoice_screen";
  static const String transactionHistoryScreen = "/transaction_history_screen";

  static const String myVoucherScreen = "/my_voucher_screen";

  static const String withdrawMoneyScreen = "/withdraw_money_screen";
  static const String withdrawHistoryScreen = "/withdraw_history_screen";

  static const String notificationScreen = "/notification_screen";
  static const String profileScreen = "/profile_screen";
  static const String editProfileScreen = "/edit_profile_screen";
  static const String termsServiceScreen = "/terms_services_screen";

  List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboardScreen, page: () => const OnboardScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
    GetPage(name: changePasswordScreen, page: () => const ChangePasswordScreen()),
    GetPage(name: registrationScreen, page: () => const RegistrationScreen()),
    GetPage(name: bottomNavBar, page: () => const BottomNavBar()),
    GetPage(name: myWalletScreen, page: () => const MyWalletScreen()),
    GetPage(name: addMoneyHistoryScreen, page: () => const AddMoneyHistoryScreen()),
    GetPage(name: myInvoiceScreen, page: () => const MyInvoiceScreen()),
    GetPage(name: createInvoiceScreen, page: () => const CreateInvoiceScreen()),
    GetPage(name: myVoucherScreen, page: () => const MyVoucherScreen()),
    GetPage(name: withdrawMoneyScreen, page: () => const WithdrawMoneyScreen()),
    GetPage(name: withdrawHistoryScreen, page: () => const WithdrawHistoryScreen()),
    GetPage(name: notificationScreen, page: () => const NotificationScreen()),
    GetPage(name: profileScreen, page: () => const ProfileScreen()),
    GetPage(name: editProfileScreen, page: () => const EditProfileScreen()),
    GetPage(name: termsServiceScreen, page: () => const TermsServicesScreen()),
    GetPage(name: transactionHistoryScreen, page: () => const TransactionHistoryScreen()),
  ];
}