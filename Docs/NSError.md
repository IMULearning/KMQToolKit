# NSError additions

`KMQToolKit` has a convention over configuration way of dealing with `NSError`. In short, it allows using a `plist` file to declare error domains, error codes and the user info associated with it.

## Setup

`KMQToolKit` introduces a bootstrap setup method on `NSError`: `+setupToolKitWithDefaultErrorDomain:errorPList:defaultErrorKey:fallbackErrorMessage`. It tells the toolkit how to use the information defined in the `plist` file.

A sample setup looks like:

```objc
#import <KMQToolKit/NSError+KMQToolKit.h>

[NSError setupToolKitWithDefaultErrorDomain:@"BlocQuery"
                                 errorPList:[[NSBundle mainBundle] pathForResource:@"errors" ofType:@"plist"]
                            defaultErrorKey:@"recovery"
                       fallbackErrorMessage:@"Oops..."];
```

- defaultErrorDomain: useful when calling shorthand methods like `+errorForCode:`, which resolves the error domain using the define default error domain.
- errorPList: the filepath to the error plist definition
- defaultErrorKey: the key in `- userInfo` of `NSError` that we use in resolving `- defaultErrorMessage`
- fallbackErrorMessage: the error message to return if `userInfo` did not resolve the specified key.

A sample plist looks like:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<!--
   Error.plist
   BlocQuery

   Created by Weinan Qiu on 2015-10-16.
   Copyright (c) 2015 Kumiq. All rights reserved.
-->
<plist version="1.0">
    <dict>
      <key>Parse</key>
      <dict>
        <key>101:login</key>
  			<dict>
  				<key>description</key>
  				<string>Login failed.</string>
  				<key>reason</key>
  				<string>Login parameters are invalid.</string>
  				<key>recovery</key>
  				<string>Oops! We did not find your account. Please make sure email and password are correct.</string>
  			</dict>
      </dict>
      <key>BlocQuery</key>
      <dict>
        <key>TextInsufficientLength:*</key>
        <dict>
          <key>description</key>
  				<string>Text validation failed</string>
  				<key>reason</key>
  				<string>Insufficient length</string>
  				<key>recovery</key>
  				<string>Please provide a question of at least {{count}} characters.</string>
        </dict>
      </dict>
    </dict>
</plist>
```

The above `plist` can be templated as:

```xml
<plist version="1.0">
    <dict>
      <key>${errorDomain}</key>
      <dict>
        <key>${errorCode}:${context}</key>
  			<dict>
  				${arbitary key value for userInfo}
  			</dict>
      </dict>
    </dict>
</plist>
```

- errorDomain: corresponds to the `domain` attribute of `NSError`
- errorCode: corresponds to the `code` attribute of `NSError`. In addition, with the help of the [errorcodegen.groovy](https://github.com/davidiamyou/KMQCocoaCodeGen/blob/master/errorcodegen.groovy) script of [KMQCocoaCodeGen](https://github.com/davidiamyou/KMQCocoaCodeGen), you will be able to use descriptive strings to define your error codes and a enumeration as well as the mapping information will be generated for you. See [Code Generation](#code-generation) for more details.
- context: an arbitary string defined by the user to more accurately define the context of the error. For instance, a `UserNotFound` error has different meanings to the user if it happened during `Login` or a general `UserLookup` operation. Using the context enables definition of different error messages for the same `errorCode`. If the `errorCode` applies to all context, use `*`.
- arbitary key value: the dictionary will be resolved into `userInfo`. Use `<string>` only for the value. You can include templated variables using `{{}}`.

**Note** If you wish to use textual error codes without code generation, please define a class method on `NSError` called `errorNameCodeMapping` returning an `NSDictionary`. It should map textual code names to a _non-taken_ integer, which you can later on use when resolving the error.

## Usage

After being setup, one can use the toolkit in two ways.

First, resolve self defined errors:

```objc
NSError *error = [NSError errorForCode:100];

NSError *error = [NSError errorForCode:200
                               context:nil
                            parameters:@{@"count": @(5)}];

NSString *errorMessage = [NSError messageForCode:300]);
```

Second, one can translate third party errors and give it app-related messages.

```objc
NSError *thirdpartyError = [NSError errorWithDomain:@"Parse" code:200 userInfo:nil];
NSError *appError = [NSError errorFromError:thirdpartyError];
```

## Code Generation

As mentioned before, the [errorcodegen.groovy](https://github.com/davidiamyou/KMQCocoaCodeGen/blob/master/errorcodegen.groovy) script of [KMQCocoaCodeGen](https://github.com/davidiamyou/KMQCocoaCodeGen) can allow definition of text based error codes. It generates three things:

- String constants for all the error domains defined.
- Enumeration for all the text based error codes (it will avoid using already defined numeric error codes)
- an `NSDictionary` class method on `NSError` called `errorNameCodeMapping` used by the toolkit to map names back to codes.

First, ensure [Groovy](http://www.groovy-lang.org) is installed.

```bash
curl -s get.gvmtool.net | bash
source "$HOME/.gvm/bin/gvm-init.sh"
gvm install groovy
groovy -version
```

Second, clone and run the script

```bash
git clone https://github.com/davidiamyou/KMQCocoaCodeGen.git
cd KMQCocoaCodeGen
chmod +x errorcodegen.groovy
./errorcodegen -x MySourcePrefix -p /path/to/the/error/plist /path/to/the/generated/file
```

Third, include the generated files in your project. For instance, in the precompiled header.

More details is described in [KMQCocoaCodeGen](https://github.com/davidiamyou/KMQCocoaCodeGen).
