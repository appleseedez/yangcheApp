//
//  YCWriteCommentTextViewCell.h
//  yangcheApp
//
//  Created by Pharaoh on 13-1-30.
//  Copyright (c) 2013年 com.yangche.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCWriteCommentTextViewCell : UITableViewCell <UITextViewDelegate>{

}

@property(nonatomic,weak) IBOutlet UITextView* textView;
@end
