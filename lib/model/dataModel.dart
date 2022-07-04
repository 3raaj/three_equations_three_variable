import 'package:filesize/filesize.dart';

class YoutubeDataModel {
  final String fileSize;
  final String fileType;
  final int width;
  final int height;
  final String qualityLabel;
  final String url;
  final String audioQuality;
  YoutubeDataModel.fromJson(Map<String, dynamic> json)
      : fileSize = filesize(json['contentLength']),
        fileType = json['mimeType'].toString().split(';')[0],
        width = json['width']??0,
        height = json['height']??0,
        qualityLabel = json['qualityLabel'] ?? '',
        audioQuality = json['audioQuality'] ?? '',
        url = json['url'];
}
