//
//  SMSController.h
//  ABBirthday
//
//  Created by Christian van der Leeden on 09.05.08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SMSController : NSObject {
	
}
+ (SMSController *) sharedInstance;
- send: (NSString *) message to: (NSString *) aPhoneNumber;
@end
