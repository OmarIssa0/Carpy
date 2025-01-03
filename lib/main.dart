import 'package:car_store/core/api/firebase_analytics.dart';
import 'package:car_store/core/api/firebase_api.dart';
import 'package:car_store/core/service/adMob_provider.dart';
import 'package:car_store/core/utils/theme.dart';
import 'package:car_store/features/auth/presentation/manger/provider/google_auth_provider.dart';
import 'package:car_store/features/auth/presentation/manger/provider/user_provider.dart';
import 'package:car_store/features/auth/presentation/view/delete_user_view.dart';
import 'package:car_store/features/auth/presentation/view/forget_password_view.dart';
import 'package:car_store/features/auth/presentation/view/login_view.dart';
import 'package:car_store/features/auth/presentation/view/sign_up_view.dart';
import 'package:car_store/features/details/presentation/view/details_view.dart';
import 'package:car_store/features/details/presentation/view_model/provider/send_booking_provider.dart';
import 'package:car_store/features/favorite/presentation/view/favorite_view.dart';
import 'package:car_store/features/favorite/presentation/view_model/provider/favorite_provider.dart';
import 'package:car_store/features/filter_category/presentation/view/filter_brand_view.dart';
import 'package:car_store/features/filter_category/presentation/view/filter_category_view.dart';
import 'package:car_store/features/home/presentation/view/home_view.dart';
import 'package:car_store/features/home/presentation/view_model/provider/banner_provider.dart';
import 'package:car_store/features/lang/app_localization.dart';
import 'package:car_store/features/lang/cubit/locale_cubit.dart';
import 'package:car_store/features/my_booking/presentation/view/my_booking_view.dart';
import 'package:car_store/features/profile/presentation/view/profile_view.dart';
import 'package:car_store/features/search/presentation/view/search_view.dart';
import 'package:car_store/features/search/presentation/view_model/provider/product_provider.dart';
import 'package:car_store/features/splash/presentation/view/splash_view.dart';
import 'package:car_store/features/vendor_stroe/presentation/view/vendor_store_view.dart';
import 'package:car_store/features/vendor_stroe/presentation/view_model/provider/vendor_provider.dart';
import 'package:car_store/firebase_options.dart';
import 'package:car_store/root_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
      ],
      child: const CarApp(),
    ),
  );
}

class CarApp extends StatelessWidget {
  const CarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => VendorProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => SendBookingProvider()),
        ChangeNotifierProvider(create: (context) => AdProvider()),
        ChangeNotifierProvider(
            create: (context) => GoogleProviderAuthLoginAndSignUp()),
        ChangeNotifierProvider(create: (context) => BannerProvider()),
        ChangeNotifierProvider(create: (context) => AnalyticsService('users')),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state) {
            if (state is ChangeLocaleState) {
              return MaterialApp(
                navigatorObservers: [
                  FirebaseAnalyticsObserver(
                      analytics: FirebaseAnalytics.instance),
                ],
                locale: state.locale,
                supportedLocales: const [Locale('en'), Locale('ar')],
                localizationsDelegates: const [
                  AppLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                theme: Styles.themeData(
                  context: context,
                  fontFamily:
                      state.locale.languageCode == 'en' ? 'Poppins' : "Cairo",
                ),
                debugShowCheckedModeBanner: false,
                initialRoute: SplashView.routeName,
                routes: {
                  SplashView.routeName: (context) => const SplashView(),
                  LoginView.routeName: (context) => const LoginView(),
                  SignUpView.routeName: (context) => const SignUpView(),
                  ForgetPasswordView.routeName: (context) =>
                      const ForgetPasswordView(),
                  RootView.routeName: (context) => const RootView(),
                  HomeView.routeName: (context) => const HomeView(),
                  SearchView.routeName: (context) => const SearchView(),
                  DetailsView.routeName: (context) => const DetailsView(),
                  FavoriteView.routeName: (context) => const FavoriteView(),
                  ProfileView.routeName: (context) => const ProfileView(),
                  VendorStoreView.routeName: (context) =>
                      const VendorStoreView(),
                  FilterBrandView.routeName: (context) =>
                      const FilterBrandView(),
                  FilterCategoryView.routeName: (context) =>
                      const FilterCategoryView(),
                  MyBookingView.routeName: (context) => const MyBookingView(),
                  DeleteUserView.routeName: (context) => const DeleteUserView()
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
