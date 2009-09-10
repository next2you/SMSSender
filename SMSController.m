//
//  SMSController.m
//  ABBirthday
//
//  Created by Christian van der Leeden on 09.05.08.
//  Copyright 2008 Christian van der Leeden. All rights reserved.
//

#import "SMSController.h"
#import "Mail.h"

id sharedSMSController;

@implementation SMSController
+ (SMSController *) sharedInstance {
	if (sharedSMSController == nil) {
		sharedSMSController = [[SMSController alloc] init];
	}
	return sharedSMSController;
}


- (NSString *) password {
	return [[[NSUserDefaultsController sharedUserDefaultsController] defaults] objectForKey: @"SMSBulkSMSPassword"];
}
- (NSString *) senderIdentifier {
	return [[[NSUserDefaultsController sharedUserDefaultsController] defaults] objectForKey: @"SMSSenderID"];
}

- (NSString *) emailSubject {
	return [NSString stringWithFormat: @"%@ [sender:%@] [cost_route:2]", [self password], [self senderIdentifier]];
}

- (NSString *) fromEmail {
	return [[[NSUserDefaultsController sharedUserDefaultsController] defaults] objectForKey: @"SMSEmailAddress"];
}


- send: (NSString *) message to: (NSString *) aPhoneNumber{
	/* create a Scripting Bridge object for talking to the Mail application */
	NSString *cleanedPhoneNumber = [aPhoneNumber stringByReplacingOccurrencesOfString:@" " withString: @""];
	
	cleanedPhoneNumber = [cleanedPhoneNumber stringByReplacingOccurrencesOfString:@"-" withString: @""];
	cleanedPhoneNumber = [cleanedPhoneNumber stringByReplacingOccurrencesOfString:@"(" withString: @""];
	cleanedPhoneNumber = [cleanedPhoneNumber stringByReplacingOccurrencesOfString:@")" withString: @""];
	cleanedPhoneNumber = [cleanedPhoneNumber stringByReplacingOccurrencesOfString:@"+" withString: @""];
	NSString *recipient = [NSString stringWithFormat: @"%@@sms.bulksms.de", cleanedPhoneNumber];
	
    MailApplication *mail = [SBApplication  applicationWithBundleIdentifier:@"com.apple.Mail"];
    
	/* create a new outgoing message object */
    MailOutgoingMessage *emailMessage =
	[[[mail classForScriptingClass:@"outgoing message"] alloc]
	 initWithProperties:
	 [NSDictionary dictionaryWithObjectsAndKeys:
	  [self emailSubject], @"subject",
	  message, @"content" , nil ]];
	
	
	/* add the object to the mail app  */
    [[mail outgoingMessages] addObject: emailMessage];
	
	/* set the sender, show the message */
    emailMessage.sender = [self fromEmail];
    emailMessage.visible = NO;
	
	/* create a new recipient and add it to the recipients list */
    MailToRecipient *theRecipient =
	[[[mail classForScriptingClass:@"to recipient"] alloc]
	 initWithProperties:
	 [NSDictionary dictionaryWithObjectsAndKeys:
	  recipient, @"address",
	  nil]];
    [emailMessage.toRecipients addObject: theRecipient];
	
    [emailMessage send];
	return self;
}

- (BOOL) isConfigured {
	return [self password]  && [self senderIdentifier]  && [self fromEmail] ;
}


@end
