import 'package:frontend/models/component.dart';


//contains a dummy list of component data
final List<Component> dummyData = [
  const Component(
    name: "Raspberry Pi-5",
    available: 4,
    id: 56,
    datasheetLink: "nothing",
    description: "The latest microcontroller from the Raspberry Pi foundation",
    imageURL: "lib/assets/images/pi-5.jpg",
    position: [10,4,3],
  ),
  const Component(
    name: "Raspberry Pi-4b",
    available: 10,
    id: 56,
    datasheetLink: "nothing",
    description: "One of the older versions(I suppose), the raspberry pi 4b",
    imageURL: "lib/assets/images/pi-4b.jpg",
    position: [8,2,1],
  ),
  const Component(
    name: "Arduino Mega",
    available: 3,
    id: 56,
    datasheetLink: "nothing",
    description:
        "The Arduino Mega, a scaled version of the arduino uno and one good thing about it, it has several digital and analog connectors",
    imageURL: "lib/assets/images/mega.jpg",
    position: [10,2,5],
  ),
  const Component(
    name: "Nano",
    available: 20,
    id: 56,
    datasheetLink: "nothing",
    description:
        "The Nano is much scaled down version of the arduino uno, and also micropython can be used to program the board",
    imageURL: "lib/assets/images/nano.jpg",
    position: [10,2,9],
  ),
  const Component(
    name: "Pico",
    available: 20,
    id: 56,
    datasheetLink: "nothing",
    description:
        "The Pico is somewhat similar to Nano itself, and micropython can also be used to program the board",
    imageURL: "lib/assets/images/pico.jpg",
    position: [10,3,1],
  ),
];
