//
//  DetailViewController.h
//  Sample
//
//  Created by Jolin He on 14/12/29.
//  Copyright (c) 2014年 Jolin He. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

