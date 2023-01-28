import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_order_request.freezed.dart';
part 'tag_order_request.g.dart';

@freezed
class TagOrderRequest with _$TagOrderRequest {
  const factory TagOrderRequest({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'tag_ids') required List<int> tagIds,
  }) = _TagOrderRequest;

  factory TagOrderRequest.fromJson(Map<String, dynamic> json) => _$TagOrderRequestFromJson(json);
}
