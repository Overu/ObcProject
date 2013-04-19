//
//  ViewController.m
//  MediaPlayground
//
//  Created by zheng libao on 13-4-18.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize toggleFullScreen;
@synthesize recoreButton;
@synthesize toggleCamera;
@synthesize displayImageView;
@synthesize musicPlayButton;
@synthesize displayNowPalying;
@synthesize moviePlayer;
@synthesize audioRecorder;
@synthesize audioPlayer;
@synthesize musicPlayer;

- (void)viewDidLoad
{
    NSString *movieFile = [[NSBundle mainBundle] pathForResource: @"nbc" ofType: @"m4v"];
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL: [NSURL fileURLWithPath:movieFile]];
    
    self.moviePlayer.allowsAirPlay = YES;
    [self.moviePlayer.view setFrame: CGRectMake(145.0, 20.0, 155.0, 100.0)];
    
    
    NSURL *soundFileURL = [NSURL fileURLWithPath: [NSTemporaryDirectory() stringByAppendingFormat: @"sound.caf"]];
    
    NSDictionary *soundSetting = [NSDictionary dictionaryWithObjectsAndKeys: [NSNumber numberWithFloat: 44100.0],AVSampleRateKey, [NSNumber numberWithInt: kAudioFormatMPEG4AAC], AVFormatIDKey, [NSNumber numberWithInt: 2], AVNumberOfChannelsKey, [NSNumber numberWithInt: AVAudioQualityHigh], AVEncoderAudioQualityKey, nil];
    self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:soundFileURL settings:soundSetting  error: nil];
    
    
//    NSURL *noSoundFileURL = [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource: @"norecording" ofType: @"wav"]];
//    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: noSoundFileURL error:nil];
    
    
    self.musicPlayer = [MPMusicPlayerController iPodMusicPlayer];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setToggleFullScreen:nil];
    [self setRecoreButton:nil];
    [self setToggleCamera:nil];
    [self setDisplayImageView:nil];
    [self setMusicPlayButton:nil];
    [self setDisplayNowPalying:nil];
    [self setMoviePlayer:nil];
    [self setAudioRecorder: nil];
    [self setAudioPlayer: nil];
    [self setMusicPlayer: nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)playMovieFinshed:(NSNotification *)theNotificaton
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
    [self.moviePlayer.view removeFromSuperview];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)playMovie:(id)sender {
    [self.view addSubview: self.moviePlayer.view];
    [[NSNotificationCenter defaultCenter] addObserver: self selector:@selector(playMovieFinshed:) name: MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
    
    if ([self.toggleFullScreen isOn]) {
        [self.moviePlayer setFullscreen:YES animated:YES];
    }
    
    [self.moviePlayer play];
}

- (IBAction)recordAudio:(id)sender {
    if ([self.recoreButton.titleLabel.text isEqualToString:@"Record Audio"]) {
        [self.audioRecorder record];
        [self.recoreButton setTitle: @"Stop Recording" forState: UIControlStateNormal];
    } else {
        [self.audioRecorder stop];
        [self.recoreButton setTitle: @"Record Audio" forState: UIControlStateNormal];
        
        NSURL *soundFileURL = [NSURL fileURLWithPath: [NSTemporaryDirectory() stringByAppendingFormat: @"sound.caf"]];
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: soundFileURL error: nil];
    }
}

- (IBAction)playAudio:(id)sender {
    [self.audioPlayer play];
}

- (IBAction)chooseImage:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if ([self.toggleCamera isOn]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [[UIApplication sharedApplication] setStatusBarHidden: YES];
    [self presentModalViewController: imagePicker animated: YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [[UIApplication sharedApplication] setStatusBarHidden: NO];
    [self dismissModalViewControllerAnimated: YES];
    self.displayImageView.image = [info objectForKey: UIImagePickerControllerOriginalImage];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [[UIApplication sharedApplication] setStatusBarHidden: NO];
    [self dismissModalViewControllerAnimated: YES];
}

- (IBAction)applyFilter:(id)sender {
    CIImage *imageToFilter = [[CIImage alloc] initWithImage: self.displayImageView.image];
    
    CIFilter *activeFilter = [CIFilter filterWithName: @"CISepiaTone"];
    [activeFilter setDefaults];
    [activeFilter setValue: [NSNumber numberWithFloat: 0.75] forKey: @"inputIntensity"];
    [activeFilter setValue:imageToFilter forKey: @"inputImage"];
    CIImage *filteredImage = [activeFilter valueForKey:@"outputImage"];
    
    UIImage *myNewImage = [UIImage imageWithCIImage: filteredImage];
    self.displayImageView.image = myNewImage;
    
    //other
    CIContext *context = [CIContext contextWithOptions: [NSDictionary dictionary]];
    CGImageRef cgImage = [context createCGImage: filteredImage fromRect: [imageToFilter extent]];
    self.displayImageView.image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
}

- (IBAction)chooseMusic:(id)sender {
    MPMediaPickerController *musicPicker;
    
    [self.musicPlayer stop];
    self.displayNowPalying.text = @"No Song Playing";
    [self.musicPlayButton setTitle: @"Play Music" forState: UIControlStateNormal];
    
    musicPicker = [[MPMediaPickerController alloc] initWithMediaTypes: MPMediaTypeMusic];
    
    musicPicker.prompt = @"Choose Songs to Play";
    musicPicker.allowsPickingMultipleItems = YES;
    musicPicker.delegate = self;
    
    [self presentModalViewController: musicPicker animated: YES];
}

- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection
{
    [musicPlayer setQueueWithItemCollection: mediaItemCollection];
    [self dismissModalViewControllerAnimated: YES];
}

- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker
{
    [self dismissModalViewControllerAnimated: YES];
}

- (IBAction)playMusic:(id)sender {
    if ([self.musicPlayButton.titleLabel.text isEqualToString:@"Play Music"]) {
        [self.musicPlayer play];
        [self.musicPlayButton setTitle: @"Pause Music" forState: UIControlStateNormal];
        self.displayNowPalying.text = [self.musicPlayer.nowPlayingItem valueForKey: MPMediaItemPropertyTitle];
    } else {
        [self.musicPlayer pause];
        [self.musicPlayButton setTitle: @"Play Music" forState: UIControlStateNormal];
        self.displayNowPalying.text = @"No Song Playing";
    }
}
@end
