# NSBundle additions

## Accessing plist

Wrapper to access plist.

```objc
[NSBundle plistPathForResource:@"errors"];  // assume main bundle
[NSBundle plistPathForResource:@"errors" inBundleOfClass:[self class]];
```
