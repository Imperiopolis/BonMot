//
//  TagStylingCell.m
//  BonMot
//
//  Created by Nora Trapp on 3/3/16.
//  Copyright © 2016 Zev Eisenberg. All rights reserved.
//

#import "TagStylingCell.h"

@interface TagStylingCell ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation TagStylingCell

+ (NSString *)title
{
    return @"Tag Styling";
}

- (void)awakeFromNib
{
    [super awakeFromNib];

    BONChain *boldChain = BONChain.new.fontNameAndSize(@"Baskerville-Bold", 15.0f);
    BONChain *italicChain = BONChain.new.fontNameAndSize(@"Baskerville-Italic", 15.0f);

    BONChain *baseChain = BONChain.new.fontNameAndSize(@"Baskerville", 17.0f)
    .tagStyling(@{@"bold": boldChain, @"italic": italicChain})
    .string(@"<bold>This text is wrapped in a <bold> tag.</bold>\n<italic>This text is wrapped in an <italic> tag.</italic>");

    self.label.attributedText = baseChain.attributedString;

    [self.label layoutIfNeeded]; // For auto-sizing cells
}

@end
