# Validation additions

`KMQToolkit` provides basic validation tools and a protocol to build your own validation tools. The `KMQValidatorRegistry` can be used as a registrar which you can register validators by name globally.

## Usage

```objc
KMQNSStringValidator *commentValidator = [KMQNSStringValidator lengthBetweenMin:0 max:200];
KMQEmailValidator *emailValidator = [KMQEmailValidator validator];
[KMQValidatorRegistry registerValidator:commentValidator forKey:@"commentValidator"];
[KMQValidatorRegistry registerValidator:emailValidator forKey:@"emailValidator"];

...

NSArray *errors = nil;
[[KMQValidatorRegistry validatorForKey:@"emailValidator"] isValid:@"foo@bar.com" errors:&errors];
```

## Protocol

### `KMQValidator`
- `+ validator`
- `- isValid:errors:`

## Basic validators

### `KMQNSStringValidator`

#### options
- `allowNull`: whether `nil` is considered valid, default to `NO`
- `allowEmpty`: whether an empty string is considered valid, default to `NO`
- `trimBeforeValidation`: whether to trim the string before doing validation
- `minLength`: min length of string, default to 0
- `maxLength`: max length of string, default to `NSUIntegerMax`
- `disallowedCharacterSet`: `NSCharacterSet` of disallowed characters, default to `nil`
- `disallowedSubStrings`: an `NSArray` of disallowed `NSString`, default to `nil`
- `regularExpression`: an `NSRegularExpression` which will be matched, default to `nil`

#### preset
- `+ lengthBetweenMin:max:`
- `+ regex:`

### `KMQEmailValidator`

A special instance of `KMQNSStringValidator` that uses email regular expression to valid email.

### `KMQNSNumberValidator`

#### options
- `min`: a minimum of `NSNumber`, default to nil
- `min`: a maximum of `NSNumber`, default to nil

#### presets
- `+ valueBetweenMin:max:`

### `KMQNSArrayValidator`

#### options
- `allowNull`: whether `nil` is considered valid, default to `NO`
- `minSize`: minimum size of array, default to 0
- `maxSize`: maximum size of array, default to `NSUIntegerMax`
- `mandatoryElements`: mandatory elements that must appear in the array, default to `nil`
- `disallowedElements`: elements that must not appear in the array, default to `nil`

#### presets
- `+ arrayContainsElements:`

### `KMQNSDictionaryValidator`

#### options
- `allowNull`: whether `nil` is considered valid, default to `NO`
- `minSize`: minimum size of dictionary, default to 0
- `maxSize`: maximum size of dictionary, default to `NSUIntegerMax`
- `mandatoryKeys`: mandatory elements that must appear in the keys collection, default to `nil`
- `disallowedKeys`: elements that must not appear as key, default to `nil`

#### presets
- `+ dictionaryContainsKeys:`
