//
//  View.m
//  Oct25
//
//  Created by Leonardo Lavega on 10/25/12.
//  Copyright (c) 2012 Leonardo Lavega. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect{
	 
 // Drawing code
	 
 	 UIFont *titleFont = [UIFont boldSystemFontOfSize:20.0];
 	 UIFont *font = [UIFont systemFontOfSize:16.0];
	 UIDevice *device = [UIDevice currentDevice];
	 CGFloat x = 10.0;
	 CGFloat y = 10.0;
 	 NSString *string = NSLocalizedString(@"Title",@"displayed with drawAtPoint");
 	 CGPoint point = CGPointMake(x,y);
 	 [string drawAtPoint:point withFont:titleFont];
	 
	 y += 50;
	 NSString *format = NSLocalizedString(@"Model",@"");
	 string = [NSString stringWithFormat:format, device.model];
	 [string drawAtPoint:CGPointMake(x,y) withFont:font];
	 
	 y += 30;
	 format = NSLocalizedString(@"Serial",@"");
	 string = [NSString stringWithFormat:format, device.uniqueIdentifier];
	 [string drawAtPoint:CGPointMake(x,y) withFont:font];
	 
	 y += 30;
	 format = NSLocalizedString(@"OS",@"");
	 string = [NSString stringWithFormat:format, device.systemName];
	 [string drawAtPoint:CGPointMake(x,y) withFont:font];
	 
	 y += 30;
	 format = NSLocalizedString(@"Version",@"");
	 string = [NSString stringWithFormat:format, device.systemVersion];
	 [string drawAtPoint:CGPointMake(x,y) withFont:font];
	 
	 y+=50;
	 //if language is set to spanish the second title would not fit in a single line.
	 if([[[NSLocale preferredLanguages] objectAtIndex:0] rangeOfString:@"es" options:NSCaseInsensitiveSearch].length > 0){
		format = NSLocalizedString(@"StockTitleSmall1",@"");
		[format drawAtPoint:CGPointMake(x, y) withFont:titleFont];
		y+=30;
		format = NSLocalizedString(@"StockTitleSmall2",@"");
		[format drawAtPoint:CGPointMake(x, y) withFont:titleFont];
			 
	 }
	else{
		format = NSLocalizedString(@"StockTitle",@"");
		[format drawAtPoint:CGPointMake(x, y) withFont:titleFont];
	}
	 
	 
	 y+=50;
	 NSURL *url = [[NSURL alloc] initWithString:@"http://finance.yahoo.com/d/quotes.csv?s=AAPL&f=sl1t1" ];
	 NSString *symbol, *price, *time;
	 NSError *error;
	 string = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error: &error];
	 if(string == nil){
		 string = [error localizedDescription];
	}
	 else{
		 NSArray *arr = [string componentsSeparatedByString:@","];
		 symbol = [arr objectAtIndex:0];
		 symbol = [symbol substringFromIndex:1];
		 symbol = [symbol substringToIndex: ([symbol length] - 1)];
		 format = NSLocalizedString(@"Symbol",@"");
		 string = [NSString stringWithFormat:format, symbol];
		 [string drawAtPoint:CGPointMake(x,y) withFont:font];
		 
		 y += 30;
		 price = [arr objectAtIndex:1];
		 format = NSLocalizedString(@"Price",@"");
		 string = [NSString stringWithFormat:format, price];
		 [string drawAtPoint:CGPointMake(x,y) withFont:font];
		 
		 y+=30;
		 time = [arr objectAtIndex:2];
		 time = [time stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		 time = [time substringFromIndex:1];
		 time = [time substringToIndex: ([time length] - 1)];
		 format = NSLocalizedString(@"Time",@"");
		 string = [NSString stringWithFormat:format, time];
		 [string drawAtPoint:CGPointMake(x,y) withFont:font];
		 
	 }
	
	 
 }


@end
