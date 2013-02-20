//
//  ViewController.h
//  JSON Parsing Demo
//
//  Created by Suniket Wagh on 06/02/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *myTable;

}
@property (strong, nonatomic) IBOutlet UITableView *myTable;
+ (NSData *)base64DataFromString: (NSString *)string;
@end
