import 'package:task/utils/toast_msg/toastmessage.dart';

import '../utils/export_files/export.dart';

class PostProviderController with ChangeNotifier {
  List<Post> _posts = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final ApiService _apiService = ApiService();

  Future<void> fetchPosts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _posts = await _apiService.fetchPosts();
    } catch (error) {
      _errorMessage = error.toString();
      Utils.toastMessage('$_errorMessage');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
