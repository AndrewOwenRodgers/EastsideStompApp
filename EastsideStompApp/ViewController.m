//
//  ViewController.m
//  EastsideStompApp
//
//  Created by Andrew Rodgers on 2/26/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableIndexSet *optionIndices;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.optionIndices = [NSMutableIndexSet indexSetWithIndex:1];

	self.calendarView = [[[NSBundle mainBundle] loadNibNamed:@"CalendarView" owner:self options:nil] objectAtIndex:0];
	self.socialView = [[[NSBundle mainBundle] loadNibNamed:@"SocialView" owner:self options:nil] objectAtIndex:0];
	self.classesView = [[[NSBundle mainBundle] loadNibNamed:@"ClassesView" owner:self options:nil] objectAtIndex:0];
	self.directionsView = [[[NSBundle mainBundle] loadNibNamed:@"DirectionsView" owner:self options:nil] objectAtIndex:0];
	[self.stuffView addSubview:self.calendarView];
	
    IDItem *itemClock = [[IDItem alloc] initWithImage:[UIImage imageNamed:@"clock"] text:@"clock"];
    IDItem *itemCamera = [[IDItem alloc] initWithImage:[UIImage imageNamed:@"camera"] text:@"camera"];
    IDItem *itemMail = [[IDItem alloc] initWithImage:[UIImage imageNamed:@"mail"] text:@"e-mail"];
    IDItem *itemFave = [[IDItem alloc] initWithImage:[UIImage imageNamed:@"fave"] text:@"favourite"];
    IDItem *itemGames = [[IDItem alloc] initWithImage:[UIImage imageNamed:@"games"] text:@"games"];
    IDItem *itemSettings = [[IDItem alloc] initWithImage:[UIImage imageNamed:@"settings"] text:@"settings"];
    IDItem *itemMusic = [[IDItem alloc] initWithImage:[UIImage imageNamed:@"music"] text:@"music"];
    IDItem *itemZip = [[IDItem alloc] initWithImage:[UIImage imageNamed:@"zip"] text:@"zip"];
    IDScrollableTabBar *scrollableTabBar = [[IDScrollableTabBar alloc] initWithFrame:CGRectMake(0, 30, 320, 0) itemWidth:80 items:itemClock,itemCamera,itemMail,itemFave,itemGames,itemSettings,itemMusic,itemZip, nil];
    scrollableTabBar.delegate = self;
    scrollableTabBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    [scrollableTabBar setSelectedItem:0 animated:NO];
    [self.view addSubview:scrollableTabBar];
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
		[self.stuffView addSubview:self.calendarView];
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

#pragma mark -Slide View Stuff


- (IBAction)onBurger:(id)sender {
    NSArray *images = @[
                        [UIImage imageNamed:@"defaultCenter"]
                        ];
    NSArray *colors = @[
                        [UIColor colorWithRed:240/255.f green:159/255.f blue:254/255.f alpha:1]
                        ];
    
    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images selectedIndices:self.optionIndices borderColors:colors];
	//    RNFrostedSidebar *callout = [[RNFrostedSidebar alloc] initWithImages:images];
    callout.delegate = self;
	//    callout.showFromRight = YES;
    [callout show];
}

#pragma mark -Tab Bar Stuff

-(void)scrollTabBarAction : (NSNumber *)selectedNumber sender:(id)sender
{
    NSLog(@"selectedNumber - %@", selectedNumber);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

@end