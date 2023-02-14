class UrlContainer{

  static const String domainUrl = 'https://sohan.thesoftking.com/xcash/v4';
  //static const String domainUrl = 'http://192.168.30.135/php_8/lab/xCash';
  static const String baseUrl = '$domainUrl/api/';


  static const String registrationEndPoint='register';
  static const String loginEndPoint='login';
  static const String logoutUrl='logout';
  static const String userDashboardEndPoint='user/home';
  static const String userLogoutEndPoint='logout';
  static const String forgetPasswordEndPoint='password/email';
  static const String passwordVerifyEndPoint='password/verify-code';
  static const String resetPasswordEndPoint='password/reset';
  static const String referralEndPoint = "my-referrals";
  static const String verify2FAUrl = 'verify-g2fa';

  static const String otpVerify = 'otp-verify';
  static const String otpResend = 'otp-resend';



  static const String verifyEmailEndPoint='verify-email';
  static const String verifySmsEndPoint='verify-mobile';
  static const String resendVerifyCodeEndPoint='resend-verify/';

  static const String authorizationCodeEndPoint='authorization';


  static const String dashBoardUrl = 'dashboard';
  static const String depositHistoryUrl = 'deposit/history';
  static const String depositMethodUrl = 'deposit/methods';
  static const String depositInsertUrl = 'deposit/insert';
  static const String transactionEndpoint = 'transactions';


  //withdraw
  static const String withdrawHistoryUrl='withdraw/history';
  static const String withdrawMoneyUrl='withdraw/methods';
  static const String submitWithdrawMoneyUrl='withdraw/money';
  static const String withdrawPreviewUrl='withdraw/preview';
  static const String withdrawMoneySubmitUrl='withdraw/money/submit';
  static const String addWithdrawMethodUrl='withdraw/add-method';
  static const String withdrawMethodUrl='withdraw/methods';
  static const String withdrawMethodEdit='withdraw/edit-method';
  static const String withdrawMethodUpdate='withdraw/method/update';


  static const String planEndPoint = "invest/plans";



  //kyc
  static const String kycFormUrl='kyc-form';
  static const String kycSubmitUrl='kyc-submit';


  static const String generalSettingEndPoint='general-setting';

  //plan
  static const String investUrl = 'invest';
  static const String investStoreUrl = 'invest/store';

  //privacy policy
  static const String privacyPolicyEndPoint='policy-pages';

  //profile
  static const String getProfileEndPoint='user-info';
  static const String updateProfileEndPoint='profile-setting';
  static const String profileCompleteEndPoint='user-data-submit';


  //change password
  static const String changePasswordEndPoint='change-password';
  static const String countryEndPoint='get-countries';

  static const String deviceTokenEndPoint     = 'save/device/token';
  static const String languageUrl             = 'language/';
  static const String balanceTransfer         = 'balance-transfer';


  // make payment
  static const String makePaymentCheckMerchantUrl = "merchant/exist";
  static const String makePaymentUrl = "make-payment";
  static const String makePaymentVerifyOtpUrl = "make-payment";

  // add money
  static const String addMoneyHistoryEndPoint = "deposit/history";
  static const String addMoneyMethodEndPoint = "deposit/methods";
  static const String addMoneyInsertEndPoint = "deposit/insert";

  // money out
  static const String moneyOutUrl = "money-out";
  static const String submitMoneyOutUrl = "money-out";

  // request money
  static const String requestMoneyEndPoint = "request/money";
  static const String requestMoneySubmitEndPoint = "request/money";
  static const String requestToMeEndPoint = "requests";
  static const String myRequestHistoryEndPoint = "my/requested/history";
  static const String requestRejectUrl = "accept/reject";
  static const String requestAcceptUrl = "accept/request";

  // exchange money
  static const String exchangeMoneyEndPoint = "exchange/money";
  static const String confirmExchangeMoneyEndPoint = "exchange/money";

  static const String transferMoneyEndPoint = "transfer/money";
  static const String transferMoneySubmitEndPoint = "transfer/money";

  static const String walletsEndPoint = "wallets";

  // voucher
  static const String voucherListEndPoint = "voucher/list";
  static const String createVoucherEndPoint = "create/voucher";
  static const String redeemLogEndPoint = "voucher/redeem/log";
  static const String voucherRedeemEndPoint = "voucher/redeem";

  // invoice
  static const String allInvoiceUrl = "invoice/all";
  static const String invoiceCreateUrl = "invoice/create";
  static const String invoiceEditUrl = "invoice/edit";
  static const String invoiceUpdateUrl = "invoice/update";
  static const String invoiceSendEmailUrl = "invoice/send-to-mail/";
  static const String invoicePublishUrl = "invoice/publish/";
  static const String invoiceDiscardUrl = "invoice/discard/";

  static const String checkAgentUrl = "agent/exist";
  static const String checkMerchantUrl = "merchant/exist";
}