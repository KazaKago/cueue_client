import 'package:cueue/legacy/data/repository/di/repository_provider.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/tag/follow_tags_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/tag/follow_tags_usecase_impl.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/tag/refresh_tags_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/tag/refresh_tags_usecase_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final followTagsUseCaseProvider = Provider<FollowTagsUseCase>((ref) => FollowTagsUseCaseImpl(ref.read(tagRepositoryProvider)));
final refreshTagsUseCaseProvider = Provider<RefreshTagsUseCase>((ref) => RefreshTagsUseCaseImpl(ref.read(tagRepositoryProvider)));
