import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/follow_tags_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/refresh_tags_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/reorder_tag_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/tag/tag_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class TagViewModel with ChangeNotifier {
  TagViewModel(this._followTagsUseCase, this._refreshTagsUseCase, this._reorderTagUseCase) {
    _follow();
  }

  final FollowTagsUseCase _followTagsUseCase;
  final RefreshTagsUseCase _refreshTagsUseCase;
  final ReorderTagUseCase _reorderTagUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  TagState _state = const TagState.loading();
  Event<Exception> _exceptionEvent = Event.initialize();

  Event<Exception> get exceptionEvent => _exceptionEvent;

  set exceptionEvent(Event<Exception> exceptionEvent) {
    _exceptionEvent = exceptionEvent;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  TagState get state => _state;

  set state(TagState state) {
    _state = state;
    notifyListeners();
  }

  void _follow() {
    final followTagsUseCase = _followTagsUseCase();
    _compositeSubscription.add(
      followTagsUseCase.listen((state) {
        this.state = state.when(
          loading: (tags) => (tags != null) ? TagState.completed(tags) : const TagState.loading(),
          completed: (tags, next, prev) => (tags.isNotEmpty) ? TagState.completed(tags) : const TagState.empty(),
          error: (exception) => TagState.error(exception),
        );
      }),
    );
  }

  Future<void> refresh() async {
    await _refreshTagsUseCase();
  }

  Future<void> retry() async {
    await refresh();
  }

  Future<void> reorder(List<Tag> tags, int oldIndex, int newIndex) async {
    var fixedNewIndex = newIndex;
    if (oldIndex < newIndex) {
      fixedNewIndex -= 1;
    }
    final targetTag = tags[oldIndex];
    final fixedList = List.of(tags)
      ..remove(targetTag)
      ..insert(fixedNewIndex, targetTag);
    try {
      await _reorderTagUseCase(fixedList.map((e) => e.id).toList());
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
  }
}
