import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alon/common/services/services.dart';
import 'package:alon/common/store/store.dart';
import 'package:alon/common/utils/utils.dart';
import 'package:get/get.dart';

/// 全局静态数据
class Global {
  /// 初始化
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // 設置屏幕方向
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    setSystemUi();
    Loading();

    await Get.putAsync<StorageService>(() => StorageService().init());

    Get.put<ConfigStore>(ConfigStore());
    Get.put<UserStore>(UserStore());
  }

  static void setSystemUi() {
    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
