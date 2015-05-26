//
//  MDAlertView.h
//  MDAlertView
//
//  Created by Nobel on 15-5-10.
//  Copyright (c) 2015年 Nobel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MDAlertViewDelegate

- (void)confirmButtonClicked;
- (void)cancelButtonClicked;

@end

@interface MDAlertView : UIView

@property(nonatomic,assign)BOOL isLightImage;
@property(nonatomic,strong)id<MDAlertViewDelegate> delegate;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle confirmButtonTitle:(NSString *)confirmButtonTitle;

-(void)show;
-(void)dismiss;

@end
