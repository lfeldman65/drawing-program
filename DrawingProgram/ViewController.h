//
//  ViewController.h
//  DrawingProgram
//
//  Created by Larry Feldman on 5/20/15.
//  Copyright (c) 2015 Larry Feldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic) CGPoint lastPoint;
@property (nonatomic) CGPoint currentPoint;
@property (nonatomic) CGPoint location;
@property (nonatomic) NSDate *lastClick;
@property (nonatomic) BOOL mouseSwiped;
@property (nonatomic) UIImageView *drawImage;
@property (nonatomic) CGFloat red;
@property (nonatomic) CGFloat green;
@property (nonatomic) CGFloat blue;
@property (nonatomic) CGFloat brushWidth;
@property (nonatomic) CGFloat opacity;
@property (nonatomic) CGFloat screenWidth;
@property (nonatomic) CGFloat screenHeight;




@end

