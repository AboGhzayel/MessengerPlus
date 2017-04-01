#import <UIKit/UIKit.h>
#import <substrate.h>
#define Plist_PATH @"/var/mobile/Library/Preferences/Messenger.plist"
inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:Plist_PATH] valueForKey:key] boolValue];
}

//Hide is Typing
%hook MNTypingNotificationManager
-(bool)isTyping{
if(GetPrefBool(@"k9")) {
return NO;
}else{
return %orig;
}
}
%end
%hook MNThreadRow
-(BOOL)isOtherUserTyping{
if(GetPrefBool(@"k9")) {
return NO;
}else{
return %orig;
}
}
%end

%hook MNThreadTypingStateTrackerService
-(void)stop{ return ; } %end


%hook MNThreadTypingStateTrackerServiceInjector
-(id)threadTypingStateTracker{
if(GetPrefBool(@"k9")) {
return nil;
}else{
return %orig;
}
}
%end

%hook MNThreadTypingStatusSender 
-(long long) typingState{
if(GetPrefBool(@"k9")) {
return 1;
}else{
return %orig;
}
}
%end 


%hook MNMessageCellElementApparanceTransitioning
-(BOOL) isTyping{
if(GetPrefBool(@"k9")) {
return false;
}else{
return %orig;
}
}
%end

%hook FBMMQTTSender
-(void)sendTypingNotification:(id)arg1 state:(long long)arg2 {
if(GetPrefBool(@"k9")) {
arg1 = NULL;
arg2 = 1;
%orig (arg1, arg2);
}else{
return %orig;
}
}

-(void)sendTypingNotification:(id)arg1 state:(long long)arg2 attribution:(id)arg3{
if(GetPrefBool(@"k9")) {
arg1 = NULL;
arg2 = 1;
arg3 = nil;
%orig (arg1, arg2, arg3);
}else{
return %orig;
}
}
%end


//Disable invite To Messenger
%hook MNInviteToastController
 -(bool) _shouldShowInviteToastView{
if(GetPrefBool(@"k11")) {
return NO;
}else{
return %orig;
}
}
%end


%hook MNDefaultInviteEligibilityChecker
-(bool) _shouldShowInvitesPeopleCellForPartialUser{
if(GetPrefBool(@"k11")) {
return NO;
}else{
return %orig;
}
}
%end

%hook MNInvitePeopleCellController
-(bool) shouldShowInvitePeopleCell{
if(GetPrefBool(@"k11")) {
return NO;
}else{
return %orig;
}
}
%end



///Old Layout 
%hook MNMontageComposerStackViewController
-(bool) _canEnableComposer{
if(GetPrefBool(@"k14")) {
return NO;
}else{
return %orig;
}
}

-(bool) canEnableComposer{
if(GetPrefBool(@"k14")) {
return NO;
}else{
return %orig;
}
}

-(void) setComposerState:(id)arg1 animated:(bool)arg2 completion:(id)arg3{
if(GetPrefBool(@"k14")) {
arg1 = NULL;
arg2 = NO;
arg3 = NULL;
%orig (arg1, arg2, arg3);
}else{
return %orig;
}
}

-(void) _updateCaptureButton{
if(GetPrefBool(@"k14")) {
return ;
}else{
return %orig;
}
}
-(void)_updateCaptureButtonState{
if(GetPrefBool(@"k14")) {
return ;
}else{
return %orig;
}
}
%end

%hook MNMessageCellElementAppearanceTransitioning
-(bool) isTyping{
if(GetPrefBool(@"k9")) {
return false;
}else{
return %orig;
}
}
%end



%hook MNMessagesViewModelSource
-(bool) isTypingActive{
if(GetPrefBool(@"k9")) {
return false;
}else{
return %orig;
}
}
%end


