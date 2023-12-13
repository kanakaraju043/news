import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/src/core/bloc/auth/auth_bloc.dart';
import 'package:news_app/src/core/bloc/auth/auth_event.dart';
import 'package:news_app/src/core/bloc/auth/auth_state.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final user = authBloc.getCurrentUser();
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (_, state) => Drawer(
        child: state is LoadingAuthState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  DrawerHeader(
                    child: SvgPicture.asset(
                      'assets/icons/login.svg',
                      height: 50,
                    ),
                  ),
                  ListTile(
                    title: Text(user!.email!),
                  ),
                  ListTile(
                    title: const Text('Log Out'),
                    onTap: () => authBloc.add(SignOutAuthEvent(context: context)),
                  ),
                ],
              ),
      ),
    );
  }
}
