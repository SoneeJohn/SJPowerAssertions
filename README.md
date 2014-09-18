SJPowerAssertions
=================

## Requirements
- Runs on OS X 10.8 and later
- IOKit
- **Note:** Was tested on OS X but, should work on iOS.

#What is a Power Assertion?
- They allow user-requested work to complete (e.g. The user requested some large files to be processed)
- Assertions can prevent idle sleep
- Assertions can prevent idle display sleep
- It's a hint to OS X

#Why should I use SJPowerAssertions?

- It is more readable.
- Makes it easier and more straightforward to use Power Assertions.
- It is just simply an awesome way in creating power assertions.


## Usage

```
#import <SJPowerAssertions/SJPowerAssertions.h>

```

## Creating a Power Assertion
```objc

//Create a SJPowerAssertions Object
SJPowerAssertions *assertionTest = [SJPowerAssertions defaultAssertion];

[assertionTest createPowerAssertion:@"name of the activity (e.g. Downloading video files" assertionType:SJPowerAssertionsPreventIdleSleep completionHandler:^(NSError *error) {

if (error == nil) {
// No error

/**
There are two assertion types you may use:
- SJPowerAssertionsPreventIdleSleep: Will cause the system from idle sleeping. Note: The display may idle sleep, if you do not want the display to idle sleep use "SJPowerAssertionsPreventDisplayIdleSleep

- SJPowerAssertionsPreventDisplayIdleSleep: Will cause the system's display from idle sleeping

*/



} else{

//Handle Error
}

}];

```

## Stop holding an assertion

```objc

SJPowerAssertions *assertionTest = [SJPowerAssertions defaultAssertion];

//Release/stop holding the assertion
[assertionTest stopHoldingAssertion];

```
## License

SJYouTubeIDParser is available under the MIT license. See the [LICENSE](https://github.com/SoneeJohn/SJPowerAssertions/blob/master/LICENSE) file for more information.