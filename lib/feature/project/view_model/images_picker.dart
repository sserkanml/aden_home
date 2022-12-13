import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class ImagePickerTextDelegate extends AssetPickerTextDelegate {
  @override
  // TODO: implement cancel
  String get cancel => 'İptal Et';

  @override
  // TODO: implement goToSystemSettings
  String get goToSystemSettings => 'Sistem Ayarlarına Git';
  @override
  // TODO: implement select
  String get select => 'Seç';

  @override
  // TODO: implement emptyList
  String get emptyList => 'Boş Liste';
  @override
  // TODO: implement preview
  String get preview => 'Ön izleme';
  @override
  // TODO: implement edit
  String get edit => 'Düzenle';
  @override
  // TODO: implement confirm
  String get confirm => 'Onayla';

  @override
  // TODO: implement loadFailed
  String get loadFailed => 'Başarısız yükleme';
}

class CustomCameraPickerDelegate extends CameraPickerTextDelegate {
  @override
  // TODO: implement confirm
  String get confirm => 'Onayla';
  @override
  // TODO: implement shootingTips
  String get shootingTips => 'Fotorağ Çek';
}
