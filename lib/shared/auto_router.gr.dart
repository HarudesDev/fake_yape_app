// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:fake_yape_app/auth/pages/logged_access_page/logged_access_page.dart'
    as _i2;
import 'package:fake_yape_app/auth/pages/login_page/login_page.dart' as _i3;
import 'package:fake_yape_app/auth/pages/register_data_page/register_data_page.dart'
    as _i8;
import 'package:fake_yape_app/auth/pages/register_page/register_page.dart'
    as _i9;
import 'package:fake_yape_app/auth/pages/secure_keyboard_page/secure_keyboard_page.dart'
    as _i10;
import 'package:fake_yape_app/auth/pages/welcome_page/welcome_page.dart'
    as _i12;
import 'package:fake_yape_app/auth/pages/wrapper.dart' as _i13;
import 'package:fake_yape_app/home/pages/home_page/home_page.dart' as _i1;
import 'package:fake_yape_app/home/pages/menu_page/menu_my_qr.dart' as _i5;
import 'package:fake_yape_app/home/pages/menu_page/menu_page.dart' as _i6;
import 'package:fake_yape_app/home/pages/transactions_page/transactions_page.dart'
    as _i11;
import 'package:fake_yape_app/shared/services/yape_service.dart' as _i19;
import 'package:fake_yape_app/yape/models/yapeo.dart' as _i20;
import 'package:fake_yape_app/yape/pages/make_yape_page/make_yape_page.dart'
    as _i4;
import 'package:fake_yape_app/yape/pages/qr_reader_page/qr_reader_page.dart'
    as _i7;
import 'package:fake_yape_app/yape/pages/yape_detail_page/yape_detail_page.dart'
    as _i14;
import 'package:fake_yape_app/yape/pages/yape_directory_page/yape_directory_page.dart'
    as _i15;
import 'package:flutter/material.dart' as _i17;
import 'package:flutter_contacts/flutter_contacts.dart' as _i18;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.LoggedAccessPage]
class LoggedAccessRoute extends _i16.PageRouteInfo<void> {
  const LoggedAccessRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoggedAccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoggedAccessRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoggedAccessPage();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginPage();
    },
  );
}

/// generated route for
/// [_i4.MakeYapePage]
class MakeYapeRoute extends _i16.PageRouteInfo<MakeYapeRouteArgs> {
  MakeYapeRoute({
    _i17.Key? key,
    required _i18.Contact contact,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          MakeYapeRoute.name,
          args: MakeYapeRouteArgs(
            key: key,
            contact: contact,
          ),
          initialChildren: children,
        );

  static const String name = 'MakeYapeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MakeYapeRouteArgs>();
      return _i4.MakeYapePage(
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

  final _i17.Key? key;

  final _i18.Contact contact;

  @override
  String toString() {
    return 'MakeYapeRouteArgs{key: $key, contact: $contact}';
  }
}

/// generated route for
/// [_i5.MenuMyQrPage]
class MenuMyQrRoute extends _i16.PageRouteInfo<void> {
  const MenuMyQrRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MenuMyQrRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuMyQrRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i5.MenuMyQrPage();
    },
  );
}

/// generated route for
/// [_i6.MenuPage]
class MenuRoute extends _i16.PageRouteInfo<MenuRouteArgs> {
  MenuRoute({
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          MenuRoute.name,
          args: MenuRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<MenuRouteArgs>(orElse: () => const MenuRouteArgs());
      return _i6.MenuPage(key: args.key);
    },
  );
}

class MenuRouteArgs {
  const MenuRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'MenuRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.QrReaderPage]
class QrReaderRoute extends _i16.PageRouteInfo<QrReaderRouteArgs> {
  QrReaderRoute({
    _i17.Key? key,
    required _i19.YapeService yapeService,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          QrReaderRoute.name,
          args: QrReaderRouteArgs(
            key: key,
            yapeService: yapeService,
          ),
          initialChildren: children,
        );

  static const String name = 'QrReaderRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QrReaderRouteArgs>();
      return _i7.QrReaderPage(
        key: args.key,
        yapeService: args.yapeService,
      );
    },
  );
}

class QrReaderRouteArgs {
  const QrReaderRouteArgs({
    this.key,
    required this.yapeService,
  });

  final _i17.Key? key;

  final _i19.YapeService yapeService;

