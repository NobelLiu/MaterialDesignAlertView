//
//  MDAlertView.m
//  MDAlertView
//
//  Created by Nobel on 15-5-10.
//  Copyright (c) 2015年 Nobel. All rights reserved.
//

#import "MDAlertView.h"
#import "BFPaperButton.h"

@interface MDAlertView ()

@property(nonatomic,strong)UIView *backView,*shadowView,*darkerView;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLabel,*messageLabel;
@property(nonatomic,strong)BFPaperButton *cancelButton,*confirmButton;

@end

@implementation MDAlertView

-(instancetype)init{
    self = [super init];
    if (self) {
        self.clipsToBounds = YES;
        self.shadowView = [[UIView alloc]initWithFrame:CGRectZero];
        [self addSubview:self.shadowView];
        self.shadowView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.25];
        self.shadowView.alpha = 0;
        self.backView = [[UIView alloc]initWithFrame:CGRectZero];
        self.backView.alpha = 0;
        [self addSubview:self.backView];
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.backView addSubview:self.imageView];
        self.darkerView = [[UIView alloc]initWithFrame:CGRectZero];
        self.darkerView.backgroundColor = [UIColor colorWithWhite:0.35 alpha:0.5];
        self.darkerView.alpha = 0;
        [self.imageView addSubview:self.darkerView];
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.backView addSubview:self.titleLabel];
        self.messageLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.backView addSubview:self.messageLabel];
        self.cancelButton = [[BFPaperButton alloc]initWithFrame:CGRectZero];
        self.cancelButton.isRaised = NO;
        [self.backView addSubview:self.cancelButton];
        self.confirmButton = [[BFPaperButton alloc]initWithFrame:CGRectZero];
        self.confirmButton.isRaised = NO;
        [self.backView addSubview:self.confirmButton];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle confirmButtonTitle:(NSString *)confirmButtonTitle{
    self = [self init];
    if (self) {
        if (delegate) {
            self.delegate = delegate;
        }
        CGSize contentLabelSize = [message sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:CGSizeMake(260, CGFLOAT_MAX)];
        if (title.length && message.length && image) {
            self.backView.frame = CGRectMake(0, 0, 300, 250);
            self.imageView.frame = CGRectMake(0, 0, 300, 160);
            self.imageView.image = image;
            self.imageView.clipsToBounds = YES;
            self.imageView.contentMode = UIViewContentModeScaleAspectFill;
            self.titleLabel.frame = CGRectMake(20, 125, 260, 30);
            self.titleLabel.text = title;
            self.titleLabel.textColor = [UIColor whiteColor];
            self.messageLabel.frame = CGRectMake(20, 170, contentLabelSize.width, contentLabelSize.height);
            if (self.messageLabel.frame.size.height > 30) {
                self.backView.frame = CGRectMake(0, 0, 300, self.messageLabel.frame.size.height - 30 + 250);
            }
            self.messageLabel.text = message;
            self.messageLabel.textColor = [UIColor blackColor];
            
        }
        else if (title.length && image){
            self.backView.frame = CGRectMake(0, 0, 300, 220);
            self.imageView.frame = CGRectMake(0, 0, 300, 160);
            self.imageView.image = image;
            self.imageView.clipsToBounds = YES;
            self.imageView.contentMode = UIViewContentModeScaleAspectFill;
            self.titleLabel.frame = CGRectMake(20, 125, 260, 30);
            self.titleLabel.text = title;
            self.titleLabel.textColor = [UIColor whiteColor];
        }
        else if (message.length && image){
            self.backView.frame = CGRectMake(0, 0, 300, 240);
            self.imageView.frame = CGRectMake(0, 0, 300, 160);
            self.imageView.image = image;
            self.imageView.clipsToBounds = YES;
            self.imageView.contentMode = UIViewContentModeScaleAspectFill;
            self.messageLabel.frame = CGRectMake(20, 170, contentLabelSize.width, contentLabelSize.height);
            if (self.messageLabel.frame.size.height > 30) {
                self.backView.frame = CGRectMake(0, 0, 300, self.messageLabel.frame.size.height - 30 + 240);
            }
            self.messageLabel.text = message;
            self.messageLabel.textColor = [UIColor blackColor];
        }
        else if (title.length && message.length){
            self.backView.frame = CGRectMake(0, 0, 300, 130);
            self.titleLabel.frame = CGRectMake(20, 10, 260, 30);
            self.titleLabel.text = title;
            self.titleLabel.textColor = [UIColor blackColor];
            self.messageLabel.frame = CGRectMake(20, 55, contentLabelSize.width, contentLabelSize.height);
            if (self.messageLabel.frame.size.height > 30) {
                self.backView.frame = CGRectMake(0, 0, 300, self.messageLabel.frame.size.height - 30 + 130);
            }
            self.messageLabel.text = message;
            self.messageLabel.textColor = [UIColor blackColor];
        }
        else if (title.length){
            self.backView.frame = CGRectMake(0, 0, 300, 120);
            self.titleLabel.frame = CGRectMake(20, 10, 260, 30);
            self.titleLabel.text = title;
            self.titleLabel.textColor = [UIColor blackColor];
        }else if (message.length){
            self.backView.frame = CGRectMake(0, 0, 300, 120);
            self.messageLabel.frame = CGRectMake(20, 20, contentLabelSize.width, contentLabelSize.height);
            if (self.messageLabel.frame.size.height > 30) {
                self.backView.frame = CGRectMake(0, 0, 300, self.messageLabel.frame.size.height - 30 + 120);
            }
            self.messageLabel.text = message;
            self.messageLabel.textColor = [UIColor blackColor];
        }else{
            NSLog(@"Title or Message,must have one.");
            return nil;
        }
        if (cancelButtonTitle.length || confirmButtonTitle.length) {
            if (cancelButtonTitle.length && confirmButtonTitle.length) {
                self.cancelButton.frame = CGRectMake(self.backView.frame.size.width - 150, self.backView.frame.size.height - 45, 60, 30);
                [self.cancelButton setTitle:cancelButtonTitle forState:UIControlStateNormal];
                [self.cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
                [self.cancelButton addTarget:self action:@selector(cancelButtonClicked) forControlEvents:UIControlEventTouchUpInside];
                self.confirmButton.frame = CGRectMake(self.backView.frame.size.width - 80, self.backView.frame.size.height - 45, 60, 30);
                [self.confirmButton setTitle:confirmButtonTitle forState:UIControlStateNormal];
                [self.confirmButton addTarget:self action:@selector(confirmButtonClicked) forControlEvents:UIControlEventTouchUpInside];
            }
            else if (cancelButtonTitle.length){
                self.cancelButton.frame = CGRectMake(self.backView.frame.size.width - 80, self.backView.frame.size.height - 45, 60, 30);
                [self.cancelButton setTitle:cancelButtonTitle forState:UIControlStateNormal];
                [self.cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
                [self.cancelButton addTarget:self action:@selector(cancelButtonClicked) forControlEvents:UIControlEventTouchUpInside];
            }
            else if (confirmButtonTitle.length){
                self.confirmButton.frame = CGRectMake(self.backView.frame.size.width - 80, self.backView.frame.size.height - 45, 60, 30);
                [self.confirmButton setTitle:confirmButtonTitle forState:UIControlStateNormal];
                [self.confirmButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
                [self.confirmButton addTarget:self action:@selector(confirmButtonClicked) forControlEvents:UIControlEventTouchUpInside];
            }
//            19 161 148
            [self.cancelButton setTitleColor:[UIColor colorWithRed:19/255.0f green:161/255.0f blue:148/255.0f alpha:1] forState:UIControlStateNormal];
            [self.confirmButton setTitleColor:[UIColor colorWithRed:19/255.0f green:161/255.0f blue:148/255.0f alpha:1] forState:UIControlStateNormal];
            self.cancelButton.usesSmartColor = NO;
            self.confirmButton.usesSmartColor = NO;
            [self.cancelButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
            [self.confirmButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        }else{
            NSLog(@"Cancel or Confirm,must have one.");
            return nil;
        }
        
        self.darkerView.frame = CGRectMake(0, 120, 300, 40);
        
        [self.messageLabel setNumberOfLines:0];
        self.messageLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self.titleLabel setFont:[UIFont systemFontOfSize:20]];
        [self.messageLabel setFont:[UIFont systemFontOfSize:16]];
        self.backView.backgroundColor = [UIColor whiteColor];
        self.backView.layer.cornerRadius = 3.;
        self.backView.layer.shadowOffset = (CGSize){0, 2};
        self.backView.layer.shadowOpacity = 0.35;
        self.backView.layer.shadowRadius = 3;
        self.backView.layer.shadowColor = [UIColor blackColor].CGColor;
        
        
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.imageView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(3, 3)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.imageView.bounds;
        maskLayer.path = maskPath.CGPath;
        self.imageView.layer.mask = maskLayer;
    }
    return self;
}

-(void)setIsLightImage:(BOOL)isLightImage{
    _isLightImage = isLightImage;
    self.darkerView.alpha = 1;
}

- (void)confirmButtonClicked{
    [self.delegate confirmButtonClicked];
}

- (void)cancelButtonClicked{
    [self.delegate cancelButtonClicked];
}

-(void)show{
    UIViewController *vc = self.delegate;
    self.frame = vc.view.frame;
    self.shadowView.frame = self.frame;
    [vc.view addSubview:self];
    [self.backView setTransform:CGAffineTransformMakeScale(0.995, 0.985)];
//    CATransform3D t = CATransform3DIdentity;
//    t.m13 = 0.0005;
//    t.m33 = 0.0005;
//    t.m41 = 0.0001;
//    self.backView.layer.transform = t;
    self.backView.center = CGPointMake(vc.view.frame.size.width / 2, vc.view.frame.size.height / 2 - 3);
    [UIView animateWithDuration:0.2 animations:^{
        [self.backView setTransform:CGAffineTransformMakeScale(1, 1)];
//        self.backView.layer.transform = CATransform3DIdentity;
        self.shadowView.alpha = 1;
        self.backView.alpha = 1;
        self.backView.center = CGPointMake(vc.view.frame.size.width / 2, vc.view.frame.size.height / 2);
    }];
}

-(void)dismiss{
    UIViewController *vc = self.delegate;
    [UIView animateWithDuration:0.2 animations:^{
        self.shadowView.alpha = 0;
        self.backView.alpha = 0;
        self.backView.center = CGPointMake(vc.view.frame.size.width / 2, vc.view.frame.size.height / 2 - 3);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
