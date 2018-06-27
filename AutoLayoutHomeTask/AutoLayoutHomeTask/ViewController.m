//
//  ViewController.m
//  AutoLayoutHomeTask
//
//  Created by Dmitriy Tarelkin on 26/6/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width;

@property (assign, nonatomic) NSInteger redTap;
@property (assign, nonatomic) NSInteger blueTap;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redTap = 0;
    self.blueTap = 0;
    
}
- (IBAction)resizeButtonTapped:(UIButton *)sender {
    
    if (sender.superview == _redView) {
        
        if (self.redTap == 0) {
            [self changeViewConstraint:_redView];
            NSLog(@"resize red to smaller");
            self.redTap = -1;
            self.blueTap = 1;
            
        } else if (self.redTap == -1) {
            [self changeViewConstraint:_blueView];
            NSLog(@"resize red to Bigger");
            self.redTap = 0;
            self.blueTap = 0;
            
        } else if (self.redTap == 1) {
            [self changeViewConstraint:_redView];
            NSLog(@"red tap == 1");
            self.redTap = 0;
            self.blueTap = 0;
        }
        
        
    } else if(sender.superview == _blueView) {
        
        if (self.blueTap == 0) {
            [self changeViewConstraint:_blueView];
            NSLog(@"resize blue to smaller");
            self.blueTap = -1;
            self.redTap = 1;
            
        } else if(self.blueTap == -1) {
            [self changeViewConstraint:_redView];
            NSLog(@"resize blue to bigger");
            self.blueTap = 0;
            self.redTap = 0;
            
        } else if (self.blueTap == 1){
            [self changeViewConstraint:_blueView];
            NSLog(@"blue tap == 1");
            self.blueTap = 0;
            self.redTap = 0;
        }
        
    }

}

-(void)changeViewConstraint:(UIView*)view {
    
    NSInteger constant;
    if ([view isEqual:_blueView]) {
        constant = 300;
    } else {
        constant = -300;
    }
    
    
    //for iPhone
    if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact &&
        self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) {
        _height.constant -= constant;
        [self layoutWithAimation];
        
    } else if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular &&
            self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
        _width.constant -= constant;
        [self layoutWithAimation];
        
    } else if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular &&
                 self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) {
        _height.constant -= constant;
        [self layoutWithAimation];
        
    } else if ((self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact &&
                self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact)) {
        _height.constant -= constant/2;
        [self layoutWithAimation];
        
    }
    
}

- (void)layoutWithAimation {
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
