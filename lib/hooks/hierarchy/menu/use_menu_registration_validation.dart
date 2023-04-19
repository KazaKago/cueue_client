bool Function(int recipeCount, String message) useMenuRegistrationValidation() {
  return (recipeCount, message) {
    return 0 < recipeCount || message.isNotEmpty;
  };
}
