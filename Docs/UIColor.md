# UIColor additions

`KMQToolKit` adds several additions to `UIColor`, including hex representation, palette and a convention over configuration way of defining colors in your app.

## Hex colors

Create a `UIColor` with hex string. The hex string can work with or without `#`.

```objc
UIColor *googleBlue = [UIColor hexColor:@"#0266C8" alpha:1.0];
```

## Color Palette `KMQColorPalette`

Register `UIColor` with the color palette and retrieve them with registered names.

```objc
UIColor *googleBlue = [UIColor hexColor:@"#0266C8" alpha:1.0];
UIColor *googleRed = [UIColor hexColor:@"#F90101" alpha:1.0];
[KMQColorPalette addColor:googleBlue forName:@"primary"];
[KMQColorPalette addColor:googleRed forName:@"danger"];

...

[KMQColorPalette colorForName:@"primary"];
```

## Color declaration

`KMQToolKit` provides a way to define colors in a `plist` file. Upon setup, all the colors defined will be read into the `KMQColorPalette` can be ready to use.

### Setup

```objc
NSString *colorsPlistPath = [[NSBundle mainBundle] pathForResource:@"colors" ofType:@"plist"];
[UIColor setupColorPalleteWithContentsOfFile:colorsPlistPath keyInFile:@"colors"];
```
**Note**

With the addition of `NSBundle+KMQToolKit`, the code can be simplified to
```objc
[UIColor setupColorPalleteWithContentsOfFile:[NSBundle plistPathForResource:@"colors"] keyInFile:@"colors"];
```

The `keyInFile` identifies the key where the color dictionary is located in the plist file. It can be delimited by `.` if the dictionary
is located several levels down.

### Plist format

A color can either be defined as a simple hex string, which its alpha will be assumed to be `1.0` or `255` on a 0-255 scale. Or it can be a dictionary with `color` and `alpha` as keys. The `alpha` value will be between 0 and 255.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>colors</key>
	<dict>
		<key>sampleColor2</key>
		<dict>
			<key>color</key>
			<string>#cccccc</string>
			<key>alpha</key>
			<integer>200</integer>
		</dict>
		<key>sampleColor1</key>
		<string>#000000</string>
	</dict>
</dict>
</plist>
```
