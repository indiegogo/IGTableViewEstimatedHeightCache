//
//  ViewController.m
//  IGTableViewEstimatedHeightCache
//
//  Created by Jan Jirout on 1/30/15.
//  Copyright (c) 2015 Indiegogo. All rights reserved.
//

#import "IGViewController.h"
#import <UIViewController+IGTableViewEstimatedHeightCache.h>
#import "DynamicCell.h"

@interface IGViewController ()

@property (nonatomic, strong) NSArray *headlines;

@end

@implementation IGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[DynamicCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0);
    
    [self loadHeadlines];
}


- (void)loadHeadlines {
    self.headlines = @[
                       @"Teachers Use iPad to Enhance Learning in Special Education Across the Globe",
                       @"2014 NHL Playoffs: Teams Turning to High-Tech Analysis During Games",
                       @"Apple Updates MacBook Air",
                       @"Apple Reports Second-Quarter Results",
                       @"Apple Expands Capital Return Program to Over $130 Billion and Announces Seven-for-One Stock Split",
                       @"Apple Outlines Progress of Environmental Efforts",
                       @"Next-Generation Hearing Aids Tune In to iPhone",
                       @"Indiegogo Developers Go to Great Lengths to Resolve UITableView Scrolling Issues",
                       @"Using Tablets to Reach Kids With Autism",
                       @"Apple Worldwide Developers Conference Kicks Off June 2 in San Francisco",
                       @"Apple Leads Shift Toward Cleaner Internet",
                       @"San Francisco Giants Hope iBeacon Hits a Home Run with Fans",
                       @"iPad Writes a New Game Plan for Concussions",
                       @"Teachers Use iPad to Enhance Learning in Special Education Across the Globe",
                       @"2014 NHL Playoffs: Teams Turning to High-Tech Analysis During Games",
                       @"Apple Updates MacBook Air",
                       @"Apple Reports Second-Quarter Results",
                       @"Apple Expands Capital Return Program to Over $130 Billion and Announces Seven-for-One Stock Split",
                       @"Apple Outlines Progress of Environmental Efforts",
                       @"Next-Generation Hearing Aids Tune In to iPhone",
                       @"Indiegogo Developers Go to Great Lengths to Resolve UITableView Scrolling Issues",
                       @"Using Tablets to Reach Kids With Autism",
                       @"Apple Worldwide Developers Conference Kicks Off June 2 in San Francisco",
                       @"Apple Leads Shift Toward Cleaner Internet",
                       @"San Francisco Giants Hope iBeacon Hits a Home Run with Fans",
                       @"iPad Writes a New Game Plan for Concussions",
                       @"Teachers Use iPad to Enhance Learning in Special Education Across the Globe",
                       @"2014 NHL Playoffs: Teams Turning to High-Tech Analysis During Games",
                       @"Apple Updates MacBook Air",
                       @"Apple Reports Second-Quarter Results",
                       @"Apple Expands Capital Return Program to Over $130 Billion and Announces Seven-for-One Stock Split",
                       @"Apple Outlines Progress of Environmental Efforts",
                       @"Next-Generation Hearing Aids Tune In to iPhone",
                       @"Indiegogo Developers Go to Great Lengths to Resolve UITableView Scrolling Issues",
                       @"Using Tablets to Reach Kids With Autism",
                       @"Apple Worldwide Developers Conference Kicks Off June 2 in San Francisco",
                       @"Apple Leads Shift Toward Cleaner Internet",
                       @"San Francisco Giants Hope iBeacon Hits a Home Run with Fans",
                       @"iPad Writes a New Game Plan for Concussions",
                       @"Teachers Use iPad to Enhance Learning in Special Education Across the Globe",
                       @"2014 NHL Playoffs: Teams Turning to High-Tech Analysis During Games",
                       @"Apple Updates MacBook Air",
                       @"Apple Reports Second-Quarter Results",
                       @"Apple Expands Capital Return Program to Over $130 Billion and Announces Seven-for-One Stock Split",
                       @"Apple Outlines Progress of Environmental Efforts",
                       @"Next-Generation Hearing Aids Tune In to iPhone",
                       @"Indiegogo Developers Go to Great Lengths to Resolve UITableView Scrolling Issues",
                       @"Using Tablets to Reach Kids With Autism",
                       @"Apple Worldwide Developers Conference Kicks Off June 2 in San Francisco",
                       @"Apple Leads Shift Toward Cleaner Internet",
                       @"San Francisco Giants Hope iBeacon Hits a Home Run with Fans",
                       @"iPad Writes a New Game Plan for Concussions",
                       @"Teachers Use iPad to Enhance Learning in Special Education Across the Globe",
                       @"2014 NHL Playoffs: Teams Turning to High-Tech Analysis During Games",
                       @"Apple Updates MacBook Air",
                       @"Apple Reports Second-Quarter Results",
                       @"Apple Expands Capital Return Program to Over $130 Billion and Announces Seven-for-One Stock Split",
                       @"Apple Outlines Progress of Environmental Efforts",
                       @"Next-Generation Hearing Aids Tune In to iPhone",
                       @"Indiegogo Developers Go to Great Lengths to Resolve UITableView Scrolling Issues",
                       @"Using Tablets to Reach Kids With Autism",
                       @"Apple Worldwide Developers Conference Kicks Off June 2 in San Francisco",
                       @"Apple Leads Shift Toward Cleaner Internet",
                       @"San Francisco Giants Hope iBeacon Hits a Home Run with Fans",
                       @"iPad Writes a New Game Plan for Concussions",
                       @"Teachers Use iPad to Enhance Learning in Special Education Across the Globe",
                       @"2014 NHL Playoffs: Teams Turning to High-Tech Analysis During Games",
                       @"Apple Updates MacBook Air",
                       @"Apple Reports Second-Quarter Results",
                       @"Apple Expands Capital Return Program to Over $130 Billion and Announces Seven-for-One Stock Split",
                       @"Apple Outlines Progress of Environmental Efforts",
                       @"Next-Generation Hearing Aids Tune In to iPhone",
                       @"Indiegogo Developers Go to Great Lengths to Resolve UITableView Scrolling Issues",
                       @"Using Tablets to Reach Kids With Autism",
                       @"Apple Worldwide Developers Conference Kicks Off June 2 in San Francisco",
                       @"Apple Leads Shift Toward Cleaner Internet",
                       @"San Francisco Giants Hope iBeacon Hits a Home Run with Fans",
                       @"iPad Writes a New Game Plan for Concussions",
                       ];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"subview" sender:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.headlines.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.headlineLabel.text = _headlines[indexPath.row];
    
    // put estimated cell height in cache if needed
    if (![self ehc_isEstimatedRowHeightInCache:indexPath]) {
        CGSize cellSize = [cell systemLayoutSizeFittingSize:CGSizeMake(self.view.frame.size.width, 0) withHorizontalFittingPriority:1000.0 verticalFittingPriority:50.0];
        [self ehc_setEstimatedCellHeightToCache:indexPath height:cellSize.height];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self ehc_getEstimatedCellHeightFromCache:indexPath defaultHeight:41.5];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //NSLog(@"Content Height: %f", self.tableView.contentSize.height);
}

@end
