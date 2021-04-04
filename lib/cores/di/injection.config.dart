// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i4;

import '../../features/home/home_vm.dart' as _i6;
import '../../features/register/register_vm.dart' as _i7;
import '../../services/auth.dart' as _i3;
import '../../services/database_service.dart' as _i5;
import 'third_party_services.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.AuthService>(() => _i3.AuthService());
  gh.lazySingleton<_i4.BottomSheetService>(
      () => thirdPartyServicesModule.bottomSheetService);
  gh.factory<_i5.DatabaseService>(() => _i5.DatabaseService());
  gh.lazySingleton<_i4.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<_i4.NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<_i4.SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
  gh.factory<_i6.HomeViewModel>(() =>
      _i6.HomeViewModel(get<_i3.AuthService>(), get<_i4.NavigationService>()));
  gh.factory<_i7.RegisterViewModel>(() => _i7.RegisterViewModel(
      get<_i3.AuthService>(),
      get<_i4.SnackbarService>(),
      get<_i4.NavigationService>()));
  return get;
}

class _$ThirdPartyServicesModule extends _i8.ThirdPartyServicesModule {
  @override
  _i4.BottomSheetService get bottomSheetService => _i4.BottomSheetService();
  @override
  _i4.DialogService get dialogService => _i4.DialogService();
  @override
  _i4.NavigationService get navigationService => _i4.NavigationService();
  @override
  _i4.SnackbarService get snackBarService => _i4.SnackbarService();
}
