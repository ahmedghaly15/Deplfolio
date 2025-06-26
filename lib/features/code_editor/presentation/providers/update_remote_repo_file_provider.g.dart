// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_remote_repo_file_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateRemoteRepoFileHash() =>
    r'3b59e34edc45d28efdf4f8daa1d281cbdae88bb5';

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

abstract class _$UpdateRemoteRepoFile
    extends BuildlessAutoDisposeNotifier<AsyncValue<void>?> {
  late final RemoteRepoFileType fileType;

  AsyncValue<void>? build(RemoteRepoFileType fileType);
}

/// See also [UpdateRemoteRepoFile].
@ProviderFor(UpdateRemoteRepoFile)
const updateRemoteRepoFileProvider = UpdateRemoteRepoFileFamily();

/// See also [UpdateRemoteRepoFile].
class UpdateRemoteRepoFileFamily extends Family<AsyncValue<void>?> {
  /// See also [UpdateRemoteRepoFile].
  const UpdateRemoteRepoFileFamily();

  /// See also [UpdateRemoteRepoFile].
  UpdateRemoteRepoFileProvider call(RemoteRepoFileType fileType) {
    return UpdateRemoteRepoFileProvider(fileType);
  }

  @override
  UpdateRemoteRepoFileProvider getProviderOverride(
    covariant UpdateRemoteRepoFileProvider provider,
  ) {
    return call(provider.fileType);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateRemoteRepoFileProvider';
}

/// See also [UpdateRemoteRepoFile].
class UpdateRemoteRepoFileProvider
    extends
        AutoDisposeNotifierProviderImpl<
          UpdateRemoteRepoFile,
          AsyncValue<void>?
        > {
  /// See also [UpdateRemoteRepoFile].
  UpdateRemoteRepoFileProvider(RemoteRepoFileType fileType)
    : this._internal(
        () => UpdateRemoteRepoFile()..fileType = fileType,
        from: updateRemoteRepoFileProvider,
        name: r'updateRemoteRepoFileProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$updateRemoteRepoFileHash,
        dependencies: UpdateRemoteRepoFileFamily._dependencies,
        allTransitiveDependencies:
            UpdateRemoteRepoFileFamily._allTransitiveDependencies,
        fileType: fileType,
      );

  UpdateRemoteRepoFileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fileType,
  }) : super.internal();

  final RemoteRepoFileType fileType;

  @override
  AsyncValue<void>? runNotifierBuild(covariant UpdateRemoteRepoFile notifier) {
    return notifier.build(fileType);
  }

  @override
  Override overrideWith(UpdateRemoteRepoFile Function() create) {
    return ProviderOverride(
      origin: this,
      override: UpdateRemoteRepoFileProvider._internal(
        () => create()..fileType = fileType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fileType: fileType,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<UpdateRemoteRepoFile, AsyncValue<void>?>
  createElement() {
    return _UpdateRemoteRepoFileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateRemoteRepoFileProvider && other.fileType == fileType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateRemoteRepoFileRef
    on AutoDisposeNotifierProviderRef<AsyncValue<void>?> {
  /// The parameter `fileType` of this provider.
  RemoteRepoFileType get fileType;
}

class _UpdateRemoteRepoFileProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          UpdateRemoteRepoFile,
          AsyncValue<void>?
        >
    with UpdateRemoteRepoFileRef {
  _UpdateRemoteRepoFileProviderElement(super.provider);

  @override
  RemoteRepoFileType get fileType =>
      (origin as UpdateRemoteRepoFileProvider).fileType;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
