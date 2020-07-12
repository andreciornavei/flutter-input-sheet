import 'package:permission_handler/permission_handler.dart';

class HandlePermission {
  static Future<void> enable(
    List<Permission> enablePermissions,
    Function onSuccess,
  ) async {
    bool granted = true;
    enablePermissions.forEach((Permission enablePermission) async {
      bool permissionGranted = await enablePermission.isGranted;
      granted = granted == false ? false : permissionGranted;
    });
    if (granted) {
      onSuccess();
    } else {
      granted = true;
      Map<Permission, PermissionStatus> permissionsStatus =
          await enablePermissions.request();
      permissionsStatus.forEach((permission, permissionStatus) {
        granted = permissionStatus.isGranted == false ? false : granted;
      });
      if (granted) {
        onSuccess();
      } else {
        openAppSettings();
      }
    }
  }

  static Future<void> location(Function onSuccess) async {
    if (
      await Permission.location.isGranted &&
      await Permission.location.serviceStatus.isEnabled
    ) {
      onSuccess();
    } else {
      if (await Permission.location.request().isGranted) {
        onSuccess();
      } else {
        openAppSettings();
      }
    }
  }
}
