//
//  ViewController.m
//  EastsideStompApp
//
//  Created by Andrew Rodgers on 2/26/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.stuffViewSegmentedControl addTarget:self action:@selector(changeStuffView) forControlEvents:UIControlEventValueChanged];
	self.calenderView = [[[NSBundle mainBundle] loadNibNamed:@"CalendarView" owner:self options:nil] objectAtIndex:0];
	self.socialView = [[[NSBundle mainBundle] loadNibNamed:@"SocialView" owner:self options:nil] objectAtIndex:0];
	self.classesView = [[[NSBundle mainBundle] loadNibNamed:@"ClassesView" owner:self options:nil] objectAtIndex:0];
	self.directionsView = [[[NSBundle mainBundle] loadNibNamed:@"DirectionsView" owner:self options:nil] objectAtIndex:0];
	[self.stuffView addSubview:self.calenderView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)changeStuffView
{
	NSArray *subviews = self.stuffView.subviews;
	for (UIView *subview in subviews)
	{
		[subview removeFromSuperview];
	}
	
	if ([self.stuffViewSegmentedControl selectedSegmentIndex] == 0)
	{
		[self.stuffView addSubview:self.calenderView];
	}
	else if ([self.stuffViewSegmentedControl selectedSegmentIndex] == 1)
	{
		[self.stuffView addSubview:self.classesView];
	}
	else if ([self.stuffViewSegmentedControl selectedSegmentIndex] == 2)
	{
		[self.stuffView addSubview:self.directionsView];
	}
}

@end