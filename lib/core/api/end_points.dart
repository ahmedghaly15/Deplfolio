class EndPoints {
  EndPoints._();

  static const String baseUrl = 'https://api.github.com/';
  static const String repos = '${baseUrl}repos';
  static const String _repoOwner = 'ahmedghaly15';
  static const String _repoName = 'Personal-Portfolio';
  static const String contents = '$repos/$_repoOwner/$_repoName/contents/';
}
