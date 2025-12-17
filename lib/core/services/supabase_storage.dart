import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorage implements StorageService {
  var supabaseReference = Supabase.instance.client.storage;
  @override
  Future<String> uploadFile(File file, String path, String bucketName) async {
    var fileName = b.basename(file.path);
    var filePath = '$path/$fileName';
    try {
      final bytes = await file.readAsBytes();
      await supabaseReference.from(bucketName).uploadBinary(filePath, bytes);
    } catch (e) {
      print('Supabase upload error: $e');
      rethrow;
    }
    final String publicUrl = supabaseReference
        .from(bucketName)
        .getPublicUrl(filePath);
    print("file url $publicUrl");
    return publicUrl;
  }

  Future<void> deleteFile(String path, String bucketName) async {
    
    try {
      await supabaseReference.from(bucketName).remove([path]);
    } catch (e) {
      print('Supabase delete error: $e');
      rethrow;
    }
  }
  
  @override
  Future<bool> checkFileExists(String path, String bucketName) {
    try {
      final result = supabaseReference.from(bucketName).exists(path);
      return result;
    } catch (e) {
      print('Supabase check file exists error: $e');
      rethrow;
    }
  }
}
