SJPowerAssertions
=================
A simple API for working with power assertions.

## Requirements
- Runs on OS X 10.8 and later

# What is a Power Assertion?
- They allow user-requested work to complete (e.g. The user requested some large files to be processed)
- Assertions can prevent idle sleep
- Assertions can prevent idle display sleep
- It's a hint to OS X

# Why should I use SJPowerAssertions?

- It is more readable.
- Makes it easier and more straightforward to use Power Assertions.
- It is just simply an awesome way for creating power assertions.
- More flexible than using other methods.

## Available methods

```objc

//Block method
-(void)createPowerAssertion:(NSString *)description assertionType:(SJPowerAssertionType)assertionType completionHandler:(void (^) (NSError *error, unsigned int *assertionID))completionHandler;

//Other method
-(void)createPowerAssertion:(NSString *)description assertionType:(SJPowerAssertionType)assertionType;

//Time based methods
-(void)createPowerAssertion:(NSString *)description startHoldingAssertionAfter:(NSTimeInterval)time assertionType:(SJPowerAssertionType)assertionType;
-(void)createPowerAssertion:(NSString *)description holdFor:(NSTimeInterval)time assertionType:(SJPowerAssertionType)assertionType;

//Method to quickly create a power assertion
-(void)createQuickPowerAssertion;

//Stop a assertion 
-(void)stopHoldingAssertion;

//Delegate Methods
- (void)assertionFailed:(SJPowerAssertions *)asssertion;
- (void)assertionDone:(SJPowerAssertions *)asssertion;


```


## Usage

```
#import <SJPowerAssertions/SJPowerAssertions.h>

```

## Creating a Power Assertion via the block method
```objc

//Create a SJPowerAssertions Object
SJPowerAssertions *assertionTest = [[SJPowerAssertions alloc]init];

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

## Creating a Power Assertion via the 'other' method
```objc


SJPowerAssertions *assertionTest = [[SJPowerAssertions alloc]init];

[assertionTest createPowerAssertion:@"Power Assertion Test prevent idle sleep" assertionType:SJPowerAssertionsPreventIdleSleep];

//Use the delegate methods to know if the assertion was created successfully

```

## Stop holding an assertion

```objc

SJPowerAssertions *assertionTest = [[SJPowerAssertions alloc]init];

//Release/stop holding the assertion
[assertionTest stopHoldingAssertion];

```

## Delegates 

```objc
//Demo usage 
-(void)assertionDone:(SJPowerAssertions *)asssertion{

NSLog(@"Assertion creation process completed. The assertion ID is: %u, and the work description is: %@",asssertion.currentPowerAssertion, asssertion.assertionDescription);
}

-(void)assertionFailed:(SJPowerAssertions *)asssertion{
NSLog(@"Assertion creation process failed. The assertion ID is: %u, and the work description is: %@",asssertion.currentPowerAssertion, asssertion.assertionDescription);

}
```

**Note:** For more information please take a look at the demo project which demos all the available methods.
## License

SJPowerAssertions is available under the MIT license. See the [LICENSE](https://github.com/SoneeJohn/SJPowerAssertions/blob/master/LICENSE) file for more information.
