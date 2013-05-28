//
//  RandomAppDelegate.m
//  Random
//
//  Created by raccoony on 13. 5. 22..
//  Copyright (c) 2013년 raccoony. All rights reserved.
//

#import "RandomAppDelegate.h"
#include <stdlib.h>

@implementation RandomAppDelegate

@synthesize lowestNumber = _lowestNumber;
@synthesize highestNumber = _highestNumber;
@synthesize textField = _textField;
@synthesize numberField = _numberField;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    srandom((unsigned)time(NULL));
}

- (IBAction)generate:(id)sender
{
    int generated;
    int highestNumber = [_highestNumber intValue];
    int lowestNumber = [_lowestNumber intValue];
    
//    if (highestNumber > INT_MAX) {
//        NSString *string = [NSString stringWithFormat:@"! Highest number should be less than\n%d.", INT_MAX];
//        [_textField setStringValue:string];
//        return;
//    }
//    if (lowestNumber < INT_MIN) {
//        NSString *string = [NSString stringWithFormat:@"! Lowest number should be bigger than\n%d.", INT_MIN];
//        [_textField setStringValue:string];
//        return;
//    }    
    if (highestNumber < lowestNumber) {
        NSString *string = [NSString stringWithFormat:@"! Highest number should be bigger than\nlowest number."];
        [_textField setStringValue:string];
        return;
    }

    generated = lowestNumber + arc4random() % (highestNumber - lowestNumber + 1);
    
    NSLog(@"low = %d, high = %d", lowestNumber, highestNumber);
    NSLog(@"generated = %d", generated);
    
    NSString *string = [NSString stringWithFormat:@"3. Cmd + Shift + C\nRandom number copy to clipboard"];
    [_textField setStringValue:string];
    NSString *randomNumber = [NSString stringWithFormat:@"%d", generated];
    [_numberField setStringValue:randomNumber];
}

- (IBAction)copyRandomNumber:(id)sender {
    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
    [pasteboard clearContents];
    
    int randomNumber = [_numberField intValue];
    [pasteboard setString:[NSString stringWithFormat:@"%d", randomNumber] forType:NSStringPboardType];
    NSLog(@"%d is copy to clipboard", randomNumber);
}

@end