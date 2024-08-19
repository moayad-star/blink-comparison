// Copyright (C) 2022-2024 Yaroslav Pronin <proninyaroslav@mail.ru>
//
// This file is part of Blink Comparison.
//
// Blink Comparison is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Blink Comparison is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Blink Comparison.  If not, see <http://www.gnu.org/licenses/>.

import 'package:blink_comparison/core/settings/app_settings.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../app_cubit.dart';

part 'camera_cubit.freezed.dart';

@freezed
class CameraState with _$CameraState {
  const factory CameraState.initial(
    CameraInfo info,
  ) = CameraStateInitial;

  const factory CameraState.enableFlashChanged(
    CameraInfo info,
  ) = CameraStateEnableFlashChanged;

  const factory CameraState.fullscreenModeChanged(
    CameraInfo info,
  ) = CameraStateFullscreenModeChanged;
}

@freezed
class CameraInfo with _$CameraInfo {
  const factory CameraInfo({
    required bool enableFlashByDefault,
    required bool fullscreenMode,
  }) = _CameraInfo;
}

@injectable
class CameraSettingsCubit extends Cubit<CameraState> {
  final AppSettings _pref;
  final AppCubit _appCubit;

  @FactoryMethod(preResolve: true)
  static Future<CameraSettingsCubit> init(
    AppSettings pref,
    AppCubit appCubit,
  ) async {
    return CameraSettingsCubit(
      pref,
      appCubit,
      CameraInfo(
        enableFlashByDefault: await pref.enableFlashByDefault,
        fullscreenMode: await pref.cameraFullscreenMode,
      ),
    );
  }

  CameraSettingsCubit(this._pref, this._appCubit, CameraInfo initialValue)
      : super(CameraState.initial(initialValue));

  Future<void> setEnableFlashByDefault(bool enable) async {
    await _pref.setEnableFlashByDefault(enable);
    emit(CameraState.enableFlashChanged(
      state.info.copyWith(enableFlashByDefault: enable),
    ));
  }

  Future<void> setFullscreenMode(bool enable) async {
    await _pref.setCameraFullscreenMode(enable);
    _appCubit.setCameraFullscreenMode(enable);
    emit(CameraState.fullscreenModeChanged(
      state.info.copyWith(fullscreenMode: enable),
    ));
  }
}
