//
//  ViewController.m
//  MaterialDesignAlertView
//
//  Created by Nobel on 15/5/27.
//  Copyright (c) 2015年 Nobel. All rights reserved.
//

#import "ViewController.h"
#import "MDAlertView.h"

@interface ViewController ()<MDAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *titles;
@property (weak, nonatomic) IBOutlet UISwitch *message;
@property (weak, nonatomic) IBOutlet UISwitch *image;
@property (weak, nonatomic) IBOutlet UISwitch *isLightImage;
@property (weak, nonatomic) IBOutlet UISwitch *cancelButton;
@property (weak, nonatomic) IBOutlet UISwitch *confirmButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)show:(id)sender {
    MDAlertView *alert = [[MDAlertView alloc]initWithTitle:self.titles.isOn?@"Glass":nil message:self.message.isOn?@"Glass is an amorphous (non-crystalline) solid material which is often transparent and has widespread practical, technological, and decorative usage in things like window panes.":nil image:self.image.isOn?[UIImage imageNamed:@"1"]:nil delegate:self cancelButtonTitle:self.cancelButton.isOn?@"Cancel":nil confirmButtonTitle:self.confirmButton.isOn?@"Confirm":nil];
    if (self.isLightImage.isOn) {
        alert.isLightImage = YES;
        if (self.image.isOn) {
            NSLog(@"If you want test isLightImage mode , please use 2.png");
        }
    }
    alert.delegate = self;
    [alert show];
}

- (void)confirmButtonClicked{
    NSLog(@"ConfirmButtonClick");
}

- (void)cancelButtonClicked{
    NSLog(@"CancelButtonClick");
}


@end
