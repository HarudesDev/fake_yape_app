// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:fake_yape_app/auth/pages/login_page/login.dart' as _i2;
import 'package:fake_yape_app/auth/pages/register_data_page/register_data.dart'
    as _i6;
import 'package:fake_yape_app/auth/pages/register_page/register.dart' as _i7;
import 'package:fake_yape_app/auth/pages/secure_keyboard.dart' as _i8;
import 'package:fake_yape_app/auth/pages/welcome_page/welcome.dart' as _i10;
import 'package:fake_yape_app/auth/pages/wrapper.dart' as _i11;
import 'package:fake_yape_app/home/pages/home_page/home.dart' as _i1;
import 'package:fake_yape_app/home/pages/menu_page/menu.dart' as _i4;
import 'package:fake_yape_app/home/pages/transactions_page/transactions.dart'
    as _i9;
import 'package:fake_yape_app/yape/models/yapeo.dart' as _i17;
import 'package:fake_yape_app/yape/pages/make_yape.dart' as _i3;
import 'package:fake_yape_app/yape/pages/qr_reader.dart' as _i5;
import 'package:fake_yape_app/yape/pages/yape_detail.dart' as _i12;
import 'package:fake_yape_app/yape/pages/yape_directory.dart' as _i13;
import 'package:flutter/material.dart' as _i15;
import 'package:flutter_contacts/flutter_contacts.dart' as _i16;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}

/// generated route for
/// [_i3.MakeYapePage]
class MakeYapeRoute extends _i14.PageRouteInfo<MakeYapeRouteArgs> {
  MakeYapeRoute({
    _i15.Key? key,
    required _i16.Contact contact,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          MakeYapeRoute.name,
          args: MakeYapeRouteArgs(
            key: key,
            contact: contact,
          ),
          initialChildren: children,
        );

  static const String name = 'MakeYapeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MakeYapeRouteArgs>();
      return _i3.MakeYapePage(
        key: args.key,
        contact: args.contact,
      );
    },
  );
}

class MakeYapeRouteArgs {
  const MakeYapeRouteArgs({
    this.key,
    required this.contact,
  });

  final _i15.Key? key;

  final _i16.Contact contact;

  @override
  String toString() {
    return 'MakeYapeRouteArgs{key: $key, contact: $contact}';
  }
}

/// generated route for
/// [_i4.MenuPage]
class MenuRoute extends _i14.PageRouteInfo<MenuRouteArgs> {
  MenuRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          MenuRoute.name,
          args: MenuRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<MenuRouteArgs>(orElse: () => const MenuRouteArgs());
      return _i4.MenuPage(key: args.key);
    },
  );
}

class MenuRouteArgs {
  const MenuRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'MenuRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.QrReaderPage]
class QrReaderRoute extends _i14.PageRouteInfo<void> {
  const QrReaderRoute({List<_i14.PageRouteInfo>? children})
      : super(
          QrReaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrReaderRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.QrReaderPage();
    },
  );
}

/// generated route for
/// [_i6.RegisterDataPage]
class RegisterDataRoute extends _i14.PageRouteInfo<RegisterDataRouteArgs> {
  RegisterDataRoute({
    _i15.Key? key,
    required String phoneNumber,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          RegisterDataRoute.name,
          args: RegisterDataRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterDataRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterDataRouteArgs>();
      return _i6.RegisterDataPage(
        key: args.key,
        phoneNumber: args.phoneNumber,
      );
    },
  );
}

class RegisterDataRouteArgs {
  const RegisterDataRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final _i15.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'RegisterDataRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterRoute extends _i14.PageRouteInfo<void> {
  const RegisterRoute({List<_i14.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.RegisterPage();
    },
  );
}

