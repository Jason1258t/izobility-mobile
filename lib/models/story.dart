class Story {
  Story(
      {required this.title,
      required this.subtitle,
      required this.imageUrl,
      required this.duration,
      this.buttonUrl});

  final String title;
  final String subtitle;
  final String imageUrl;
  final Duration duration;
  final String? buttonUrl;
}
