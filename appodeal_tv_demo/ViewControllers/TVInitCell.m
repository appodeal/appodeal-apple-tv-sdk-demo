//
//  TVInitCell.m
//  AppodealSandboxTV
//
//  Created by ilya lozhkin on 04/04/16.
//  Copyright © 2016 appodeal. All rights reserved.
//

#import "TVInitCell.h"
#import "Masonry.h"

@interface TVInitCell()
{
    
}
@end

@implementation TVInitCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.border];
    }
    return self;
}

-(void) updateConstraints {
    
    [self.border mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView).with.offset(0);
        make.bottom.equalTo(self.contentView);
        make.width.equalTo(@20);
    }];
    
    [super updateConstraints];
}

#pragma mark --- Property

-(UIView *) border {
    if (!_border) {
        _border = [UIView new];
        _border.backgroundColor = UIColor.redColor;
        _border.alpha = 0.0f;
        _border.tag = 999;
    }
    return _border;
}

@end
