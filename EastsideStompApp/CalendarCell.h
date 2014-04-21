//
//  CalendarCell.h
//  EastsideStompApp
//
//  Created by Andrew Rodgers on 4/21/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *eventDate;
@property (weak, nonatomic) IBOutlet UILabel *eventTitle;

@end