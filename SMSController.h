//
//  SMSController.h
//  ABBirthday
//
//  Created by Christian van der Leeden on 09.05.08.
//  Copyright 2009 Christian van der Leeden. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SMSController : NSObject {
	
}
+ (SMSController *) sharedInstance;
- send: (NSString *) message to: (NSString *) aPhoneNumber;
- (BOOL) isConfigured;
@end
