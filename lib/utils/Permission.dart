import 'package:permission_handler/permission_handler.dart';

class Permission {
  static Future<void> enable(
      List<PermissionGroup> enablePermissions, Function onSuccess) async {
    bool granted = true;
    enablePermissions.forEach((PermissionGroup enablePermission) async {
      ServiceStatus serviceStatus =
          await PermissionHandler().checkServiceStatus(enablePermission);
      PermissionStatus permission =
          await PermissionHandler().checkPermissionStatus(enablePermission);
      granted = granted == false
          ? false
          : permission == PermissionStatus.granted &&
              serviceStatus == ServiceStatus.enabled;
    });
    if (granted) {
      onSuccess();
    } else {
      granted = true;
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler().requestPermissions(enablePermissions);
      permissions.forEach((PermissionGroup permissionGroup,
          PermissionStatus permissionStatus) async {
        granted = granted == false
            ? false
            : permissions[permissionGroup] == PermissionStatus.granted;
      });
      if (granted) {
        onSuccess();
      } else {
        await PermissionHandler().openAppSettings();
      }
    }
  }

  static Future<void> location(Function onSuccess) async {
    ServiceStatus serviceStatus =
        await PermissionHandler().checkServiceStatus(PermissionGroup.location);
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);
    if (permission == PermissionStatus.granted &&
        serviceStatus == ServiceStatus.enabled) {
      onSuccess();
    } else {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.location]);
      if (permissions[PermissionGroup.location] == PermissionStatus.granted) {
        onSuccess();
      } else {
        await PermissionHandler().openAppSettings();
      }
    }
  }
}
