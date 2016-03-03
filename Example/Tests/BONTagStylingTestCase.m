//
//  BONTagStylingTestCase.m
//  BonMot
//
//  Created by Nora Trapp on 3/3/16.
//
//

#import "BONBaseTestCase.h"

@import BonMot;

@interface BONTagStylingTestCase : BONBaseTestCase

@end

@implementation BONTagStylingTestCase

- (void)testSingleTagSingleStyle
{
    BONChain *chain = BONChain.new.string(@"Hello, <i>world</i>!")
                          .tagStyling(@{ @"i" : BONChain.new.font([UIFont italicSystemFontOfSize:16]) });

    NSAttributedString *attributedString = chain.attributedString;

    XCTAssertEqualObjects(attributedString.string, @"Hello, world!");

    NSParagraphStyle *defaultParagraphStyle = [[NSParagraphStyle alloc] init];

    NSDictionary *controlAttributes = @{
        BONValueFromRange(0, 7) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(7, 5) : @{
            NSFontAttributeName : [UIFont italicSystemFontOfSize:16],
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(12, 1) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },
    };

    BONAssertAttributedStringHasAttributes(attributedString, controlAttributes);
}

- (void)testMultipleTagsSingleStyle
{
    BONChain *chain = BONChain.new.string(@"<i>Hello</i>, <i>world</i>!")
                          .tagStyling(@{ @"i" : BONChain.new.font([UIFont italicSystemFontOfSize:16]) });

    NSAttributedString *attributedString = chain.attributedString;

    XCTAssertEqualObjects(attributedString.string, @"Hello, world!");

    NSParagraphStyle *defaultParagraphStyle = [[NSParagraphStyle alloc] init];

    NSDictionary *controlAttributes = @{
        BONValueFromRange(0, 5) : @{
            NSFontAttributeName : [UIFont italicSystemFontOfSize:16],
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(5, 2) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(7, 5) : @{
            NSFontAttributeName : [UIFont italicSystemFontOfSize:16],
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(12, 1) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },
    };

    BONAssertAttributedStringHasAttributes(attributedString, controlAttributes);
}

- (void)testSingleTagMultipleStyles
{
    BONChain *chain = BONChain.new.string(@"Hello, <b>world</b>!")
                          .tagStyling(@{ @"i" : BONChain.new.font([UIFont italicSystemFontOfSize:16]),
                                         @"b" : BONChain.new.font([UIFont boldSystemFontOfSize:16]) });

    NSAttributedString *attributedString = chain.attributedString;

    XCTAssertEqualObjects(attributedString.string, @"Hello, world!");

    NSParagraphStyle *defaultParagraphStyle = [[NSParagraphStyle alloc] init];

    NSDictionary *controlAttributes = @{
        BONValueFromRange(0, 7) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(7, 5) : @{
            NSFontAttributeName : [UIFont boldSystemFontOfSize:16],
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(12, 1) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },
    };

    BONAssertAttributedStringHasAttributes(attributedString, controlAttributes);
}

- (void)testMultipleTagsMultipleStyles
{
    BONChain *chain = BONChain.new.string(@"<b>Hello</b>, <i>world</i>!")
                          .tagStyling(@{ @"i" : BONChain.new.font([UIFont italicSystemFontOfSize:16]),
                                         @"b" : BONChain.new.font([UIFont boldSystemFontOfSize:16]) });

    NSAttributedString *attributedString = chain.attributedString;

    XCTAssertEqualObjects(attributedString.string, @"Hello, world!");

    NSParagraphStyle *defaultParagraphStyle = [[NSParagraphStyle alloc] init];

    NSDictionary *controlAttributes = @{
        BONValueFromRange(0, 5) : @{
            NSFontAttributeName : [UIFont boldSystemFontOfSize:16],
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(5, 2) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(7, 5) : @{
            NSFontAttributeName : [UIFont italicSystemFontOfSize:16],
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(12, 1) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },
    };

    BONAssertAttributedStringHasAttributes(attributedString, controlAttributes);
}

- (void)testInterleavedTags
{
    BONChain *chain = BONChain.new.string(@"<b>Hello<i></b>, world</i>!")
                          .tagStyling(@{ @"i" : BONChain.new.font([UIFont italicSystemFontOfSize:16]),
                                         @"b" : BONChain.new.font([UIFont boldSystemFontOfSize:16]) });

    NSAttributedString *attributedString = chain.attributedString;

    XCTAssertEqualObjects(attributedString.string, @"Hello<i>, world</i>!");

    NSParagraphStyle *defaultParagraphStyle = [[NSParagraphStyle alloc] init];

    NSDictionary *controlAttributes = @{
        BONValueFromRange(0, 8) : @{
            NSFontAttributeName : [UIFont boldSystemFontOfSize:16],
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(8, 12) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },
    };

    BONAssertAttributedStringHasAttributes(attributedString, controlAttributes);
}

- (void)testNestedTags
{
    BONChain *chain = BONChain.new.string(@"<b><i>Hello</i></b>, world!")
                          .tagStyling(@{ @"i" : BONChain.new.font([UIFont italicSystemFontOfSize:16]),
                                         @"b" : BONChain.new.font([UIFont boldSystemFontOfSize:16]) });

    NSAttributedString *attributedString = chain.attributedString;

    XCTAssertEqualObjects(attributedString.string, @"<i>Hello</i>, world!");

    NSParagraphStyle *defaultParagraphStyle = [[NSParagraphStyle alloc] init];

    NSDictionary *controlAttributes = @{
        BONValueFromRange(0, 12) : @{
            NSFontAttributeName : [UIFont boldSystemFontOfSize:16],
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(12, 8) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },
    };

    BONAssertAttributedStringHasAttributes(attributedString, controlAttributes);
}

- (void)testMixedOrdering
{
    BONChain *chain = BONChain.new.string(@"<b>Hel</b><i>lo</i>, <b>wor</b><i>ld!</i>")
                          .tagStyling(@{ @"i" : BONChain.new.font([UIFont italicSystemFontOfSize:16]),
                                         @"b" : BONChain.new.font([UIFont boldSystemFontOfSize:16]) });

    NSAttributedString *attributedString = chain.attributedString;

    XCTAssertEqualObjects(attributedString.string, @"Hello, world!");

    NSParagraphStyle *defaultParagraphStyle = [[NSParagraphStyle alloc] init];

    NSDictionary *controlAttributes = @{
        BONValueFromRange(0, 3) : @{
            NSFontAttributeName : [UIFont boldSystemFontOfSize:16],
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(3, 2) : @{
            NSFontAttributeName : [UIFont italicSystemFontOfSize:16],
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(5, 2) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(7, 3) : @{
            NSFontAttributeName : [UIFont boldSystemFontOfSize:16],
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },

        BONValueFromRange(10, 3) : @{
            NSFontAttributeName : [UIFont italicSystemFontOfSize:16],
            NSParagraphStyleAttributeName : defaultParagraphStyle,
        },
    };

    BONAssertAttributedStringHasAttributes(attributedString, controlAttributes);
}

@end
