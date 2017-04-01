#import "header/PSListController.h"
#import "header/PSViewController.h"

@interface MessengerListController: PSListController {
}
@end

@implementation MessengerListController

-(void)credits{

UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"Credits" message:@"Messenger+ by Mohammed Ghzayel 😎 Twitter of This Developer is @AboGhayel" delegate:self cancelButtonTitle:@"OK 👋" otherButtonTitles:nil];
[alert1 show];
}

-(void)Twitter{
   if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:@"AboGhzayel"]]];

   else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitterrific:///profile?screen_name=" stringByAppendingString:@"AboGhzayel"]]];

   else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetings:///user?screen_name=" stringByAppendingString:@"AboGhzayel"]]];

   else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:@"AboGhzayel"]]];

   else
       [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:@"AboGhzayel"]]];
} // twitter



- (void)loadView {
    [super loadView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(shareTapped)];
}
- (void)shareTapped {
	NSString *text = @"I'm using #Messenger+ By @aboghzayel Download in Cydia on the BigBoss repo!";

	if ([UIActivityViewController alloc]) {
		UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[text] applicationActivities:nil];
		[(UINavigationController *)[super navigationController] presentViewController:activityViewController animated:YES completion:NULL];
	}else {
		//awesomeness
	}
}

-(void)apply {
	 system("killall -9 Messenger");
      } 


- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Messenger" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
