//
//  ViewController.h
//  facebookPopAnimations
//
//  Created by Monis Manzoor on 12/07/14.
//  Copyright (c) 2014 Monis Manzoor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIBarButtonItem *leftBarButton;
    IBOutlet UIBarButtonItem *rightBarButton;
    IBOutlet UIButton *presentButton;
    UIView *dimView;
    UINavigationController *sideNavigationController;
    BOOL isChangeLeft;
    BOOL isPresent;
}

-(IBAction)LeftButtonPressed:(id)sender;
-(IBAction)rightButtonPressed:(id)sender;
-(IBAction)presentViewButtonPressed:(id)sender;

@end
