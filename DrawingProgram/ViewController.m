//
//  ViewController.m
//  DrawingProgram
//
//  Created by Larry Feldman on 5/20/15.
//  Copyright (c) 2015 Larry Feldman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


- (IBAction)colorPressed:(UIButton *)sender;



@end

@implementation ViewController

@synthesize lastPoint;
@synthesize currentPoint;
@synthesize location;
@synthesize lastClick;
@synthesize mouseSwiped;
@synthesize drawImage;
@synthesize red, green, blue;
@synthesize brushWidth;
@synthesize opacity;
@synthesize screenHeight;
@synthesize screenWidth;


- (void)viewDidLoad {
    [super viewDidLoad];

    screenWidth = [UIScreen mainScreen].bounds.size.width;
    screenHeight = [UIScreen mainScreen].bounds.size.height;

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    drawImage.image = [defaults objectForKey:@"drawImageKey"];
    drawImage = [[UIImageView alloc] initWithImage:nil];
    drawImage.frame = self.view.frame;
    
    red = 0.0/255.0;
    green = 0.0/255.0;
    blue = 0.0/255.0;
    brushWidth = 10.0;
    opacity = 1.0;
    
    [self.view addSubview:drawImage];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = NO;
    UITouch *touch = [[event allTouches] anyObject];
    location = [touch locationInView:touch.view];
    lastPoint = [touch locationInView:self.view];
    [super touchesBegan:touches withEvent:event];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    currentPoint = [touch locationInView:self.view];
    
    UIGraphicsBeginImageContext(CGSizeMake(screenWidth, screenHeight));
    [drawImage.image drawInRect:CGRectMake(0, 0, screenWidth, screenHeight)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brushWidth);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    [drawImage setFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    lastPoint = currentPoint;
    
    [self.view addSubview:drawImage];
    
}


- (IBAction)colorPressed:(UIButton *)sender {
    
    switch(sender.tag)
    {
        case 0:                         // black
            red = 0.0/255.0;
            green = 0.0/255.0;
            blue = 0.0/255.0;
            break;
        case 1:
            red = 255.0/255.0;          // red
            green = 0.0/255.0;
            blue = 0.0/255.0;
            break;
        case 2:
            red = 0.0/255.0;            // green
            green = 255.0/255.0;
            blue = 0.0/255.0;
            break;
        case 3:                         // blue
            red = 0.0/255.0;
            green = 0.0/255.0;
            blue = 255.0/255.0;
            break;
        case 4:                         // yellow
            red = 255.0/255.0;
            green = 255.0/255.0;
            blue = 0.0/255.0;
            break;
        case 5:                         // orange
            red = 255.0/255.0;
            green = 127.0/255.0;
            blue = 0.0/255.0;
            break;
        case 6:                         // purple
            red = 127.0/255.0;
            green = 0.0/255.0;
            blue = 127.0/255.0;
            break;
        case 7:
            red = 160.0/255.0;
            green = 82.0/255.0;
            blue = 45.0/255.0;
            break;
        case 8:
            red = 255.0/255.0;
            green = 102.0/255.0;
            blue = 0.0/255.0;
            break;
        case 9:
            red = 255.0/255.0;
            green = 255.0/255.0;
            blue = 0.0/255.0;
            break;
        case 10:                        // eraser
            red = 255.0/255.0;
            green = 255.0/255.0;
            blue = 255.0/255.0;
            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
