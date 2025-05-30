class SupabaseError {
  final String message;
  final String? code;

  const SupabaseError({required this.message, this.code});
}
