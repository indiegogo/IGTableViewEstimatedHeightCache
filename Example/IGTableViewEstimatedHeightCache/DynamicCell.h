//
//  DynamicCell.h
//  IGTableViewEstimatedHeightCache
//
//  Created by Jan Jirout on 1/30/15.
//  Copyright (c) 2015 Indiegogo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicCell : UITableViewCell

@property UILabel *headlineLabel;

@property (nonatomic, assign) CGFloat lastHeight;

@end
