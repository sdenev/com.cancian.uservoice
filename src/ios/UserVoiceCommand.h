//  Created by Surinder Singh on 2013-01-30
//  Copyright 2013 DeveloperExtenions.com. All rights reserved.
//  Copyright 2013, Surinder Singh


#ifdef CORDOVA_FRAMEWORK
#import <CORDOVA/CDVPlugin.h>
#else
#import "CORDOVA/CDVPlugin.h"
#endif


@interface UserVoiceCommand : CDVPlugin {

}
- (void)launch:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

- (void)launchFeedback:(NSMutableDictionary*)options;
- (void)contactUs:(NSMutableDictionary*)options;
- (void)viewForum:(NSMutableDictionary*)options;
- (void)postIdea:(NSMutableDictionary*)options;

@end
