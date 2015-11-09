// =================================================================================================================
//
//  idAdvMenuViewController.m
//  infiniteDiscoveriesAdventure
//
//  Created by Jeffrey Young on 10/4/15.
//  Copyright © 2015 infinite Discoveries. All rights reserved.
//
// =================================================================================================================

#import <Foundation/Foundation.h>
#import "idAdvMenuViewController.h"
#import "idAdvGameViewController.h"

@interface idAdvMenuViewController ()

@property (nonatomic, strong) SKView *demoView;

@end

@implementation idAdvMenuViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.demoView = [[SKView alloc] initWithFrame:self.view.bounds];
    SKScene *scene = [[SKScene alloc] initWithSize:self.view.bounds.size];
    
    scene.backgroundColor = [SKColor whiteColor];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    [self.demoView presentScene:scene];
    [self.view insertSubview:self.demoView atIndex:0];
}

// -----------------------------------------------------------------------------------------------------------------

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

// -----------------------------------------------------------------------------------------------------------------

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PlayGame"]) {
        idAdvGameViewController *gameController = segue.destinationViewController;
    } else {
        NSAssert(false, @"Unknown segue identifier %@", segue.identifier);
    }
}

// -----------------------------------------------------------------------------------------------------------------

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self.demoView removeFromSuperview];
    self.demoView = nil;
}

@end
