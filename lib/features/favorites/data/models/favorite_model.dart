class FavoriteModel {
  final String id;
  final String videoId;
  final String userId;
  final DateTime createdAt;

  FavoriteModel({
    required this.id,
    required this.videoId,
    required this.userId,
    required this.createdAt,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
    id: json['id'],
    videoId: json['video_id'],
    userId: json['user_id'],
    createdAt: DateTime.parse(json['created_at']),
  );
}