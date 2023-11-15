class FikeData {
  final String location;
  final String img;
  final String description;

  FikeData(
      {required this.location, required this.img, required this.description});
}

List<FikeData> fikeData = [
  FikeData(
      location: 'Samarqand',
      img: 'https://uzbekistan.travel/storage/app/media/nargiza/cropped-images/IMG_0797-0-0-0-0-1592377550.jpg',
      description: 'Madaniyatlar chorrahasi'),FikeData(
      location: 'Toshkent',
      img: 'https://uzbekistan.travel/storage/app/media/citys/5e53c06ca0049049451193.jpg',
      description: 'Zamonaviy megapolis'), FikeData(
      location: 'Zomin',
      img: 'https://uzbekistan.travel/storage/app/media/nargiza/cropped-images/zaamin-0-0-0-0-1592480374.jpg',
      description: 'O‘zbek Shveytsariyasi'),
];
