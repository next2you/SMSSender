//
//  SMSSender.h
//  SMSSender
//
//  Created by chris on 04.09.09.
//  Copyright Christian van der Leeden 2009. All rights reserved.
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
	BOOL showConfigurePanel;
}

- (IBAction)send:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)configure:(id)sender;
- (IBAction) okConfigure:(id)sender ;
- (IBAction)setPerson:(ABPerson *)aPerson andPhoneNumber: (NSString *) aPhoneNumber;
- (void) showPanel;
- (void) showConfigurePanel;
- (void) endPanel;
- (ABPerson *)person;
@end
