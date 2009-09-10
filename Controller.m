//
//  SMSSender.h
//  SMSSender
//
//  Created by chris on 04.09.09.
//  Copyright Christian van der Leeden 2009. All rights reserved.
//

#import "Controller.h"
#import "SMSController.h"

@implementation Controller

- (id)init 
{
    self = [super init];
	showConfigurePanel = FALSE;
    return self;
}

- (IBAction)awakeFromNib
{
    [smsText setStringValue:  @""];
	[phoneNumberDisplay setStringValue: phoneNumber];
	if ([[SMSController sharedInstance] isConfigured]) {
		[self showPanel];
	} else {
		[self showConfigurePanel];
	}
}

- (void) showPanel {
	[[NSApplication sharedApplication] beginSheet:panel modalForWindow:[[NSApplication sharedApplication] mainWindow] modalDelegate:self didEndSelector:@selector(endPanel) contextInfo:nil];
}

- (void) showConfigurePanel {
	[[NSApplication sharedApplication] beginSheet:configurePanel modalForWindow:[[NSApplication sharedApplication] mainWindow] modalDelegate:self didEndSelector:@selector(endConfigurePanel) contextInfo:nil];
}

- (IBAction)send:(id)sender {
    ABPerson *thePerson = [self person];
	
	[[SMSController sharedInstance] send: [smsText stringValue] to: phoneNumber];
    [[NSApplication sharedApplication] endSheet:panel];
}

- (IBAction)cancel:(id)sender {
    [[NSApplication sharedApplication] endSheet:panel];
}

- (IBAction)configure:(id)sender {
	showConfigurePanel = TRUE;
    [[NSApplication sharedApplication] endSheet:panel];
}

- (IBAction) okConfigure:(id)sender {
    [[NSApplication sharedApplication] endSheet:configurePanel];
}


- (void)endPanel {
	[panel orderOut:nil];
	if (showConfigurePanel) {
		[self showConfigurePanel];
	} else {
		[self autorelease];
	}
}

- (void) endConfigurePanel {
	showConfigurePanel = FALSE;
	[configurePanel orderOut: nil];
	[self showPanel];
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
