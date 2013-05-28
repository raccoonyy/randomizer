//
//  RandomAppDelegate.h
//  Random
//
//  Created by raccoony on 13. 5. 22..
//  Copyright (c) 2013년 raccoony. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RandomAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *lowestNumber;
@property (weak) IBOutlet NSTextField *highestNumber;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextField *numberField;

- (IBAction)generate:(id)sender;
- (IBAction)copyRandomNumber:(id)sender;
@end
