<h1 align="center" xmlns="http://www.w3.org/1999/html">
  <br>
   <img src="https://github.com/iamSahdeep/liquid_button/blob/master/Assets/topImage.png" alt="Logo Liquid Button" title="Liquid Button" />
  <br>
</h1>
<p align="center">
 <a href="https://github.com/iamSahdeep/liquid_button/releases" <img height="20" alt="GitHub All Releases" src="https://img.shields.io/github/downloads/iamSahdeep/liquid_button/total.svg?style=for-the-badge"></a>
 <a href="https://pub.dev/packages/liquid_button"> <img height="20" alt="Pub" src="https://img.shields.io/pub/v/liquid_button.svg?style=for-the-badge"></a>
 <a href="https://github.com/iamSahdeep/liquid_swipe_button/blob/master/LICENSE"><img src="https://img.shields.io/badge/license-APACHE2.0-blue.svg?longCache=true&style=flat-square"></a>
   <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Built%20for-Flutter-blue.svg?longCache=true&style=flat-square" "></a>
</p>

<p align="center">
  Hi, Introducing Liquid Button for Flutter. It supports Web and Mobile, not tested on Ios. Inspired by <a href="https://codepen.io/electerious/pen/gOOLgjd">Liquid Button in JS</a>.
</p>

## Preview
<p align="center">
<img src="https://github.com/iamSahdeep/liquid_button/blob/master/Assets/exampleMobile.gif" width="360" height="640">
</p>


## Live Demo

Download sample apk as shown in example from releases.

<a href='https://github.com/iamSahdeep/liquid_button/releases'><img alt='Get it from Github Releases' src='https://i0.wp.com/dimitrology.com/wp-content/uploads/2017/02/download-apk.png?resize=172%2C100&ssl=1' width="200" height="100"/></a>


Experience Live Demo on (not on mobile) : https://iamsahdeep.github.io/liquid_button/#/


## Getting Started
* Add this to your pubspec.yaml
  ```
  dependencies:
  liquid_button: 1.0.0

  ```
* Get the package from Pub:

  ```
  flutter packages get
  ```
* Import it in your file

  ```
  import 'package:liquid_button/liquid_button.dart';
  ```

# Example
- Look for complete example in [example](https://github.com/iamSahdeep/liquid_button/blob/master/example) folder.
- Remember to wrap it with GestureDetector or InkWell, might include in next version.

```
                LiquidButton(
                  expandFactor: 20,
                  backgroundColor: Colors.black87,
                  height: 100,
                  child: Text(
                    "Liquid Button",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  gradientColor: Colors.black54,
                  width: 400,
                ),
```

## Attributes
Currently we have 3 buttons : RoundClothButton(poor naming :p), ClothButton and LiquidButton.
Here are some of the attributes in which height,width and background color is the required. Rest can be left to have default values.
* **expandFactor** : (double) Allows you to decide Expansion of the button while animating. Should be less than 50.
* **backgroundColor** : (Color) Color of the button.
* **gradientColor** : (Color) If you want gradient effect onHover, if not given no color effect will be there.
* **retainGradient** : (bool) If you want to retain the gradient effect when mouse leaves the button area. Default is false.
* **gap** : (int) Integer to provide gap between subsequent point while painting the line. Do experiment with it, Should not be greater that height/2.

# Known Issues

   * **Lag on Web** - It generally happens when we are using multiple Liquid Buttons on same screen due to usage of `MouseRegion`.You might experience the same on the live demo also. Check this issue https://github.com/flutter/flutter/issues/41194
   * **Gesture not working on Web on Mobile** - Need to work on it..
   * **Note** : Please report any kind of bugs you are experiencing.


## Author & support
This project is created by [Sahdeep Singh](https://github.com/iamSahdeep) but with lots of support and help.
> If you appreciate my work, consider buying me a cup of :coffee: to keep me recharged :metal:
>  + [PayPal](https://www.paypal.me/sahdeep)
> 
> Or you can also endorse me on [LinkedIn](https://www.linkedin.com/in/iamsahdeep/) to keep me motivated.
> 
> I love my work and I'm available for freelance work. Contact me on my email: sahdeepsingh98@gmail.com


<img src="https://cdn-images-1.medium.com/max/1200/1*2yFbiGdcACiuLGo4dMKmJw.jpeg" width="90" height="35">
