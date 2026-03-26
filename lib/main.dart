import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/helpers/supabase_helper.dart';
import 'core/theme/app_theme.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'features/auth/data/repo/auth_repo.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/home/data/repo/video_repo.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/favorites/data/repo/favorites_repo.dart';
import 'features/favorites/presentation/cubit/favorites_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(AuthRepo())),
        BlocProvider(create: (_) => HomeCubit(VideoRepo())),
        BlocProvider(create: (_) => FavoritesCubit(FavoritesRepo())),
      ],
      child: MaterialApp(
        title: 'WatchIt',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        initialRoute: Routes.splash,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}