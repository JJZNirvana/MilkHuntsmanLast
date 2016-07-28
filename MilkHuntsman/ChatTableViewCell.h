//
//  ChatTableViewCell.h
//  
//
//  Created by lanou3g on 16/7/23.
//
//

#import <UIKit/UIKit.h>

@interface ChatTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
-(CGFloat)getHeight:(NSString *)text
               font:(CGFloat)font;
@end
