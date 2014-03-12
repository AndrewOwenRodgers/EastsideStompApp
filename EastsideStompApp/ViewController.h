//
//  ViewController.h
//  EastsideStompApp
//
//  Created by Andrew Rodgers on 2/26/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *stuffView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *stuffViewSegmentedControl;
@property (strong, nonatomic) UIView *calenderView;
@property (strong, nonatomic) UIView *socialView;
@property (strong, nonatomic) UIView *classesView;
@property (strong, nonatomic) UIView *directionsView;

@end