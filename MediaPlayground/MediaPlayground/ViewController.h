//
//  ViewController.h
//  MediaPlayground
//
//  Created by zheng libao on 13-4-18.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <CoreImage/CoreImage.h>

@interface ViewController : UIViewController<MPMediaPickerControllerDelegate,UIImagePickerControllerDelegate, UINavigationBarDelegate>
@property (strong, nonatomic) IBOutlet UISwitch *toggleFullScreen;
@property (strong, nonatomic) IBOutlet UIButton *recoreButton;
@property (strong, nonatomic) IBOutlet UISwitch *toggleCamera;
@property (strong, nonatomic) IBOutlet UIImageView *displayImageView;
@property (strong, nonatomic) IBOutlet UIButton *musicPlayButton;
@property (strong, nonatomic) IBOutlet UILabel *displayNowPalying;

@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) MPMusicPlayerController *musicPlayer;

- (IBAction)playMovie:(id)sender;
- (IBAction)recordAudio:(id)sender;
- (IBAction)playAudio:(id)sender;
- (IBAction)chooseImage:(id)sender;
- (IBAction)applyFilter:(id)sender;
- (IBAction)chooseMusic:(id)sender;
- (IBAction)playMusic:(id)sender;


- (void) playMovieFinshed: (NSNotification *) theNotificaton;
@end
