//
//  ViewController.m
//  JSON Parsing Demo
//
//  Created by Suniket Wagh on 06/02/13.
//  Copyright (c) 2013 Suniket Wagh. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "MyCell.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize myTable;

- (void)viewDidLoad
{
    [super viewDidLoad];
	

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *myAppdelegate=[[UIApplication sharedApplication]delegate];
    return [myAppdelegate.mainArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AppDelegate *myAppdelegate=[[UIApplication sharedApplication]delegate];
    
     NSDictionary* mainDictionary =[myAppdelegate.mainArray objectAtIndex:indexPath.row];
    
     NSString* name = [mainDictionary objectForKey:@"name"];
    
    NSString* personId = [mainDictionary objectForKey:@"id"];
    
    NSArray *objects=[[NSBundle mainBundle]loadNibNamed:@"MyCell" owner:self options:nil];
    
    MyCell* cell=[objects objectAtIndex:0];
    cell.nameLabel.text = name;
 
    NSData *data = [ViewController base64DataFromString:[mainDictionary objectForKey:@"profile_image"]];
    cell.myImage.image = [UIImage imageWithData:data];
    return  cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

+ (NSData *)base64DataFromString: (NSString *)string
{
    unsigned long ixtext, lentext;
    unsigned char ch, inbuf[4], outbuf[3];
    short i, ixinbuf;
    Boolean flignore, flendtext = false;
    const unsigned char *tempcstring;
    NSMutableData *theData;
    
    if (string == nil)
        {
            return [NSData data];
        }
    
    ixtext = 0;
    
    tempcstring = (const unsigned char *)[string UTF8String];
    
    lentext = [string length];
    
    theData = [NSMutableData dataWithCapacity: lentext];
    
    ixinbuf = 0;
    
    while (true)
        {
            if (ixtext >= lentext)
                {
                   break;
                }
            
            ch = tempcstring [ixtext++];
            
            flignore = false;
            
            if ((ch >= 'A') && (ch <= 'Z'))
                {
                    ch = ch - 'A';
                    }
            else if ((ch >= 'a') && (ch <= 'z'))
                {
                    ch = ch - 'a' + 26;
                    }
            else if ((ch >= '0') && (ch <= '9'))
                {
                    ch = ch - '0' + 52;
                    }
            else if (ch == '+')
               {
                    ch = 62;
                    }
            else if (ch == '=')
                {
                   flendtext = true;
                    }
            else if (ch == '/')
                {
                    ch = 63;
                    }
            else
                {
                    flignore = true;
                   }
            
            if (!flignore)
                {
                    short ctcharsinbuf = 3;
                    Boolean flbreak = false;
                    
                    if (flendtext)
                        {
                            if (ixinbuf == 0)
                               {
                                    break;
                                    }
                            
                            if ((ixinbuf == 1) || (ixinbuf == 2))
                               {
                                   ctcharsinbuf = 1;
                                    }
                            else
                                {
                                    ctcharsinbuf = 2;
                                    }
                            
                            ixinbuf = 3;
                           
                            flbreak = true;
                            }
                    
                    inbuf [ixinbuf++] = ch;
                   
                    if (ixinbuf == 4)
                        {
                            ixinbuf = 0;
                            
                            outbuf[0] = (inbuf[0] << 2) | ((inbuf[1] & 0x30) >> 4);
                            outbuf[1] = ((inbuf[1] & 0x0F) << 4) | ((inbuf[2] & 0x3C) >> 2);
                            outbuf[2] = ((inbuf[2] & 0x03) << 6) | (inbuf[3] & 0x3F);
                            
                            for (i = 0; i < ctcharsinbuf; i++)
                                {
                                    [theData appendBytes: &outbuf[i] length: 1];
                                    }
                            }
                    
                    if (flbreak)
                       {
                            break;
                            }
                    }
            }
   
    return theData;
}

@end
