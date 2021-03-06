// =================================================================================================================
//
//  idAdvGameViewController.m
//  infiniteDiscoveriesAdventure
//
//  Created by Jeffrey Young on 10/29/15.
//  Copyright (c) 2015 infinite Discoveries. All rights reserved.
//
// =================================================================================================================

#import "idAdvGameViewController.h"
#import "idAdvGameScene.h"

// =================================================================================================================
#pragma mark - SKScene Object Methods
// =================================================================================================================

@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    SKScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    return scene;
}

@end

// =================================================================================================================
#pragma mark - idAdvGameViewController Object Methods
// =================================================================================================================

@implementation idAdvGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the initial scene.
    idAdvGameScene *scene = [idAdvGameScene unarchiveFromFile:@"idAdvGameScene"];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

// -----------------------------------------------------------------------------------------------------------------

- (BOOL)shouldAutorotate
{
    return YES;
}

// -----------------------------------------------------------------------------------------------------------------

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

// -----------------------------------------------------------------------------------------------------------------

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

// -----------------------------------------------------------------------------------------------------------------

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
