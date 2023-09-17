class Story {
  Story(
      {required this.title,
      required this.subtitle,
      required this.imageUrl,
      required this.duration,
      required this.index,
      required this.id,required this.previewUrl,
      this.buttonUrl});

  final String title;
  final String subtitle;
  final String imageUrl;
  final String previewUrl;
  final Duration duration;
  final String? buttonUrl;
  final int index;
  final String id;
}
