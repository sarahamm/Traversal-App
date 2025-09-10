import 'package:favorite_places/generated/l10n.dart';
import 'package:favorite_places/models/place.dart';

final placesData = [
  Place(
    title: S().italy,
    subTitle: S().italySubTitle,
    flags: [S().visited, S().favouritePlaces],
    tags: [S().vacation, S().discoverNewCulture],
    imageUrl: 'assets/italy.jpg',
    description: S().italyDescription,
    imageGallary: [
      'https://images.pexels.com/photos/20659015/pexels-photo-20659015.jpeg?_gl=1*13waedy*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM2OTIwNTIkbzUkZzEkdDE3NTM2OTI2NDEkajU5JGwwJGgw',
      'https://images.pexels.com/photos/31000624/pexels-photo-31000624.jpeg?_gl=1*1smtk1a*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM2OTIwNTIkbzUkZzEkdDE3NTM2OTM0NDAkajU4JGwwJGgw',
      'https://images.pexels.com/photos/12954051/pexels-photo-12954051.jpeg?_gl=1*176xbpc*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM2OTIwNTIkbzUkZzEkdDE3NTM2OTM3MDkkajU5JGwwJGgw',
    ],//43.18930493398091, 12.182465329566362
    location: PlaceLocation(latitude: 43.18930493398091, longitude: 12.182465329566362),
  ),
  Place(
    title: S().japan,
    subTitle: S().japanSubTitle,
    flags: [S().wantToVisit],
    tags: [S().adventure, S().discoverNewCulture],
    imageUrl: 'assets/japan.jpg',
    description: S().japanDescription,
    imageGallary: [
      'https://images.pexels.com/photos/10998140/pexels-photo-10998140.png?_gl=1*nv1s8p*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM3MDc5OTIkbzckZzEkdDE3NTM3MDgxMjckajUyJGwwJGgw',
      'https://images.pexels.com/photos/3250576/pexels-photo-3250576.jpeg?_gl=1*13ad660*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM3MDc5OTIkbzckZzEkdDE3NTM3MDgxNzQkajUkbDAkaDA.',
      'https://images.pexels.com/photos/31366095/pexels-photo-31366095.jpeg?_gl=1*weisgc*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM3MDc5OTIkbzckZzEkdDE3NTM3MDgyMTAkajUxJGwwJGgw',
    ],
    location: PlaceLocation(latitude: 36.2048, longitude: 138.2529),
  ),
  Place(
    title: S().southAfrica,
    subTitle: S().southAfricaSubTitle,
    flags: [S().planned],
    tags: [S().adventure, S().vacation],
    imageUrl: 'assets/south_africa.jpg',
    description: S().southAfricaDescription,
    imageGallary: [
      'https://images.pexels.com/photos/25863486/pexels-photo-25863486.jpeg?_gl=1*gw2xa6*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM3MDc5OTIkbzckZzEkdDE3NTM3MDgyNjIkajYwJGwwJGgw',
      'https://images.pexels.com/photos/6552201/pexels-photo-6552201.jpeg?_gl=1*pgwdwp*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM3MDc5OTIkbzckZzEkdDE3NTM3MDgyOTUkajI3JGwwJGgw',
      'https://images.pexels.com/photos/11803024/pexels-photo-11803024.jpeg?_gl=1*1qa351m*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM3MDc5OTIkbzckZzEkdDE3NTM3MDgzNzUkajE0JGwwJGgw',
    ],
    location: PlaceLocation(latitude: -30.5595, longitude: 22.9375),
  ),
  Place(
    title: S().canada,
    subTitle: S().canadaSubTitle,
    flags: [S().favouritePlaces],
    tags: [S().vacation, S().jobTrip],
    imageUrl: 'assets/canada.jpg',
    description: S().canadaDescription,
    imageGallary: [
      'https://images.pexels.com/photos/756790/pexels-photo-756790.jpeg?_gl=1*1uoti4f*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM4ODMwOTUkbzEyJGcxJHQxNzUzODgzMTA0JGo1MSRsMCRoMA..',
      'https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?_gl=1*i4b91t*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM4ODMwOTUkbzEyJGcxJHQxNzUzODgzMTQzJGoxMiRsMCRoMA..',
      'https://images.pexels.com/photos/1750754/pexels-photo-1750754.jpeg?_gl=1*sny85l*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM4ODMwOTUkbzEyJGcxJHQxNzUzODgzMTUyJGozJGwwJGgw',
    ],
    location: PlaceLocation(latitude: 56.1304, longitude: -106.3468),
  ),
  Place(
    title: S().brazil,
    subTitle: S().brazilSubTitle,
    flags: [S().visited],
    tags: [S().adventure, S().discoverNewCulture],
    imageUrl: 'assets/brazil.jpg',
    description: S().brazilDescription,
    imageGallary: [
      'https://images.pexels.com/photos/351283/pexels-photo-351283.jpeg?_gl=1*zs0a6u*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM4ODMwOTUkbzEyJGcxJHQxNzUzODgzMjE2JGo0OCRsMCRoMA..',
      'https://images.pexels.com/photos/1804177/pexels-photo-1804177.jpeg?_gl=1*1n0sgob*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM4ODMwOTUkbzEyJGcxJHQxNzUzODgzMjI0JGo0MCRsMCRoMA..',
      'https://images.pexels.com/photos/97906/pexels-photo-97906.jpeg?_gl=1*1jmi*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM4ODMwOTUkbzEyJGcxJHQxNzUzODgzMjMyJGozMiRsMCRoMA..',
    ],
    location: PlaceLocation(latitude: -14.2350, longitude: -51.9253),
  ),
  Place(
    title: S().france,
    subTitle: S().franceSubtitle,
    flags: [S().wantToVisit],
    tags: [S().vacation, S().discoverNewCulture],
    imageUrl: 'assets/france.jpg',
    description: S().franceDesciption,
    imageGallary: [
      'https://images.pexels.com/photos/2363/france-landmark-lights-night.jpg?_gl=1*5gkzzf*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM4ODMwOTUkbzEyJGcxJHQxNzUzODgzMzAzJGo1MyRsMCRoMA..',
      'https://images.pexels.com/photos/548077/pexels-photo-548077.jpeg?_gl=1*k1jgs*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM4ODMwOTUkbzEyJGcxJHQxNzUzODgzMzExJGo0NSRsMCRoMA..',
      'https://images.pexels.com/photos/161901/paris-sunset-france-monument-161901.jpeg?_gl=1*47ityo*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM4ODMwOTUkbzEyJGcxJHQxNzUzODgzMzI5JGoyNyRsMCRoMA..',
    ],
    location: PlaceLocation(latitude: 46.6034, longitude: 1.8883),
  ),
  Place(
    title: S().thailand,
    subTitle: S().thailandSubTitle,
    flags: [S().planned, S().favouritePlaces],
    tags: [S().vacation, S().adventure],
    imageUrl: 'assets/thailand.jpg',
    description: S().thailandDescription,
    imageGallary: [
      'https://images.pexels.com/photos/358229/pexels-photo-358229.jpeg?_gl=1*13j6qj3*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM4ODMwOTUkbzEyJGcxJHQxNzUzODgzNDIwJGoxNiRsMCRoMA..',
      'https://images.pexels.com/photos/1929611/pexels-photo-1929611.jpeg?_gl=1*riu0n2*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM4ODMwOTUkbzEyJGcxJHQxNzUzODgzNDA5JGoyNyRsMCRoMA..',
      'https://images.pexels.com/photos/472309/pexels-photo-472309.jpeg?_gl=1*j7cdh*_ga*MTU0OTA4MTAzLjE3NTMwMDgxOTA.*_ga_8JE65Q40S6*czE3NTM4ODMwOTUkbzEyJGcxJHQxNzUzODgzMzg5JGo0NyRsMCRoMA..',
    ],
    location: PlaceLocation(latitude: 15.8700, longitude: 100.9925),
  ),
];
