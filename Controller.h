//
//  Created by Martin Pittenauer on Tue Oct 14 2003.
//  Copyright (c) 2003 TheCodingMonkeys. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AddressBook/AddressBook.h>

@interface Controller : NSObject {
    IBOutlet id panel;
    IBOutlet id smsText;
    ABPerson *person;
	NSString *phoneNumber;
	IBOutlet id numberOfCharacters;
	IBOutlet id phoneNumberDisplay;
	IBOutlet id configurePanel;
}

- (IBAction)send:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)configure:(id)sender;
- (IBAction)setPerson:(ABPerson *)aPerson andPhoneNumber: (NSString *) aPhoneNumber;
- (ABPerson *)person;
@end
