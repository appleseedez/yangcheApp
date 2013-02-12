//
//  UIImage+YCUtils.m
//  yangcheApp
//
//  Created by Pharaoh on 13-2-1.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import "UIImage+YCUtils.h"

@implementation UIImage (YCUtils)
+ (UIImage *)imageNamed:(NSString *)name withColor:(UIColor *)color{
	// load the image

	UIImage *img = [UIImage imageNamed:name];
	
	// begin a new image context, to draw our colored image onto
	UIGraphicsBeginImageContext(img.size);
	
	// get a reference to that context we created
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	// set the fill color
	[color setFill];
	
	// translate/flip the graphics context (for transforming from CG* coords to UI* coords
	CGContextTranslateCTM(context, 0, img.size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	
	// set the blend mode to color burn, and the original image
	CGContextSetBlendMode(context, kCGBlendModeColorBurn);
	CGRect rect = CGRectMake(0, 0, img.size.width, img.size.height);
	CGContextDrawImage(context, rect, img.CGImage);
	
	// set a mask that matches the shape of the image, then draw (color burn) a colored rectangle
	CGContextClipToMask(context, rect, img.CGImage);
	CGContextAddRect(context, rect);
	CGContextDrawPath(context,kCGPathFill);
	
	// generate a new UIImage from the graphics context we drew onto
	UIImage *coloredImg = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	//return the color-burned image
	return coloredImg;
}
@end
