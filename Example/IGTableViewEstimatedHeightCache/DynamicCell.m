//
//  DynamicCell.m
//  IGTableViewEstimatedHeightCache
//
//  Created by Jan Jirout on 1/30/15.
//  Copyright (c) 2015 Indiegogo. All rights reserved.
//

#import "DynamicCell.h"

@implementation DynamicCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        
#pragma mark -- Headline label
        _headlineLabel = [[UILabel alloc] initWithFrame:CGRectInset(self.bounds, 15.0, 0.0)];
        _headlineLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        _headlineLabel.numberOfLines = 0;
        [self.contentView addSubview:_headlineLabel];
    }
    
    
    _headlineLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSMutableArray *constraints = [NSMutableArray array];
    UIView *contentView = self.contentView;
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:_headlineLabel
                            attribute:NSLayoutAttributeFirstBaseline
                            relatedBy:NSLayoutRelationEqual
                            toItem:contentView
                            attribute:NSLayoutAttributeTop
                            multiplier:1.8
                            constant:30]];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:contentView
                            attribute:NSLayoutAttributeBottom
                            //relatedBy:NSLayoutRelationGreaterThanOrEqual //  Changing this to Eqal, made inital cell layout render _headerLabel correctly
                            relatedBy:NSLayoutRelationEqual
                            toItem:_headlineLabel
                            attribute:NSLayoutAttributeBaseline
                            multiplier:1.3
                            constant:8]];
    
    [constraints addObject:[NSLayoutConstraint
                            constraintWithItem:contentView
                            attribute:NSLayoutAttributeHeight
                            relatedBy:NSLayoutRelationGreaterThanOrEqual
                            toItem:nil
                            attribute:0
                            multiplier:1.0
                            constant:44.0]];
    
    
    [constraints addObjectsFromArray:
     [NSLayoutConstraint
      constraintsWithVisualFormat:@"H:|-15-[_headlineLabel]-15-|"
      options:0
      metrics:nil
      views:NSDictionaryOfVariableBindings(_headlineLabel)]];
    
    
    [self.contentView addConstraints:constraints];
    
    return self;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority {
    CGSize size = [super systemLayoutSizeFittingSize:targetSize withHorizontalFittingPriority:horizontalFittingPriority verticalFittingPriority:verticalFittingPriority];
    self.lastHeight = size.height;
    //NSLog(@"systemLayoutSizeFittingSize(%@) = height:%f",NSStringFromCGSize(targetSize), self.lastHeight);
    return size;
}


- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize {
    CGSize size = [super systemLayoutSizeFittingSize:targetSize];
    self.lastHeight = size.height;
    //NSLog(@"systemLayoutSizeFittingSize(%@) = height:%f",NSStringFromCGSize(targetSize), self.lastHeight);
    return size;
}


@end
