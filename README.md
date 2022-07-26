A scalable renderer for die faces from the boardgame Middara: Unintentional Malum.

<img src="https://github.com/swittman/middara_dice/blob/main/docs/example.png" width="30%" height="30%"/>

## Getting started

Add the following dependency and font to your pubspec.yaml
```
dependencies:
  flutter:
    sdk: flutter

  middara_dice:
    git:
      url: git://github.com/swittman/middara_dice.git
      ref: main
// ...

flutter:
  fonts:
    - family: Cinzel
      fonts:
        - asset: packages/middara_dice/fonts/Cinzel-Bold.ttf
    - family: MiddaraDice
      fonts:
        - asset: packages/middara_dice/fonts/MiddaraDice.ttf
```

Import the file with 
```
import "package:middara_dice/middara_dice.dart";
```

## Usage

* DieFace defaults to blank black die. All fields are optional.
* Change the die color with `color` and the icon/symbol color with `inkColor`. 
* Set the face's number with `number`. If a number is not set, the corner icons will be rendered larger.
* Set icons positionally with `iconTR` (top right), `iconBL` (bottom left), etc. using the enum `DieIcon`. 
* If *any* icon is set to `DieIcon.skull`, number and corner symbols will be ignored, instead showing a large skull icon in the center of the face.

```dart
const DieFace(
    color: Colors.red,
    number: 8,
    iconTR: DieIcon.shield,
    iconBL: DieIcon.book,
    iconBR: DieIcon.book,
),
```
See the examples for more detail.
