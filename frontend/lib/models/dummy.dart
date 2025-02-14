import 'package:frontend/models/component.dart';

// Contains a dummy list of component data
final List<Component> dummyData = [
  const Component(
    name: "Raspberry Pi-5",
    available: 4,
    totalCount: 10,
    id: 1,
    datasheetLink: "nothing",
    description: "The latest microcontroller from the Raspberry Pi foundation",
    imageURL: "lib/assets/images/pi-5.jpg",
    position: [10, 4, 3],
  ),
  const Component(
    name: "Raspberry Pi-4b",
    available: 10,
    totalCount: 15,
    id: 2,
    datasheetLink: "nothing",
    description: "One of the older versions(I suppose), the Raspberry Pi 4b",
    imageURL: "lib/assets/images/pi-4b.jpg",
    position: [8, 2, 1],
  ),
  const Component(
    name: "Arduino Mega",
    available: 3,
    totalCount: 8,
    id: 3,
    datasheetLink: "nothing",
    description:
        "The Arduino Mega, a scaled version of the Arduino Uno. One good thing about it is that it has several digital and analog connectors.",
    imageURL: "lib/assets/images/mega.jpg",
    position: [10, 2, 5],
  ),
  const Component(
    name: "Nano",
    available: 20,
    totalCount: 25,
    id: 4,
    datasheetLink: "nothing",
    description:
        "The Nano is a much more compact version of the Arduino Uno, and Micropython can also be used to program the board.",
    imageURL: "lib/assets/images/nano.jpg",
    position: [10, 2, 9],
  ),
  const Component(
    name: "Pico",
    available: 20,
    totalCount: 30,
    id: 5,
    datasheetLink: "nothing",
    description:
        "The Pico is somewhat similar to the Nano and can also be programmed using Micropython.",
    imageURL: "lib/assets/images/pico.jpg",
    position: [10, 3, 1],
  ),
];
