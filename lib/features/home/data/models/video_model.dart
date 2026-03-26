class VideoModel {
  final String id;
  final String title;
  final String videoId;
  final String thumbnail;
  final int views;
  final int likes;
  final DateTime uploadDate;
  final String? channelName;
  final String? channelAvatar;
  final String? duration;
  final String description;

  VideoModel({
    required this.id,
    required this.title,
    required this.videoId,
    required this.thumbnail,
    required this.views,
    required this.likes,
    required this.uploadDate,
    this.channelName,
    this.channelAvatar,
    this.duration,
    this.description = '',
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    id: json['id'].toString(),
    title: json['title'],
    videoId: json['video_id'],
    thumbnail: json['thumbnail'] ?? 'https://img.youtube.com/vi/${json['video_id']}/mqdefault.jpg',
    views: json['views'] ?? 0,
    likes: json['likes'] ?? 0,
    uploadDate: json['upload_date'] != null
        ? DateTime.parse(json['upload_date'])
        : DateTime.now(),
    channelName: json['channel_name'],
    channelAvatar: json['channel_avatar'],
    duration: json['duration'],
    description: json['description'] ?? '',
  );

  // Sample videos
  static List<VideoModel> getSampleVideos() {
    return [
      VideoModel(
        id: '1',
        title: 'Build Flutter Apps Fast with Riverpod, Firebase, Hooks, and Freezed Architecture',
        videoId: 'vrPk6LB9bjo',
        thumbnail: 'https://img.youtube.com/vi/vrPk6LB9bjo/mqdefault.jpg',
        views: 125000,
        likes: 3200,
        uploadDate: DateTime.now().subtract(const Duration(days: 5)),
        channelName: 'Flutter Explained',
        duration: '15:23',
        description: 'Learn how to build Flutter applications quickly using modern state management solutions like Riverpod, Firebase for backend, Hooks for cleaner code, and Freezed for immutable data classes.',
      ),
      VideoModel(
        id: '2',
        title: 'Flutter Instagram Stories',
        videoId: 'ilX5hnH8XoI',
        thumbnail: 'https://img.youtube.com/vi/ilX5hnH8XoI/mqdefault.jpg',
        views: 89000,
        likes: 2100,
        uploadDate: DateTime.now().subtract(const Duration(days: 12)),
        channelName: 'Flutter Tutorials',
        duration: '12:45',
        description: 'Create Instagram stories feature in Flutter with animations and gestures.',
      ),
      VideoModel(
        id: '3',
        title: 'Flutter Netflix Clone Responsive UI Tutorial | Web and Mobile',
        videoId: 'rJKN_880b-M',
        thumbnail: 'https://img.youtube.com/vi/rJKN_880b-M/mqdefault.jpg',
        views: 210000,
        likes: 5400,
        uploadDate: DateTime.now().subtract(const Duration(days: 20)),
        channelName: 'Code With Me',
        duration: '25:30',
        description: 'Build a complete Netflix clone with responsive UI that works on web, mobile, and tablet.',
      ),
      VideoModel(
        id: '4',
        title: 'Flutter Facebook Clone Responsive UI Tutorial | Web and Mobile',
        videoId: 'HvLb5gdUfDE',
        thumbnail: 'https://img.youtube.com/vi/HvLb5gdUfDE/mqdefault.jpg',
        views: 187000,
        likes: 4800,
        uploadDate: DateTime.now().subtract(const Duration(days: 28)),
        channelName: 'Code With Me',
        duration: '28:15',
        description: 'Create a Facebook clone with news feed, stories, and responsive design.',
      ),
      VideoModel(
        id: '5',
        title: 'Flutter Chat UI Tutorial | Apps From Scratch',
        videoId: 'h-igXZCCrrc',
        thumbnail: 'https://img.youtube.com/vi/h-igXZCCrrc/mqdefault.jpg',
        views: 67000,
        likes: 1500,
        uploadDate: DateTime.now().subtract(const Duration(days: 35)),
        channelName: 'Flutter Basics',
        duration: '18:42',
        description: 'Build a beautiful chat UI with Flutter from scratch.',
      ),
    ];
  }
}