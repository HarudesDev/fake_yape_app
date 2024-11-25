// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:fake_yape_app/auth/pages/login_page/login.dart' as _i2;
import 'package:fake_yape_app/auth/pages/login_page/login_password.dart' as _i3;
import 'package:fake_yape_app/auth/pages/register.dart' as _i6;
import 'package:fake_yape_app/auth/pages/welcome_page/welcome.dart' as _i8;
import 'package:fake_yape_app/auth/pages/wrapper.dart' as _i9;
import 'package:fake_yape_app/home/pages/home.dart' as _i1;
import 'package:fake_yape_app/home/pages/transactions.dart' as _i7;
import 'package:fake_yape_app/yape/pages/make_yape.dart' as _i4;
import 'package:fake_yape_app/yape/pages/qr_reader.dart' as _i5;
import 'package:fake_yape_app/yape/pages/yape_detail.dart' as _i10;
import 'package:fake_yape_app/yape/pages/yape_directory.dart' as _i11;
import 'package:flutter/material.dart' as _i13;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}

/// generated route for
/// [_i3.LoginPasswordPage]
class LoginPasswordRoute extends _i12.PageRouteInfo<LoginPasswordRouteArgs> {
  LoginPasswordRoute({
    _i13.Key? key,
    required String email,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          LoginPasswordRoute.name,
          args: LoginPasswordRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginPasswordRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginPasswordRouteArgs>();
      return _i3.LoginPasswordPage(
        key: args.key,
        email: args.email,
      );
    },
  );
}

class LoginPasswordRouteArgs {
  const LoginPasswordRouteArgs({
    this.key,
    required this.email,
  });

  final _i13.Key? key;

  final String email;

  @override
  String toString() {
    return 'LoginPasswordRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i4.MakeYapePage]
class MakeYapeRoute extends _i12.PageRouteInfo<void> {
  const MakeYapeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MakeYapeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MakeYapeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i4.MakeYapePage();
    },
  );
}

/// generated route for
/// [_i5.QrReaderPage]
class QrReaderRoute extends _i12.PageRouteInfo<void> {
  const QrReaderRoute({List<_i12.PageRouteInfo>? children})
      : super(
          QrReaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrReaderRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i5.QrReaderPage();
    },
  );
}

/// generated route for
/// [_i6.RegisterPage]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i6.RegisterPage();
    },
  );
}

/// generated route for
/// [_i7.TransactionsPage]
class TransactionsRoute extends _i12.PageRouteInfo<void> {
  const TransactionsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i7.TransactionsPage();
    },
  );
}

/// generated route for
/// [_i8.WelcomePage]
class WelcomeRoute extends _i12.PageRouteInfo<void> {
  const WelcomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i8.WelcomePage();
    },
  );
}

/// generated route for
/// [_i9.Wrapper]
class Wrapper extends _i12.PageRouteInfo<void> {
  const Wrapper({List<_i12.PageRouteInfo>? children})
      : super(
          Wrapper.name,
          initialChildren: children,
        );

  static const String name = 'Wrapper';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i9.Wrapper();
    },
  );
}

/// generated route for
/// [_i10.YapeDetailPage]
class YapeDetailRoute extends _i12.PageRouteInfo<void> {
  const YapeDetailRoute({List<_i12.PageRouteInfo>? children})
      : super(
          YapeDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'YapeDetailRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i10.YapeDetailPage();
    },
  );
}

/// generated route for
/// [_i11.YapeDirectoryPage]
class YapeDirectoryRoute extends _i12.PageRouteInfo<void> {
  const YapeDirectoryRoute({List<_i12.PageRouteInfo>? children})
      : super(
          YapeDirectoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'YapeDirectoryRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i11.YapeDirectoryPage();
    },
  );
}
