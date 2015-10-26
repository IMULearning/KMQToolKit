# UIAlertAction and UIAlertController additions

## Selector instead of handler block
```objc
UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                   style:UIAlertActionStyleDefault
                                                  object:self
                                                selector:@selector(okActionFired)];

- (void)okActionFired {
  NSLog(@"User pressed okay");
}
```

## Automatic dismissing alert controller
```objc
UIAlertController *alertController = ...
UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                       style:UIAlertActionStyleCancel
                                                  dismissing:alertController];
```

## Init alert controller with actions
```objc
UIAlertAction *ok = ...
UIAlertAction *cancel = ...
UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Choose"
                                                                         message:@"Choose"
                                                                  preferredStyle:UIAlertControllerStyleAlert
                                                                         actions: @[ok, cancel]];
```
