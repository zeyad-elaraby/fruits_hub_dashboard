import 'dart:io';

abstract class StorageService {
  Future<String> uploadFile(File image,String path,String bucketName);
  Future<void> deleteFile(String path, String bucketName);
  Future<bool> checkFileExists(String path, String bucketName);
}
