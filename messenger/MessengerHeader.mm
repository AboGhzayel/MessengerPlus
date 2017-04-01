#import "HeaderClass.h"

@interface MessengerHeader : PSTableCell {
    UILabel *heading;
    UILabel *subtitle;
    UIImageView *imgView;
}
@end

@implementation MessengerHeader

//////////Header //////////////////What are u doing here leave me plz//////

- (id)initWithSpecifier:(PSSpecifier *)specifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HeaderCell" specifier:specifier];
    if (self) {
        
        
            self.backgroundColor = [UIColor clearColor];
        int width = [[UIScreen mainScreen] bounds].size.width;
       
        
        CGRect frame = CGRectMake(0, 0, width, 160);
        
        imgView = [[UIImageView alloc] initWithFrame:frame];
        imgView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/Messenger.bundle/Messenger1.png"];
        
        [self addSubview: imgView];

    }
    
    return self;
}

- (CGFloat)preferredHeightForWidth:(double)arg1 inTableView:(id)arg2 {
    return 160.0;
}

@end