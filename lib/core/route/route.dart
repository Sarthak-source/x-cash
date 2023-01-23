import 'package:get/get.dart';
import 'package:xcash_app/view/components/bottom-nav-bar/bottom_nav_bar.dart';
import 'package:xcash_app/view/screens/Profile/profile_screen.dart';
import 'package:xcash_app/view/screens/account/change-password/change_password_screen.dart';
import 'package:xcash_app/view/screens/add-money/add_money_details/add_money_screen.dart';
import 'package:xcash_app/view/screens/add-money/add_money_details/add_money_web_view.dart';
import 'package:xcash_app/view/screens/add-money/add_money_history/add_money_history_screen.dart';
import 'package:xcash_app/view/screens/auth/email_verification_page/email_verification_screen.dart';
import 'package:xcash_app/view/screens/auth/forget_password/forget_password/forget_password.dart';
import 'package:xcash_app/view/screens/auth/forget_password/reset_password/reset_password_screen.dart';
import 'package:xcash_app/view/screens/auth/forget_password/verify_forget_password/verify_forget_password_screen.dart';
import 'package:xcash_app/view/screens/auth/kyc/kyc.dart';
import 'package:xcash_app/view/screens/auth/login/login_screen.dart';
import 'package:xcash_app/view/screens/auth/profile_complete/profile_complete_screen.dart';
import 'package:xcash_app/view/screens/auth/registration/registration_screen.dart';
import 'package:xcash_app/view/screens/auth/sms_verification_page/sms_verification_screen.dart';
import 'package:xcash_app/view/screens/auth/two_factor_screen/two_factor_verification_screen.dart';
import 'package:xcash_app/view/screens/edit_profile/edit_profile_screen.dart';
import 'package:xcash_app/view/screens/exchange/exchange_money_screen.dart';
import 'package:xcash_app/view/screens/invoice/create_invoice/create_invoice_screen.dart';
import 'package:xcash_app/view/screens/invoice/my_invoice/my_invoice_screen.dart';
import 'package:xcash_app/view/screens/money_discharge/make_payment/make_payment.dart';
import 'package:xcash_app/view/screens/money_discharge/make_payment/otp_screen.dart';
import 'package:xcash_app/view/screens/money_discharge/money_out/money_out.dart';
import 'package:xcash_app/view/screens/notification/notification_screen.dart';
import 'package:xcash_app/view/screens/request-money/request_money/request_money.dart';
import 'package:xcash_app/view/screens/request-money/request_to_me/request_to_me_screen.dart';
import 'package:xcash_app/view/screens/splash/splash_screen.dart';
import 'package:xcash_app/view/screens/terms-services/terms_services_screen.dart';
import 'package:xcash_app/view/screens/transaction/transaction_history_screen.dart';
import 'package:xcash_app/view/screens/transfer/transfer_money.dart';
import 'package:xcash_app/view/screens/voucher/create_voucher/create_voucher.dart';
import 'package:xcash_app/view/screens/voucher/my_voucher/my_voucher_screen.dart';
import 'package:xcash_app/view/screens/voucher/redeem_log/redeem_log_screen.dart';
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
  static const String otpScreen = "/otp_screen";
  static const String bottomNavBar = "/bottom_nav_bar";
  static const String myWalletScreen = "/my_wallet_screen";

  static const String addMoneyHistoryScreen = "/add_money_history_screen";
  static const String addMoneyScreen = "/add_money_screen";
  static const String addMoneyWebScreen = "/add_money_web_screen";

  static const String profileCompleteScreen = "/profile_complete_screen";

  static const String emailVerificationScreen ='/verify_email_screen' ;
  static const String smsVerificationScreen = '/verify_sms_screen';
  static const String verifyPassCodeScreen = '/verify_pass_code_screen' ;
  static const String twoFactorScreen = "/two-factor-screen";
  static const String resetPasswordScreen = '/reset_pass_screen' ;

  static const String myInvoiceScreen = "/my_invoice_screen";
  static const String createInvoiceScreen = "/create_invoice_screen";
  static const String transactionHistoryScreen = "/transaction_history_screen";

  static const String myVoucherScreen = "/my_voucher_screen";
  static const String requestToMeScreen = "/request_to_me_screen";

  static const String withdrawMoneyScreen = "/withdraw_money_screen";
  static const String withdrawHistoryScreen = "/withdraw_history_screen";

  static const String notificationScreen = "/notification_screen";
  static const String profileScreen = "/profile_screen";
  static const String editProfileScreen = "/edit_profile_screen";
  static const String termsServiceScreen = "/terms_services_screen";
  static const String kycScreen = "/kyc_screen";

  static const String exchangeMoneyScreen = "/exchange_money_screen";

  static const String requestMoneyScreen = "/request_money_screen";

  static const String makePaymentScreen = "/make_payment_screen";
  static const String moneyOutScreen = "/money_out_screen";

  static const String transferMoneyScreen = "/transfer_money_screen";

  static const String createVoucherScreen = "/create_voucher_screen";
  static const String redeemLogScreen = "/redeem_log_screen";


  List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: forgotPasswordScreen, page: () => const ForgetPasswordScreen()),
    GetPage(name: changePasswordScreen, page: () => const ChangePasswordScreen()),
    GetPage(name: registrationScreen, page: () => const RegistrationScreen()),
    GetPage(name: profileCompleteScreen, page: () => const ProfileCompleteScreen()),
    GetPage(name: bottomNavBar, page: () => const BottomNavBar()),
    GetPage(name: myWalletScreen, page: () => const MyWalletScreen()),

    GetPage(name: addMoneyHistoryScreen, page: () => const AddMoneyHistoryScreen()),
    GetPage(name: addMoneyScreen, page: () => const AddMoneyScreen()),
    GetPage(name: addMoneyWebScreen, page: () => AddMoneyWebView(redirectUrl: Get.arguments)),

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
    GetPage(name: requestToMeScreen, page: () => const RequestToMeScreen()),

    GetPage(name: exchangeMoneyScreen, page: () => const ExchangeMoneyScreen()),
    // GetPage(name: kycScreen, page: () => const KycScreen()),

    GetPage(name: emailVerificationScreen, page: () =>  EmailVerificationScreen(needSmsVerification: Get.arguments[0],isProfileCompleteEnabled: Get.arguments[1],needTwoFactor: Get.arguments[2],)),
    GetPage(name: smsVerificationScreen, page: () =>  const SmsVerificationScreen()),
    GetPage(name: verifyPassCodeScreen, page: () =>  const VerifyForgetPassScreen()),
    GetPage(name: resetPasswordScreen, page: () =>  const ResetPasswordScreen()),
    GetPage(name: twoFactorScreen, page: () =>  TwoFactorVerificationScreen(isProfileCompleteEnable: Get.arguments)),

    GetPage(name: otpScreen, page: () =>  OtpScreen(actionId:Get.arguments[0] ,nextRoute: Get.arguments[1],)),

    GetPage(name: requestMoneyScreen, page: () =>  const RequestMoneyScreen()),

    GetPage(name: makePaymentScreen, page: () =>  const MakePaymentScreen()),
    GetPage(name: moneyOutScreen, page: () =>  const MoneyOutScreen()),

    GetPage(name: transferMoneyScreen, page: () =>  const TransferMoney()),
    GetPage(name: kycScreen, page: () => const KycScreen()),

    GetPage(name: createVoucherScreen, page: () => const CreateVoucherScreen()),
    GetPage(name: redeemLogScreen, page: () => const RedeemLogScreen()),
  ];
}