/// generated route for
/// [_i8.SecureKeyboardPage]
class SecureKeyboardRoute extends _i14.PageRouteInfo<SecureKeyboardRouteArgs> {
  SecureKeyboardRoute({
    _i15.Key? key,
    required Map<String, dynamic> parameters,
    required _i8.SecureKeyboardPageType pageType,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SecureKeyboardRoute.name,
          args: SecureKeyboardRouteArgs(
            key: key,
            parameters: parameters,
            pageType: pageType,
          ),
          initialChildren: children,
        );

  static const String name = 'SecureKeyboardRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SecureKeyboardRouteArgs>();
      return _i8.SecureKeyboardPage(
        key: args.key,
        parameters: args.parameters,
        pageType: args.pageType,
      );
    },
  );
}

class SecureKeyboardRouteArgs {
  const SecureKeyboardRouteArgs({
    this.key,
    required this.parameters,
    required this.pageType,
  });

  final _i15.Key? key;

  final Map<String, dynamic> parameters;

  final _i8.SecureKeyboardPageType pageType;

  @override
  String toString() {
    return 'SecureKeyboardRouteArgs{key: $key, parameters: $parameters, pageType: $pageType}';
  }
}

/// generated route for
/// [_i9.TransactionsPage]
class TransactionsRoute extends _i14.PageRouteInfo<void> {
  const TransactionsRoute({List<_i14.PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i9.TransactionsPage();
    },
  );
}

/// generated route for
/// [_i10.WelcomePage]
class WelcomeRoute extends _i14.PageRouteInfo<void> {
  const WelcomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.WelcomePage();
    },
  );
}

/// generated route for
/// [_i11.Wrapper]
class Wrapper extends _i14.PageRouteInfo<void> {
  const Wrapper({List<_i14.PageRouteInfo>? children})
      : super(
          Wrapper.name,
          initialChildren: children,
        );

  static const String name = 'Wrapper';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.Wrapper();
    },
  );
}

/// generated route for
/// [_i12.YapeDetailPage]
class YapeDetailRoute extends _i14.PageRouteInfo<YapeDetailRouteArgs> {
  YapeDetailRoute({
    _i15.Key? key,
    required _i17.Yapeo yapeData,
    required bool isReceiver,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          YapeDetailRoute.name,
          args: YapeDetailRouteArgs(
            key: key,
            yapeData: yapeData,
            isReceiver: isReceiver,
          ),
          initialChildren: children,
        );

  static const String name = 'YapeDetailRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<YapeDetailRouteArgs>();
      return _i12.YapeDetailPage(
        key: args.key,
        yapeData: args.yapeData,
        isReceiver: args.isReceiver,
      );
    },
  );
}

class YapeDetailRouteArgs {
  const YapeDetailRouteArgs({
    this.key,
    required this.yapeData,
    required this.isReceiver,
  });

  final _i15.Key? key;

  final _i17.Yapeo yapeData;

  final bool isReceiver;

  @override
  String toString() {
    return 'YapeDetailRouteArgs{key: $key, yapeData: $yapeData, isReceiver: $isReceiver}';
  }
}

/// generated route for
/// [_i13.YapeDirectoryPage]
class YapeDirectoryRoute extends _i14.PageRouteInfo<YapeDirectoryRouteArgs> {
  YapeDirectoryRoute({
    _i15.Key? key,
    required List<_i16.Contact> contacts,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          YapeDirectoryRoute.name,
          args: YapeDirectoryRouteArgs(
            key: key,
            contacts: contacts,
          ),
          initialChildren: children,
        );

  static const String name = 'YapeDirectoryRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<YapeDirectoryRouteArgs>();
      return _i13.YapeDirectoryPage(
        key: args.key,
        contacts: args.contacts,
      );
    },
  );
}

class YapeDirectoryRouteArgs {
  const YapeDirectoryRouteArgs({
    this.key,
    required this.contacts,
  });

  final _i15.Key? key;

  final List<_i16.Contact> contacts;

  @override
  String toString() {
    return 'YapeDirectoryRouteArgs{key: $key, contacts: $contacts}';
  }
}
