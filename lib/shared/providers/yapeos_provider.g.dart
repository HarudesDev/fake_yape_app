// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yapeos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userLastYapeosFromDateHash() =>
    r'119ee436f6e933311860ec8a95f20d4c33e3ba74';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [userLastYapeosFromDate].
@ProviderFor(userLastYapeosFromDate)
const userLastYapeosFromDateProvider = UserLastYapeosFromDateFamily();

/// See also [userLastYapeosFromDate].
class UserLastYapeosFromDateFamily
    extends Family<AsyncValue<List<Map<String, dynamic>>>> {
  /// See also [userLastYapeosFromDate].
  const UserLastYapeosFromDateFamily();

  /// See also [userLastYapeosFromDate].
  UserLastYapeosFromDateProvider call(
    DateTime startDate,
  ) {
    return UserLastYapeosFromDateProvider(
      startDate,
    );
  }

  @override
  UserLastYapeosFromDateProvider getProviderOverride(
    covariant UserLastYapeosFromDateProvider provider,
  ) {
    return call(
      provider.startDate,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userLastYapeosFromDateProvider';
}

/// See also [userLastYapeosFromDate].
class UserLastYapeosFromDateProvider
    extends AutoDisposeFutureProvider<List<Map<String, dynamic>>> {
  /// See also [userLastYapeosFromDate].
  UserLastYapeosFromDateProvider(
    DateTime startDate,
  ) : this._internal(
          (ref) => userLastYapeosFromDate(
            ref as UserLastYapeosFromDateRef,
            startDate,
          ),
          from: userLastYapeosFromDateProvider,
          name: r'userLastYapeosFromDateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userLastYapeosFromDateHash,
          dependencies: UserLastYapeosFromDateFamily._dependencies,
          allTransitiveDependencies:
              UserLastYapeosFromDateFamily._allTransitiveDependencies,
          startDate: startDate,
        );

  UserLastYapeosFromDateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
  }) : super.internal();

  final DateTime startDate;

  @override
  Override overrideWith(
    FutureOr<List<Map<String, dynamic>>> Function(
            UserLastYapeosFromDateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserLastYapeosFromDateProvider._internal(
        (ref) => create(ref as UserLastYapeosFromDateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Map<String, dynamic>>> createElement() {
    return _UserLastYapeosFromDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserLastYapeosFromDateProvider &&
        other.startDate == startDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserLastYapeosFromDateRef
    on AutoDisposeFutureProviderRef<List<Map<String, dynamic>>> {
  /// The parameter `startDate` of this provider.
  DateTime get startDate;
}

class _UserLastYapeosFromDateProviderElement
    extends AutoDisposeFutureProviderElement<List<Map<String, dynamic>>>
    with UserLastYapeosFromDateRef {
  _UserLastYapeosFromDateProviderElement(super.provider);

  @override
  DateTime get startDate =>
      (origin as UserLastYapeosFromDateProvider).startDate;
}

String _$userByPhoneHash() => r'86d0d74140cf0d06d511eda4e8bf753dd48003b7';

/// See also [userByPhone].
@ProviderFor(userByPhone)
const userByPhoneProvider = UserByPhoneFamily();

/// See also [userByPhone].
class UserByPhoneFamily extends Family<AsyncValue<MyUser?>> {
  /// See also [userByPhone].
  const UserByPhoneFamily();

  /// See also [userByPhone].
  UserByPhoneProvider call(
    String phoneNumber,
  ) {
    return UserByPhoneProvider(
      phoneNumber,
    );
  }

  @override
  UserByPhoneProvider getProviderOverride(
    covariant UserByPhoneProvider provider,
  ) {
    return call(
      provider.phoneNumber,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userByPhoneProvider';
}

/// See also [userByPhone].
class UserByPhoneProvider extends AutoDisposeFutureProvider<MyUser?> {
  /// See also [userByPhone].
  UserByPhoneProvider(
    String phoneNumber,
  ) : this._internal(
          (ref) => userByPhone(
            ref as UserByPhoneRef,
            phoneNumber,
          ),
          from: userByPhoneProvider,
          name: r'userByPhoneProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userByPhoneHash,
          dependencies: UserByPhoneFamily._dependencies,
          allTransitiveDependencies:
              UserByPhoneFamily._allTransitiveDependencies,
          phoneNumber: phoneNumber,
        );

  UserByPhoneProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.phoneNumber,
  }) : super.internal();

  final String phoneNumber;

  @override
  Override overrideWith(
    FutureOr<MyUser?> Function(UserByPhoneRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserByPhoneProvider._internal(
        (ref) => create(ref as UserByPhoneRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        phoneNumber: phoneNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MyUser?> createElement() {
    return _UserByPhoneProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserByPhoneProvider && other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, phoneNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserByPhoneRef on AutoDisposeFutureProviderRef<MyUser?> {
  /// The parameter `phoneNumber` of this provider.
  String get phoneNumber;
}

class _UserByPhoneProviderElement
    extends AutoDisposeFutureProviderElement<MyUser?> with UserByPhoneRef {
  _UserByPhoneProviderElement(super.provider);

  @override
  String get phoneNumber => (origin as UserByPhoneProvider).phoneNumber;
}

String _$userByAuthIdHash() => r'278a299ec38c28cef32370bfb87767f7e42c621a';

/// See also [userByAuthId].
@ProviderFor(userByAuthId)
const userByAuthIdProvider = UserByAuthIdFamily();

/// See also [userByAuthId].
class UserByAuthIdFamily extends Family<AsyncValue<MyUser?>> {
  /// See also [userByAuthId].
  const UserByAuthIdFamily();

  /// See also [userByAuthId].
  UserByAuthIdProvider call(
    String authId,
  ) {
    return UserByAuthIdProvider(
      authId,
    );
  }

  @override
  UserByAuthIdProvider getProviderOverride(
    covariant UserByAuthIdProvider provider,
  ) {
    return call(
      provider.authId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userByAuthIdProvider';
}

/// See also [userByAuthId].
class UserByAuthIdProvider extends AutoDisposeFutureProvider<MyUser?> {
  /// See also [userByAuthId].
  UserByAuthIdProvider(
    String authId,
  ) : this._internal(
          (ref) => userByAuthId(
            ref as UserByAuthIdRef,
            authId,
          ),
          from: userByAuthIdProvider,
          name: r'userByAuthIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userByAuthIdHash,
          dependencies: UserByAuthIdFamily._dependencies,
          allTransitiveDependencies:
              UserByAuthIdFamily._allTransitiveDependencies,
          authId: authId,
        );

  UserByAuthIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.authId,
  }) : super.internal();

  final String authId;

  @override
  Override overrideWith(
    FutureOr<MyUser?> Function(UserByAuthIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserByAuthIdProvider._internal(
        (ref) => create(ref as UserByAuthIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        authId: authId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MyUser?> createElement() {
    return _UserByAuthIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserByAuthIdProvider && other.authId == authId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserByAuthIdRef on AutoDisposeFutureProviderRef<MyUser?> {
  /// The parameter `authId` of this provider.
  String get authId;
}

class _UserByAuthIdProviderElement
    extends AutoDisposeFutureProviderElement<MyUser?> with UserByAuthIdRef {
  _UserByAuthIdProviderElement(super.provider);

  @override
  String get authId => (origin as UserByAuthIdProvider).authId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
