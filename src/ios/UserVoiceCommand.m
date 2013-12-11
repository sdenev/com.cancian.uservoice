// 	MIT licensed 
//  Created by Surinder Singh on 2013-01-30
//  Copyright 2013 DeveloperExtenions.com . All rights reserved.
//  Copyright 2013, Surinder Singh

//		site:'cancian.uservoice.com',
//		key:'62oo7AhcRoQuvozU6ya6A',
//		secret:'g911MyHj3qs92pDDa6f1XOgT9fHSi7pNBZoXO4E',

#import "UserVoiceCommand.h"

#ifdef CORDOVA_FRAMEWORK
#import <Cordova/CDVViewController.h>
#else 
#import "Cordova/CDVViewController.h"
#endif
#import "UserVoice.h"

@implementation UserVoiceCommand


-(void) launch:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{

    
    //MainViewController cont = (MainViewController) self.viewController;
	NSLog(@"UserVoice launchFeedBack, config: %@, options: %@", arguments, options);
	NSString *task = [options objectForKey:@"task"];
	
	if([task isEqualToString:@"launchFeedback"]){
		[self launchFeedback:options];	
	}else if([task isEqualToString:@"contactUs"]){
		[self contactUs:options];
	}else if([task isEqualToString:@"viewForum"]){
		[self viewForum:options];
	}else if([task isEqualToString:@"postIdea"]){
		[self postIdea:options];
	}else{
		NSLog(@"Invalid UserVoice Task: %@", task);
	}	
}


- (UVConfig *)uvConfig:(NSMutableDictionary*)options {
	
    //UVConfig *config 			= [UVConfig configWithSite:@"demo.uservoice.com" andKey:@"pZJocTBPbg5FN4bAwczDLQ" andSecret:@"Q7UKcxRYLlSJN4CxegUYI6t0uprdsSAGthRIDvYmI"];
    
	UVConfig *config 			= [UVConfig configWithSite:[options objectForKey:@"site"] andKey:[options objectForKey:@"key"] andSecret:[options objectForKey:@"secret"]];
	
	NSInteger topicId 			= [[options objectForKey:@"topicId"] intValue];
	NSInteger showContactUs 	= [[options objectForKey:@"showContactUs"] intValue];
	NSInteger showForum 		= [[options objectForKey:@"showForum"] intValue];
	NSInteger showPostIdea		= [[options objectForKey:@"showPostIdea"] intValue];
	NSInteger showKnowledgeBase = [[options objectForKey:@"showKnowledgeBase"] intValue];
	//NSMutableDictionary *customFields  = [options dictionaryForKey:@"customFields"] ;
	
	if(topicId!=0){
	//	config.topicId = topicId;
	}
	if(showContactUs!=1){
	//	config.showContactUs = NO;
	}
	if(showForum!=1){
	//	config.showForum = NO;
	}
	if(showPostIdea!=1){
//		config.showPostIdea = NO;
	}
	if(showKnowledgeBase!=1){
	//	config.showKnowledgeBase = NO;
	}
	// config.topicId = 4656;
    // config.customFields = @{@"Type" : @"Support Request", @"Platform" : @"Mobile"};
    // config.showContactUs = NO;
    // config.showForum = NO;
    // config.showPostIdea = NO;
    // config.showKnowledgeBase = NO;
	// [UserVoice setDelegate:self.viewController];
    // [UVStyleSheet setStyleSheet:[[DemoStyleSheet alloc] init]];
    return config;
}

- (void)launchFeedback:(NSMutableDictionary*)options {
    [UserVoice presentUserVoiceInterfaceForParentViewController:self.viewController andConfig:[self uvConfig:options]];
}

- (void)contactUs:(NSMutableDictionary*)options {
    [UserVoice presentUserVoiceContactUsFormForParentViewController:self.viewController andConfig:[self uvConfig:options]];
}

- (void)viewForum:(NSMutableDictionary*)options {
    [UserVoice presentUserVoiceForumForParentViewController:self.viewController andConfig:[self uvConfig:options]];
}

- (void)postIdea:(NSMutableDictionary*)options {
    [UserVoice presentUserVoiceNewIdeaFormForParentViewController:self.viewController andConfig:[self uvConfig:options]];
}

- (void)userVoiceWasDismissed {
    NSLog(@"UserVoice dismissed");
}

@end