  @override
  String toString() {
    return 'QrReaderRouteArgs{key: $key, yapeService: $yapeService}';
  }
}

/// generated route for
/// [_i8.RegisterDataPage]
class RegisterDataRoute extends _i16.PageRouteInfo<RegisterDataRouteArgs> {
  RegisterDataRoute({
    _i17.Key? key,
    required String phoneNumber,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          RegisterDataRoute.name,
          args: RegisterDataRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterDataRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterDataRouteArgs>();
      return _i8.RegisterDataPage(
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

  final _i17.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'RegisterDataRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i9.RegisterPage]
class RegisterRoute extends _i16.PageRouteInfo<void> {
  const RegisterRoute({List<_i16.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.RegisterPage();
    },
  );
}

/// generated route for
/// [_i10.SecureKeyboardPage]
class SecureKeyboardRoute extends _i16.PageRouteInfo<SecureKeyboardRouteArgs> {
  SecureKeyboardRoute({
    _i17.Key? key,
    required Map<String, dynamic> parameters,
    required _i10.SecureKeyboardPageType pageType,
    List<_i16.PageRouteInfo>? children,
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

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SecureKeyboardRouteArgs>();
      return _i10.SecureKeyboardPage(
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

  final _i17.Key? key;

  final Map<String, dynamic> parameters;

  final _i10.SecureKeyboardPageType pageType;

  @override
  String toString() {
    return 'SecureKeyboardRouteArgs{key: $key, parameters: $parameters, pageType: $pageType}';
  }
}

/// generated route for
/// [_i11.TransactionsPage]
class TransactionsRoute extends _i16.PageRouteInfo<void> {
  const TransactionsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.TransactionsPage();
    },
  );
}

/// generated route for
/// [_i12.WelcomePage]
class WelcomeRoute extends _i16.PageRouteInfo<void> {
  const WelcomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i12.WelcomePage();
    },
  );
}

/// generated route for
/// [_i13.Wrapper]
class Wrapper extends _i16.PageRouteInfo<void> {
  const Wrapper({List<_i16.PageRouteInfo>? children})
      : super(
          Wrapper.name,
          initialChildren: children,
        );

  static const String name = 'Wrapper';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.Wrapper();
    },
  );
}

/// generated route for
/// [_i14.YapeDetailPage]
class YapeDetailRoute extends _i16.PageRouteInfo<YapeDetailRouteArgs> {
  YapeDetailRoute({
    _i17.Key? key,
    required _i20.Yapeo yapeData,
    required bool isReceiver,
    required bool isNewYapeo,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          YapeDetailRoute.name,
          args: YapeDetailRouteArgs(
            key: key,
            yapeData: yapeData,
            isReceiver: isReceiver,
            isNewYapeo: isNewYapeo,
          ),
          initialChildren: children,
        );

  static const String name = 'YapeDetailRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<YapeDetailRouteArgs>();
      return _i14.YapeDetailPage(
        key: args.key,
        yapeData: args.yapeData,
        isReceiver: args.isReceiver,
        isNewYapeo: args.isNewYapeo,
      );
    },
  );
}

class YapeDetailRouteArgs {
  const YapeDetailRouteArgs({
    this.key,
    required this.yapeData,
    required this.isReceiver,
    required this.isNewYapeo,
  });

  final _i17.Key? key;

  final _i20.Yapeo yapeData;

  final bool isReceiver;

  final bool isNewYapeo;

  @override
  String toString() {
    return 'YapeDetailRouteArgs{key: $key, yapeData: $yapeData, isReceiver: $isReceiver, isNewYapeo: $isNewYapeo}';
  }
}

/// generated route for
/// [_i15.YapeDirectoryPage]
class YapeDirectoryRoute extends _i16.PageRouteInfo<YapeDirectoryRouteArgs> {
  YapeDirectoryRoute({
    _i17.Key? key,
    required List<_i18.Contact> contacts,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          YapeDirectoryRoute.name,
          args: YapeDirectoryRouteArgs(
            key: key,
            contacts: contacts,
          ),
          initialChildren: children,
        );

  static const String name = 'YapeDirectoryRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<YapeDirectoryRouteArgs>();
      return _i15.YapeDirectoryPage(
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

  final _i17.Key? key;

  final List<_i18.Contact> contacts;

  @override
  String toString() {
    return 'YapeDirectoryRouteArgs{key: $key, contacts: $contacts}';
  }
}
