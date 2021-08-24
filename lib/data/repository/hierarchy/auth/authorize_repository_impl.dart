import 'package:cueue/data/auth/hierarchy/apple/apple_signaturer.dart';
import 'package:cueue/data/auth/hierarchy/google/google_signaturer.dart';
import 'package:cueue/data/auth/hierarchy/password/password_signaturer.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/memory/hierarchy/menu/menu_cache.dart';
import 'package:cueue/data/memory/hierarchy/menu/menu_state_manager.dart';
import 'package:cueue/data/memory/hierarchy/recipe/all_recipes_state_manager.dart';
import 'package:cueue/data/memory/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/data/memory/hierarchy/recipe/tagged_recipes_state_manager.dart';
import 'package:cueue/data/memory/hierarchy/tag/tag_cache.dart';
import 'package:cueue/data/memory/hierarchy/tag/tag_state_manager.dart';
import 'package:cueue/data/memory/hierarchy/user/user_cache.dart';
import 'package:cueue/data/memory/hierarchy/user/user_state_manager.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/password_auth_info.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_flowable/store_flowable.dart';

class AuthorizeRepositoryImpl implements AuthorizeRepository {
  const AuthorizeRepositoryImpl(this._userResponseMapper, this._passwordSignaturer, this._googleSignaturer, this._appleSignaturer);

  final UserResponseMapper _userResponseMapper;
  final PasswordSignaturer _passwordSignaturer;
  final GoogleSignaturer _googleSignaturer;
  final AppleSignaturer _appleSignaturer;

  @override
  Future<bool> isSignIn() async {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  @override
  Future<void> signUpWithPassword(final PasswordAuthInfo authInfo) async {
    await _passwordSignaturer.signUp(authInfo);
  }

  @override
  Future<void> signInWithPassword(final PasswordAuthInfo authInfo) async {
    await _passwordSignaturer.signIn(authInfo);
  }

  @override
  Future<void> authenticateWithGoogle(final GoogleAuthInfo authInfo) async {
    await _googleSignaturer.authenticate(authInfo);
  }

  @override
  Future<void> authenticateWithApple(final AppleAuthInfo authInfo) async {
    await _appleSignaturer.authenticate(authInfo);
  }

  @override
  Future<void> reauthenticateWithPassword(final PasswordAuthInfo authInfo) async {
    await _passwordSignaturer.reauthenticate(authInfo);
  }

  @override
  Future<void> reauthenticateWithGoogle(GoogleAuthInfo authInfo) async {
    await _googleSignaturer.reauthenticate(authInfo);
  }

  @override
  Future<void> reauthenticateWithApple(AppleAuthInfo authInfo) async {
    await _appleSignaturer.reauthenticate(authInfo);
  }

  @override
  Future<void> linkWithGoogle(final GoogleAuthInfo authInfo) async {
    await _googleSignaturer.link(authInfo);
    final userFlowable = UserFlowableFactory(_userResponseMapper).create();
    await userFlowable.refresh();
  }

  @override
  Future<void> linkWithApple(final AppleAuthInfo authInfo) async {
    await _appleSignaturer.link(authInfo);
    final userFlowable = UserFlowableFactory(_userResponseMapper).create();
    await userFlowable.refresh();
  }

  @override
  Future<void> unlinkWithGoogle() async {
    await _googleSignaturer.unlink();
    final userFlowable = UserFlowableFactory(_userResponseMapper).create();
    await userFlowable.refresh();
  }

  @override
  Future<void> unlinkWithApple() async {
    await _appleSignaturer.unlink();
    final userFlowable = UserFlowableFactory(_userResponseMapper).create();
    await userFlowable.refresh();
  }

  @override
  Future<void> signOut() async {
    await Future.wait([
      FirebaseAuth.instance.signOut(),
      _deleteAllCache(),
    ]);
  }

  Future<void> _deleteAllCache() async {
    UserCache.sharedInstance.clearAll();
    UserStateManager.sharedInstance.clearAll();
    RecipeCache.sharedInstance.clearAll();
    AllRecipesStateManager.sharedInstance.clearAll();
    TaggedRecipesStateManager.sharedInstance.clearAll();
    TagCache.sharedInstance.clearAll();
    TagStateManager.sharedInstance.clearAll();
    MenuCache.sharedInstance.clearAll();
    MenuStateManager.sharedInstance.clearAll();
  }
}
