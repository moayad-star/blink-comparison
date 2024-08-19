// Copyright (C) 2024 Yaroslav Pronin <proninyaroslav@mail.ru>
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

import 'package:blink_comparison/core/settings/shared_pref_migrator.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPreferencesModule {
  @singleton
  @preResolve
  Future<SharedPreferences> get prefOld async =>
      SharedPreferences.getInstance();

  @singleton
  @preResolve
  Future<SharedPreferencesAsync> pref(SharedPreferences prefOld) async {
    final pref = SharedPreferencesAsync();
    final migrator = SharedPreferencesMigrator(
      oldPrefs: prefOld,
      newPrefs: pref,
    );
    await migrator.migrate();

    return pref;
  }
}
