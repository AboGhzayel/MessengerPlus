#import <UIKit/UIKit.h>
#import <substrate.h>
#define Plist_PATH @"/var/mobile/Library/Preferences/Messenger.plist"
inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:Plist_PATH] valueForKey:key] boolValue];
}
%hookMNSettingsTabAccountSwitchingConfigurator-(bool)_isLogoutEnabled{if(GetPrefBool(@"k1")) {return TRUE;}else{return %orig;}
}%end 

%hook MNSettingsTabAccountSwitchingConfigurator-(bool)isLogoutEnabled{if(GetPrefBool(@"k1")) {return TRUE;}else{return %orig;}}%end
//Hide Status Bar//
%hook UIApplication
-(bool)isStatusBarHidden{
if(GetPrefBool(@"k2")) {
return TRUE;
}else{
return %orig;
}
}
%end


%hook UIViewController
-(bool)prefersStatusBarHidden{
if(GetPrefBool(@"k2")) {
return TRUE;
}else{
return %orig;
}
}
%end

%hook _UIRemoteViewController
-(bool)prefersStatusBarHidden{
if(GetPrefBool(@"k2")) {
return TRUE;
}else{
return %orig;
}
}
%end

%hook _UIRemoteViewControllerConnectionInfo
-(void)setPrefersStatusBarHidden:(bool)arg1{
if(GetPrefBool(@"k2")) {
arg1 = TRUE;
%orig (arg1);
}else{
return %orig;
}
}
%end


%hook MNMessagesViewController
-(bool)prefersStatusBarHidden{
if(GetPrefBool(@"k2")) {
return TRUE;
}else{
return %orig;
}
}
%end

%hook FBListViewController
-(bool)prefersStatusBarHidden{
if(GetPrefBool(@"k2")){
return TRUE;
}else{
return %orig;
}
}
%end

%hook MNViewControllerWithHiddenStatsuBar
-(bool)prefersStatusBarHidden{
if(GetPrefBool(@"k2")){
return TRUE;
}else{
return %orig;
}
}
%end


%hook MNMessengerCodeViewController
-(bool)prefersStatusBarHidden{if(GetPrefBool(@"k2")){return TRUE;}else{return %orig;}}%end

%hook MNNewThreadViewControllerBase
-(bool)prefersStatusBarHidden{if(GetPrefBool(@"k2")){return TRUE;}else{return %orig;}}%end



%hook MNModelHostViewController
-(bool)forcePrefersStatusBarHidden{if(GetPrefBool(@"k2")){return TRUE;}else{return %orig;}}%end

////Black Keyboard//%hook UITextInputTraits-(long long)keyboardAppearance{if(GetPrefBool(@"k3")) {return 1;}else{return %orig;}}%end

////Upload  Videos & Photos High Quality// 
%hook FBImageUploadItem
-(bool)_sampleQualityGkCheck{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end

%hook FBImageUploadItem
-(bool)_isQualitysampleTime{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end



%hook MNComposerEphemeralControlExtension
-(bool)isEnabled{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end


%hook FBImageUploadItem
-(bool)_batteryLevelChek{
if(GetPrefBool(@"k4")) {
return false;
}else{
return %orig;
}
}
%end


%hook FBImageUploadItem
-(bool)_isQualitysamplngtime{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end




%hook FBTmelineIlineCommentsExperimentContext
-(bool)enabled{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end





%hook FBImageUploadItem
-(bool)_hasFullRec{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end





%hook FBImageUploadItem
-(bool)_haveGooodConnection{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end

%hook MNPhotoPreviewViewController
-(void)loadHighQualityPhoto{
if(GetPrefBool(@"k4")) {
return ;
}else{
return %orig;
}
}
%end

%hook FBMediaPickerTraits
-(bool) forceHighQualityVideo{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end

%hook FBMediaUploadBandwidthTracker
 -(bool) isNetworkSufficientForHighQualityPhotos{
if(GetPrefBool(@"k4")) {
return TRUE;
}else{
return %orig;
}
}
%end

%hook MNComposerEphemeralControlExtension
-(void)setEnabled:(bool)arg1 source:(id)arg2{
if(GetPrefBool(@"k4")) {
arg1 = TRUE;
arg2 = NULL;
%orig (arg1, arg2);
}else{
return %orig;
}
}
%end
//internal Settings 
%hook FBMLoggedInUser
-(bool) isEmployee{
if(GetPrefBool(@"k5")) {
return TRUE;
}else{
return %orig;
}
}
%end

//unlimited Photos 
%hook FBMediaAttachmentPickerControllerConfiguration
-(unsigned int) maxPhotosSelected{
if(GetPrefBool(@"k6")) {
return 9999999;
}else{
return %orig;
}
}
%end




//disable Read Receipts 
%hook MNThreadReadMarkValue
-(id)initWithWatermarkTimestamp:(unsigned long long)arg1 shouldSendReadReceipt:(bool)arg2 apnsMessageIds:(id)arg3 {
if(GetPrefBool(@"k7")) {
return nil;
} else {
return %orig;
}

}
%end

