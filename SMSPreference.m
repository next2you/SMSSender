//
//  SMSPreference
//  SMSSender
//
//  Created by chris on 04.09.09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SMSPreference.h"


@implementation SMSPreference
- (void) awakeFromNib {
}
- (BOOL) preferencesWindowShouldClose {
	return YES;
}
- (BOOL) moduleCanBeRemoved {
	return YES;
}
- (void) moduleWasInstalled {
}
- (void) moduleWillBeRemoved {
	NSLog(@"Module will be removed");
}
- (void) didChange {
}
- (void) initializeFromDefaults {
}
- (void) willBeDisplayed {
	NSLog(@"Module will be displayed");
}
- (void) saveChanges {
}
- (BOOL) hasChangesPending {
	return NO;
}
- (NSImage *) imageForPreferenceNamed:(NSString *) name {
	NSLog(@"get image for preference named... %@", pathToPluginBundleResource(@"ABBulkSMS", @"tif") );
	if(preferenceImage==nil) {
		preferenceImage=[[NSImage alloc] initByReferencingFile:pathToPluginBundleResource(@"ABBulkSMS", @"tif")];
	}
	return preferenceImage;
}
- (NSView *) viewForPreferenceNamed:(NSString *) name {
	if (preferenceView == nil) {
		[NSBundle loadNibNamed:@"SMSPreference" owner:self];
	}
	
	return preferenceBox;
}
+(id)sharedInstance {
	if (sharedABBulkSMSPreferenceModule == nil)
		sharedABBulkSMSPreferenceModule=[[self alloc] init];
	return sharedABBulkSMSPreferenceModule;
}

@end
