class Destination {
  final String name;
  final String image;
  final double rating;
  final String location;
  final String id;
  final double pricePerperson;
  final String description;
  bool isFavorite;

  Destination(
      {required this.name,
      required this.image,
      required this.rating,
      required this.location,
      required this.id,
      required this.pricePerperson,
      required this.description,
      this.isFavorite = false});
}

final List<Destination> destinations = [
  Destination(
      id: '1',
      name: 'Eiffel Tower',
      image:
          'https://images.pexels.com/photos/1530259/pexels-photo-1530259.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      location: 'Paris, France',
      rating: 4.7,
      pricePerperson: 100.0,
      description:
          "Destination places are the heart of travel experiences, offering a diverse range of attractions and opportunities for exploration. From bustling metropolises teeming with cultural and historical landmarks to serene natural wonders like pristine beaches and majestic mountains, each destination has its own unique charm. These places provide a chance to step outside of our daily routines, immerse ourselves in different cultures, broaden our horizons, and create lasting memories. Whether seeking adventure, relaxation, or cultural immersion, the world is filled with countless destinations waiting to be discovered and explored."),
  Destination(
      id: '2',
      name: 'Dubai',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/c/cc/Dubai_Skylines_at_night_%28Pexels_3787839%29.jpg',
      location: 'United Arab Emirates',
      rating: 4.5,
      pricePerperson: 200.0,
      description:
          "Destination places are the heart of travel experiences, offering a diverse range of attractions and opportunities for exploration. From bustling metropolises teeming with cultural and historical landmarks to serene natural wonders like pristine beaches and majestic mountains, each destination has its own unique charm. These places provide a chance to step outside of our daily routines, immerse ourselves in different cultures, broaden our horizons, and create lasting memories. Whether seeking adventure, relaxation, or cultural immersion, the world is filled with countless destinations waiting to be discovered and explored."),
  Destination(
      id: '3',
      name: 'Everest Base Camp',
      image:
          'https://images.pexels.com/photos/14981339/pexels-photo-14981339/free-photo-of-a-man-standing-on-gray-rock.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      location: 'Nepal, Asia',
      rating: 4.5,
      pricePerperson: 30.0,
      description:
          "Destination places are the heart of travel experiences, offering a diverse range of attractions and opportunities for exploration. From bustling metropolises teeming with cultural and historical landmarks to serene natural wonders like pristine beaches and majestic mountains, each destination has its own unique charm. These places provide a chance to step outside of our daily routines, immerse ourselves in different cultures, broaden our horizons, and create lasting memories. Whether seeking adventure, relaxation, or cultural immersion, the world is filled with countless destinations waiting to be discovered and explored."),
  Destination(
      id: '4',
      name: 'St. Paul Cathedral',
      image:
          'https://images.pexels.com/photos/2425694/pexels-photo-2425694.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      location: 'London, UK',
      rating: 4.5,
      pricePerperson: 50.0,
      description:
          "Destination places are the heart of travel experiences, offering a diverse range of attractions and opportunities for exploration. From bustling metropolises teeming with cultural and historical landmarks to serene natural wonders like pristine beaches and majestic mountains, each destination has its own unique charm. These places provide a chance to step outside of our daily routines, immerse ourselves in different cultures, broaden our horizons, and create lasting memories. Whether seeking adventure, relaxation, or cultural immersion, the world is filled with countless destinations waiting to be discovered and explored."),
  Destination(
      id: '5',
      name: 'Lake Louise',
      image:
          'https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&w=600',
      location: 'Alberta, Canada',
      rating: 4.5,
      pricePerperson: 50.0,
      description:
          "Destination places are the heart of travel experiences, offering a diverse range of attractions and opportunities for exploration. From bustling metropolises teeming with cultural and historical landmarks to serene natural wonders like pristine beaches and majestic mountains, each destination has its own unique charm. These places provide a chance to step outside of our daily routines, immerse ourselves in different cultures, broaden our horizons, and create lasting memories. Whether seeking adventure, relaxation, or cultural immersion, the world is filled with countless destinations waiting to be discovered and explored."),
];
