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
@property (nonatomic, strong) UITableView *twitterAndFaceBookTable;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.background.image = [UIImage imageNamed:@"bkg@2x.jpg"];
	
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
    IDScrollableTabBar *scrollableTabBar = [[IDScrollableTabBar alloc] initWithFrame:CGRectMake(0, -10, 320, 0) itemWidth:80 items:itemClock,itemCamera,itemMail,itemFave,itemGames,itemSettings,itemMusic,itemZip, nil];
    scrollableTabBar.delegate = self;
	scrollableTabBar.alpha = 0.9;
    scrollableTabBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    [scrollableTabBar setSelectedItem:0 animated:NO];
    [self.view addSubview:scrollableTabBar];
	self.twitterAndFaceBookTable.delegate = self;
	self.twitterAndFaceBookTable.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
	callout.view.layer.shadowColor = [UIColor blackColor].CGColor;
	callout.view.layer.shadowOffset = CGSizeMake(0, 1);
	callout.view.layer.shadowOpacity = 1;
	callout.view.layer.shadowRadius = 15.0;
	
    [callout show];
}

#pragma mark -Tab Bar Stuff

-(void)scrollTabBarAction : (NSNumber *)selectedNumber sender:(id)sender
{
	[UIView animateWithDuration:0.1
                     animations:
		^{
			self.stuffView.alpha = 0.2;
			self.background.alpha = 0.2;
		}
                     completion:^(BOOL finished)
		{
			NSArray *subviews = self.stuffView.subviews;
			for (UIView *subview in subviews)
			{
				[subview removeFromSuperview];
			}
			if ([selectedNumber integerValue] == 0)
			{
				[UIView beginAnimations:nil context:NULL];
				[UIView setAnimationBeginsFromCurrentState:NO];
				[UIView setAnimationDuration:(CGFloat)0.15];
				
				[self.stuffView addSubview:self.calendarView];
				self.background.image = [UIImage imageNamed:@"bkg@2x.jpg"];
				self.stuffView.alpha = 1.0;
				self.background.alpha = 1.0;
				
				[UIView commitAnimations];
			}
			else if ([selectedNumber integerValue] == 1)
			{
				
				[UIView beginAnimations:nil context:NULL];
				[UIView setAnimationBeginsFromCurrentState:NO];
				[UIView setAnimationDuration:(CGFloat)0.15];
				
				[self.stuffView addSubview:self.classesView];
				self.background.image = [UIImage imageNamed:@"bkg2@2x.jpg"];
				self.stuffView.alpha = 1.0;
				self.background.alpha = 1.0;
				
				[UIView commitAnimations];
			}
			else if ([selectedNumber integerValue] == 2)
			{
				[UIView beginAnimations:nil context:NULL];
				[UIView setAnimationBeginsFromCurrentState:NO];
				[UIView setAnimationDuration:(CGFloat)0.15];
				
				[self.stuffView addSubview:self.directionsView];
				self.background.image = [UIImage imageNamed:@"bkg3@2x.jpg"];
				self.stuffView.alpha = 1.0;
				self.background.alpha = 1.0;
				
				[UIView commitAnimations];
			}
		}
	];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark -Twitter and FaceBook stuff

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *twitterCell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    return twitterCell;
}

#pragma mark -HTTP requests

-(NSDictionary *)httpRequestWithURL:(NSString*)url
{
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
	
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
	
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
	
    if([responseCode statusCode] != 200)
	{
        NSLog(@"Error getting %@, HTTP status code %li", url, (long)[responseCode statusCode]);
        return nil;
    }
	
	return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
}

@end