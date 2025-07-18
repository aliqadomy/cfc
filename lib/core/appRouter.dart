import 'package:cfc_main/domain/model/wallet/finicialStatmentModel.dart';
import 'package:cfc_main/infrastructure/data_soruce/auth/otpProvider.dart';
import 'package:cfc_main/infrastructure/data_soruce/my_wallet/myWalletProvider.dart';
import 'package:cfc_main/infrastructure/data_soruce/opportuinity/OpportunityDataProvider.dart';
import 'package:cfc_main/infrastructure/data_soruce/visitor/visitorProvider.dart';
import 'package:cfc_main/infrastructure/repository/my_wallet_repo/my_wallet_repo.dart';
import 'package:cfc_main/infrastructure/repository/opportunityRepo/opportunityRepo.dart';
import 'package:cfc_main/infrastructure/repository/otpRepo.dart';
import 'package:cfc_main/infrastructure/repository/visitorRepo.dart';
import 'package:cfc_main/presintation/auth/change_password_otp/change_password_otp_bloc.dart';
import 'package:cfc_main/presintation/auth/verfiy_otp/verfiy_otp_bloc.dart';
import 'package:cfc_main/presintation/home/wallet/balanceBloc/balance_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../infrastructure/data_soruce/auth/LoginAuthProvider.dart';
import '../infrastructure/data_soruce/auth/RegestrationProvider.dart';
import '../infrastructure/data_soruce/auth/resetPassword.dart';
import '../infrastructure/data_soruce/mainHome/mainHomeProvider.dart';
import '../infrastructure/repository/DashBoardRepo.dart';
import '../infrastructure/repository/ResetPassRepo.dart';
import '../infrastructure/repository/loginRepo.dart';
import '../infrastructure/repository/registerRepo.dart';
import '../presintation/auth/change_password/change_password.dart';
import '../presintation/auth/change_password/change_password_bloc.dart';
import '../presintation/auth/change_password_otp/changePasswordOtp.dart';
import '../presintation/auth/login/login_bloc.dart';
import '../presintation/auth/login/screen/login.dart';
import '../presintation/auth/regestration/regestrationBorrowerScreen.dart';
import '../presintation/auth/regestration/regestrationInvestorScreen.dart';
import '../presintation/auth/regestration/regestration_bloc.dart';
import '../presintation/auth/splashScreen/splashScreen.dart';
import '../presintation/auth/verfiy_otp/verfiy_otp.dart';
import '../presintation/home/MyOpportunities/WebViewPage.dart';
import '../presintation/home/MyOpportunities/opportunityDetails/campgainAttachmentBloc/attachment_bloc.dart';
import '../presintation/home/MyOpportunities/opportunityDetails/investBloc/invest_bloc.dart';
import '../presintation/home/MyOpportunities/opportunityDetails/opportunityDetails.dart';
import '../presintation/home/MyOpportunities/opportunityDetails/opporunityDetailsAndAttachment.dart';
import '../presintation/home/MyOpportunities/opportunityDetails/oppourtintyDataDetailsBloc/oppourtunity_data_details_bloc.dart';
import '../presintation/home/Settings/notification/notification_screen.dart';
import '../presintation/home/dashboard/InvestorBloc/dash_board_bloc.dart';
import '../presintation/home/dashboard/accountNumberBloc/account_number_bloc.dart';
import '../presintation/home/dashboard/dashboardScreen.dart';
import '../presintation/home/dashboard/nearestDate/nearest_date_bloc.dart';
import '../presintation/home/mainHome/mainHome.dart';
import '../presintation/home/wallet/finicalDetails/finicalDetails.dart';
import '../presintation/onBoarding/onBoarding.dart';
import '../presintation/visitor/visitorScreen.dart';
import '../presintation/visitor/visitor_bloc.dart';
import '../presintation/welcome/welcomePage.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.baseRoute:
        return PageTransition(
            child: const SplashScreen(),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: SplashScreen.baseRoute));
      case WelcomeScreen.routename:
        return PageTransition(
            child: const WelcomeScreen(),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: WelcomeScreen.routename));
      case OnBoardingScreen.routename:
        return PageTransition(
            child: const OnBoardingScreen(),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: OnBoardingScreen.routename));
      case LoginScreen.routename:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider<LoginBloc>(
                  create: (context) => LoginBloc(
                      loginRepo: LoginRepo(
                          loginAuthProvider: LoginAuthProvider(dio: Dio()))),
                  child: const LoginScreen(),
                ),
                BlocProvider<VerfiyOtpBloc>(
                    create: (context) => VerfiyOtpBloc(
                        sendOtpRepo: SendOtpRepo(otpProvider: OtpProvider()))),
              ],
              child: const LoginScreen(),
            ),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: LoginScreen.routename));

      case VerfiyOtp.routename:
        return PageTransition(
            child: BlocProvider(
              create: (context) => VerfiyOtpBloc(
                  sendOtpRepo: SendOtpRepo(otpProvider: OtpProvider())),
              child: const VerfiyOtp(),
            ),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: VerfiyOtp.routename));

      case ChangePasswordOtp.routename:
        return PageTransition(
            child: BlocProvider(
              create: (context) => ChangePasswordOtpBloc(
                  resetPassRepo:
                      ResetPassRepo(resetAuth: ResetAuth(dio: Dio()))),
              child: const ChangePasswordOtp(),
            ),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: ChangePasswordOtp.routename));

      case RegestrationBorrowerscreen.routename:
        return PageTransition(
            child: BlocProvider(
              create: (context) => RegestrationBloc(
                  registerRepo: RegisterRepo(
                      regAuthProvider: RegAuthProvider(dio: Dio()))),
              child: const RegestrationBorrowerscreen(),
            ),
            type: PageTransitionType.fade,
            settings: const RouteSettings(
                name: RegestrationBorrowerscreen.routename));

      case RegestationInvestorScreen.routename:
        return PageTransition<RegestrationBloc>(
            child: BlocProvider(
              create: (context) => RegestrationBloc(
                  registerRepo: RegisterRepo(
                      regAuthProvider: RegAuthProvider(dio: Dio()))),
              child: RegestationInvestorScreen(),
            ),
            type: PageTransitionType.fade,
            settings:
                const RouteSettings(name: RegestationInvestorScreen.routename));

      case Visitorscreen.routename:
        return PageTransition(
            child: BlocProvider(
              create: (context) => VisitorBloc(
                  visitorRepo: VisitorRepo(visitorProvider: VisitorProvider()))
                ..add(VisitorEvents()),
              child: Visitorscreen(),
            ),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: Visitorscreen.routename));

      case Dashboardscreen.routename:
        return PageTransition(
            child: Dashboardscreen(),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: Dashboardscreen.routename));

      case OpportunityDetails.routename:
        return PageTransition(
            child: OpportunityDetails(
              allOpportunityModel: settings.arguments ?? "",
            ),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: OpportunityDetails.routename));

      case OpportunitydetailsAndattachment.routename:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => AttachmentBloc(
                      opportunityRepo: OpportunityRepo(
                          opportunitydataprovider: Opportunitydataprovider())),
                ),
                BlocProvider(
                  create: (context) => OppourtunityDataDetailsBloc(
                      oppourtunityRepo: OpportunityRepo(
                          opportunitydataprovider: Opportunitydataprovider())),
                ),
                BlocProvider(
                    create: (context) => InvestBloc(
                        myWalletRepo: MyWalletRepo(
                            myWalletprovider: Mywalletprovider()))),
                BlocProvider(
                    create: (context) => BalanceBloc(
                        myWalletRepo:
                            MyWalletRepo(myWalletprovider: Mywalletprovider())))
              ],
              child: OpportunitydetailsAndattachment(
                allOpportunityModel: settings.arguments,
              ),
            ),
            type: PageTransitionType.fade,
            settings: const RouteSettings(
                name: OpportunitydetailsAndattachment.routename));

      case HomeMain.routename:
        return PageTransition(
            child: MultiBlocProvider(providers: [
              BlocProvider(
                create: (context) => DashBoardBloc(
                    dashboardRepo:
                        DashboardRepo(mainHomeProvider: MainHomeProvider())),
              ),
              BlocProvider(
                create: (context) => AccountNumberBloc(
                    dashboardRepo:
                        DashboardRepo(mainHomeProvider: MainHomeProvider())),
              ),
              BlocProvider(
                create: (context) => NearestDateBloc(
                    dashboardRepo:
                        DashboardRepo(mainHomeProvider: MainHomeProvider())),
              ),
            ], child: const HomeMain()),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: HomeMain.routename));

      case FinicialDetails.routename:
        return PageTransition(
            child: FinicialDetails(
              data: settings.arguments as WalletData,
            ),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: Dashboardscreen.routename));

      case NotificationScreen.routename:
        return PageTransition(
            child: const NotificationScreen(),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: NotificationScreen.routename));

      case WebViewPage.routename:
        return PageTransition(
            child: WebViewPage(url: settings.arguments as String),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: WebViewPage.routename));

      case ChangePassword.routename:
        return PageTransition(
            child: BlocProvider<ChangePasswordBloc>(
                create: (context) => ChangePasswordBloc(
                    resetPassRepo:
                        ResetPassRepo(resetAuth: ResetAuth(dio: Dio()))),
                child: const ChangePassword()),
            type: PageTransitionType.fade,
            settings: const RouteSettings(name: ChangePassword.routename));

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                    body: SafeArea(
                        child: Center(
                  child: Text("route Error"),
                ))));
    }
  }
}
