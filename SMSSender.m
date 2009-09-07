//
//  SMSSender.m
//  SMSSender
//
//  Created by chris on 04.09.09.
//  Copyright Christian van der Leeden 2009. All rights reserved.
//

#import "SMSSender.h"
#import "Controller.h"
NSBundle *SMSSenderBundle;

@implementation SMSSender

- (NSString *)actionProperty;
{
    return kABPhoneProperty;
}

- (NSString *)titleForPerson:(ABPerson *)person identifier:(NSString *)identifier
{
    return @"Send SMS over bulkSMS";
}

- (void)performActionForPerson:(ABPerson *)person identifier:(NSString *)identifier
{	NSLog(@"Perform Action for Person");
    Controller *theController = [Controller new];
	ABMultiValue *multiValue = [person valueForProperty: [self actionProperty]];
	NSString *phoneNumber =  [multiValue valueForIdentifier: identifier];
	if (! [phoneNumber hasPrefix: @"+"] ) {
		NSAlert *alert = [NSAlert alertWithMessageText: @"Fehler" defaultButton: nil alternateButton: nil otherButton: nil informativeTextWithFormat: @"%@ muss den Country Code beinhalten und mit einem + beginnen", phoneNumber];
		[alert runModal];
	} else {
		[theController setPerson:person andPhoneNumber:phoneNumber];
		[NSBundle loadNibNamed:@"Panel" owner:theController]; 
	}
}

// Optional. Your action will always be enabled in the absence of this method. As
// above, this method is passed information about the data item rolled over.
- (BOOL)shouldEnableActionForPerson:(ABPerson *)person identifier:(NSString *)identifier
{
    return YES;
}

+(void) initialize {
	SMSSenderBundle=[NSBundle bundleForClass:[self class]];
	NSLog(@"Initializing ABBulkSMSBundle %@", SMSSenderBundle );
	
	//[[NSPreferences sharedPreferences] addPreferenceNamed:@"BulkSMS" owner:[ABBulkSMSPreference sharedInstance]];
}


@end
