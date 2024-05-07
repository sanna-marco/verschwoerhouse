# verschwoerhouse
Example project for the app developer meetup in the Verschwörhaus Ulm - June 2024

## Structure
This repository holds three projects, one for each platform discussed on the meetup (Android, iOS and Flutter).
The Flutter project is the main one containing the majority of the business logic. It uses [Pigeon](https://pub.dev/packages/pigeon) 
to comunicate with the native counterpart.

Run `dart run pigeon --input pigeons/pigeon_topic.dart` inside the domain package to generate platform code. Afterwards, run 
`flutter build ios-framework --output=../topics_swiftui/topics/utility/flutter` on the flutter root folder to generate
iOS frameworks. For Android, run `flutter build aar` and follow the on-screen instructions.
