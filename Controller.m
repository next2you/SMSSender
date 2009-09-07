//
//  Created by Martin Pittenauer on Tue Oct 14 2003.
//  Copyright (c) 2003 TheCodingMonkeys. All rights reserved.
//

#import "Controller.h"
#import "SMSController.h"

@implementation Controller

- (id)init 
{
    self = [super init];
    return self;
}

- (IBAction)awakeFromNib;
{
    [smsText setStringValue:  @""];
	[phoneNumberDisplay setStringValue: phoneNumber];
    [[NSApplication sharedApplication] beginSheet:panel modalForWindow:[[NSApplication sharedApplication] mainWindow] modalDelegate:self didEndSelector:@selector(endPanel) contextInfo:nil];
}


- (IBAction)send:(id)sender {
    ABPerson *thePerson = [self person];
	
	[[SMSController sharedInstance] send: [smsText stringValue] to: phoneNumber];
    [[NSApplication sharedApplication] endSheet:panel];
}

- (IBAction)cancel:(id)sender
{
    [[NSApplication sharedApplication] endSheet:panel];
}

- (IBAction)configure:(id)sender
{
    [[NSApplication sharedApplication] endSheet:panel];
}

- (void)endPanel
{
	[panel orderOut:nil];
	[self autorelease];
}

- (IBAction)setPerson:(ABPerson *)aPerson  andPhoneNumber: (NSString *) aPhoneNumber{
    [person autorelease];
    person = [aPerson copy];
	[phoneNumber autorelease];
	phoneNumber = [aPhoneNumber copy];
}

- (ABPerson *)person{
    return person;
}

- (void) controlTextDidChange: (id) senderNotification {
	//NSLog(@"Control text did change... %@", [smsText stringValue]);
	[numberOfCharacters setIntValue: [[smsText stringValue] length]];
}



@end
