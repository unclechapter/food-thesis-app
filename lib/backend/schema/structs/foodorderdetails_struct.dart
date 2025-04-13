// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodorderdetailsStruct extends BaseStruct {
  FoodorderdetailsStruct({
    double? time,
    ImageStruct? image,
    String? inferenceId,
  })  : _time = time,
        _image = image,
        _inferenceId = inferenceId;

  // "time" field.
  double? _time;
  double get time => _time ?? 0.0;
  set time(double? val) => _time = val;

  void incrementTime(double amount) => time = time + amount;

  bool hasTime() => _time != null;

  // "image" field.
  ImageStruct? _image;
  ImageStruct get image => _image ?? ImageStruct();
  set image(ImageStruct? val) => _image = val;

  void updateImage(Function(ImageStruct) updateFn) {
    updateFn(_image ??= ImageStruct());
  }

  bool hasImage() => _image != null;

  // "inference_id" field.
  String? _inferenceId;
  String get inferenceId => _inferenceId ?? '';
  set inferenceId(String? val) => _inferenceId = val;

  bool hasInferenceId() => _inferenceId != null;

  static FoodorderdetailsStruct fromMap(Map<String, dynamic> data) =>
      FoodorderdetailsStruct(
        time: castToType<double>(data['time']),
        image: data['image'] is ImageStruct
            ? data['image']
            : ImageStruct.maybeFromMap(data['image']),
        inferenceId: data['inference_id'] as String?,
      );

  static FoodorderdetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? FoodorderdetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'image': _image?.toMap(),
        'inference_id': _inferenceId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.double,
        ),
        'image': serializeParam(
          _image,
          ParamType.DataStruct,
        ),
        'inference_id': serializeParam(
          _inferenceId,
          ParamType.String,
        ),
      }.withoutNulls;

  static FoodorderdetailsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FoodorderdetailsStruct(
        time: deserializeParam(
          data['time'],
          ParamType.double,
          false,
        ),
        image: deserializeStructParam(
          data['image'],
          ParamType.DataStruct,
          false,
          structBuilder: ImageStruct.fromSerializableMap,
        ),
        inferenceId: deserializeParam(
          data['inference_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FoodorderdetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FoodorderdetailsStruct &&
        time == other.time &&
        image == other.image &&
        inferenceId == other.inferenceId;
  }

  @override
  int get hashCode => const ListEquality().hash([time, image, inferenceId]);
}

FoodorderdetailsStruct createFoodorderdetailsStruct({
  double? time,
  ImageStruct? image,
  String? inferenceId,
}) =>
    FoodorderdetailsStruct(
      time: time,
      image: image ?? ImageStruct(),
      inferenceId: inferenceId,
    );
