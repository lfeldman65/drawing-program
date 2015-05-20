//
//  ViewController.h
//  DrawingProgram
//
//  Created by Larry Feldman on 5/20/15.
//  Copyright (c) 2015 Larry Feldman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    CGPoint lastPoint;
    CGPoint moveBackTo;
    CGPoint currentPoint;
    CGPoint location;
    NSDate *lastClick;
    BOOL mouseSwiped;
    UIImageView *drawImage;
    UIImageView *frontImage;
    
}


@end

