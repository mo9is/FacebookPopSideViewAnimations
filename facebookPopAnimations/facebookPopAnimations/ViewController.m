//
//  ViewController.m
//  facebookPopAnimations
//
//  Created by Monis Manzoor on 12/07/14.
//  Copyright (c) 2014 Monis Manzoor. All rights reserved.
//

#import "ViewController.h"
#import "POP.h"
#import "SideViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dismissDimView) name:@"dismissView" object:nil];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)dismissDimView{
    [UIView animateWithDuration:0.4 animations:^{
        dimView.alpha=0.0;
        if (isChangeLeft) {
            sideNavigationController.view.frame=CGRectMake(-320, 0, 270, self.navigationController.view.frame.size.height);
        }
        else if (isPresent){
            sideNavigationController.view.frame=CGRectMake(0, 600, 320, self.navigationController.view.frame.size.height);
        }
        else{
           sideNavigationController.view.frame=CGRectMake(400, 0, 270, self.navigationController.view.frame.size.height);
        }
    }completion:^(BOOL finished){
        [dimView removeFromSuperview];
    }];
}

-(void)LeftButtonPressed:(id)sender{
    isChangeLeft=TRUE;
    [self changeViews];
}

-(void)changeViews{
    dimView=[[UIView alloc]init];
    dimView.frame=self.navigationController.view.bounds;
    dimView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.3];
    SideViewController *leftViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"SideViewController"];
    sideNavigationController=[[UINavigationController alloc]initWithRootViewController:leftViewController];
    if (isChangeLeft) {
        sideNavigationController.view.frame=CGRectMake(-320, 0, 270, self.navigationController.view.frame.size.height);
    }
    else{
        sideNavigationController.view.frame=CGRectMake(400, 0, 270, self.navigationController.view.frame.size.height);
    }
      [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
    }completion:^(BOOL finished){
        [self.navigationController.view addSubview:dimView];
    }];

    POPSpringAnimation *springAnimation=[POPSpringAnimation animation];
    springAnimation.property=[POPAnimatableProperty propertyWithName:kPOPViewFrame];
    if (isChangeLeft) {
        springAnimation.toValue=[NSValue valueWithCGRect:CGRectMake(0, 0, 270, self.navigationController.view.frame.size.height)];
    }
    else{
        springAnimation.toValue=[NSValue valueWithCGRect:CGRectMake(50, 0, 270, self.navigationController.view.frame.size.height)];
    }
    springAnimation.springBounciness=5.0;
    springAnimation.springSpeed=5.0;
    [sideNavigationController.view.layer pop_addAnimation:springAnimation forKey:@"leftanimation"];
    [self.navigationController addChildViewController:sideNavigationController];
    [dimView addSubview:sideNavigationController.view];
    [sideNavigationController didMoveToParentViewController:self.navigationController];
}

-(void)rightButtonPressed:(id)sender{
    isChangeLeft=FALSE;
    [self changeViews];
}

-(IBAction)presentViewButtonPressed:(id)sender{
    isPresent=TRUE;
    SideViewController *leftViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"SideViewController"];
    leftViewController.title=@"Present View";
    sideNavigationController=[[UINavigationController alloc]initWithRootViewController:leftViewController];
    sideNavigationController.view.frame=CGRectMake(0, 600, 320, self.navigationController.view.frame.size.height);
    POPSpringAnimation *springAnimation=[POPSpringAnimation animation];
    springAnimation.property=[POPAnimatableProperty propertyWithName:kPOPViewFrame];
    springAnimation.toValue=[NSValue valueWithCGRect:CGRectMake(0, 20, 320, self.view.frame.size.height)];
    springAnimation.springBounciness=5.0;
    springAnimation.springSpeed=5.0;
    [sideNavigationController.view.layer pop_addAnimation:springAnimation forKey:@"leftanimation"];
    [self.navigationController.view addSubview:sideNavigationController.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
