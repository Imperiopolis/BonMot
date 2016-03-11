//
//  BONUtilitiesTestCase.m
//  BonMot
//
//  Created by Nora Trapp on 3/3/16.
//
//

#import "BONBaseTestCase.h"

@import BonMot;

@interface BONUtilitiesTestCase : BONBaseTestCase

@end

@implementation BONUtilitiesTestCase

#pragma mark - UILabel

- (void)testLabelTextAfterChainable
{
    UILabel *label = UILabel.new;
    label.bonChainable = BONChain.new.font([UIFont systemFontOfSize:16]);
    label.textAndApplyChainable = @"Hello, world!";

    XCTAssertEqualObjects(label.attributedText.string, @"Hello, world!");

    NSParagraphStyle *defaultParagraphStyle = [[NSParagraphStyle alloc] init];

    NSDictionary *controlAttributes = @{
        BONValueFromRange(0, 13) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
            NSFontAttributeName : [UIFont systemFontOfSize:16],
        },
    };

    BONAssertAttributedStringHasAttributes(label.attributedText, controlAttributes);
}

- (void)testLabelTextBeforeChainable
{
    UILabel *label = UILabel.new;
    label.textAndApplyChainable = @"Hello, world!";
    label.bonChainable = BONChain.new.font([UIFont systemFontOfSize:16]);

    XCTAssertEqualObjects(label.attributedText.string, @"Hello, world!");

    NSParagraphStyle *defaultParagraphStyle = [[NSParagraphStyle alloc] init];

    NSDictionary *controlAttributes = @{
        BONValueFromRange(0, 13) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
            NSFontAttributeName : [UIFont systemFontOfSize:16],
        },
    };

    BONAssertAttributedStringHasAttributes(label.attributedText, controlAttributes);
}

- (void)testLabelAttributedTextAfterChainable
{
    UILabel *label = UILabel.new;
    label.bonChainable = BONChain.new.font([UIFont systemFontOfSize:16]);
    label.attributedText = [[NSAttributedString alloc] initWithString:@"Hello, world!"];

    XCTAssertEqualObjects(label.attributedText.string, @"Hello, world!");

    NSDictionary *controlAttributes = [self defaultAttributesForClass:[UILabel class] withString:@"Hello, world!"];

    BONAssertAttributedStringHasAttributes(label.attributedText, controlAttributes);
}

- (void)testLabelAttributedTextBeforeChainable
{
    UILabel *label = UILabel.new;
    label.attributedText = [[NSAttributedString alloc] initWithString:@"Hello, world!"];
    label.bonChainable = BONChain.new.font([UIFont systemFontOfSize:16]);

    XCTAssertNotNil(label.bonChainable);
    XCTAssertEqualObjects(label.attributedText.string, @"Hello, world!");

    NSParagraphStyle *defaultParagraphStyle = [[NSParagraphStyle alloc] init];

    NSDictionary *controlAttributes = @{
        BONValueFromRange(0, 13) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
            NSFontAttributeName : [UIFont systemFontOfSize:16],
        },
    };

    BONAssertAttributedStringHasAttributes(label.attributedText, controlAttributes);
}

#pragma mark - UITextView

- (void)testTextViewTextAfterChainable
{
    UITextView *textView = UITextView.new;
    textView.bonChainable = BONChain.new.font([UIFont systemFontOfSize:16]);
    textView.textAndApplyChainable = @"Hello, world!";

    XCTAssertEqualObjects(textView.attributedText.string, @"Hello, world!");

    NSParagraphStyle *defaultParagraphStyle = [[NSParagraphStyle alloc] init];

    NSDictionary *controlAttributes = @{
        BONValueFromRange(0, 13) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
            NSFontAttributeName : [UIFont systemFontOfSize:16],
        },
    };

    BONAssertAttributedStringHasAttributes(textView.attributedText, controlAttributes);
}

- (void)testTextViewTextBeforeChainable
{
    UITextView *textView = UITextView.new;
    textView.textAndApplyChainable = @"Hello, world!";
    textView.bonChainable = BONChain.new.font([UIFont systemFontOfSize:16]);

    XCTAssertEqualObjects(textView.attributedText.string, @"Hello, world!");

    NSParagraphStyle *defaultParagraphStyle = [[NSParagraphStyle alloc] init];

    NSDictionary *controlAttributes = @{
        BONValueFromRange(0, 13) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
            NSFontAttributeName : [UIFont systemFontOfSize:16],
        },
    };

    BONAssertAttributedStringHasAttributes(textView.attributedText, controlAttributes);
}

- (void)testTextViewAttributedTextAfterChainable
{
    UITextView *textView = UITextView.new;
    textView.bonChainable = BONChain.new.font([UIFont systemFontOfSize:16]);
    textView.attributedText = [[NSAttributedString alloc] initWithString:@"Hello, world!"];

    XCTAssertEqualObjects(textView.attributedText.string, @"Hello, world!");

    NSDictionary *controlAttributes = [self defaultAttributesForClass:[UITextView class] withString:@"Hello, world!"];

    BONAssertAttributedStringHasAttributes(textView.attributedText, controlAttributes);
}

- (void)testTextViewAttributedTextBeforeChainable
{
    UITextView *textView = UITextView.new;
    textView.attributedText = [[NSAttributedString alloc] initWithString:@"Hello, world!"];
    textView.bonChainable = BONChain.new.font([UIFont systemFontOfSize:16]);

    XCTAssertEqualObjects(textView.attributedText.string, @"Hello, world!");

    NSParagraphStyle *defaultParagraphStyle = [[NSParagraphStyle alloc] init];

    NSDictionary *controlAttributes = @{
        BONValueFromRange(0, 13) : @{
            NSParagraphStyleAttributeName : defaultParagraphStyle,
            NSFontAttributeName : [UIFont systemFontOfSize:16],
        },
    };

    BONAssertAttributedStringHasAttributes(textView.attributedText, controlAttributes);
}

#pragma mark - UITextField

- (void)testTextFieldTextAfterChainable
{
    UITextField *textField = UITextField.new;
    textField.bonChainable = BONChain.new.font([UIFont systemFontOfSize:16]);
    textField.textAndApplyChainable = @"Hello, world!";

    XCTAssertEqualObjects(textField.attributedText.string, @"Hello, world!");

    NSMutableDictionary *controlAttributes = [self defaultAttributesForClass:[UITextField class] withString:@"Hello, world!"];
    [controlAttributes[BONValueFromRange(0, 13)] addEntriesFromDictionary:@{
        NSFontAttributeName : [UIFont systemFontOfSize:16],
    }];

    BONAssertAttributedStringHasAttributes(textField.attributedText, controlAttributes);
}

- (void)testTextFieldTextBeforeChainable
{
    UITextField *textField = UITextField.new;
    textField.textAndApplyChainable = @"Hello, world!";
    textField.bonChainable = BONChain.new.font([UIFont systemFontOfSize:16]);

    XCTAssertEqualObjects(textField.attributedText.string, @"Hello, world!");

    NSMutableDictionary *controlAttributes = [self defaultAttributesForClass:[UITextField class] withString:@"Hello, world!"];
    [controlAttributes[BONValueFromRange(0, 13)] addEntriesFromDictionary:@{
        NSFontAttributeName : [UIFont systemFontOfSize:16],
    }];

    BONAssertAttributedStringHasAttributes(textField.attributedText, controlAttributes);
}

- (void)testTextFieldAttributedTextAfterChainable
{
    UITextField *textField = UITextField.new;
    textField.bonChainable = BONChain.new.font([UIFont systemFontOfSize:16]);
    textField.attributedText = [[NSAttributedString alloc] initWithString:@"Hello, world!"];

    XCTAssertEqualObjects(textField.attributedText.string, @"Hello, world!");

    NSDictionary *controlAttributes = [self defaultAttributesForClass:[UITextField class] withString:@"Hello, world!"];

    BONAssertAttributedStringHasAttributes(textField.attributedText, controlAttributes);
}

- (void)testTextFieldAttributedTextBeforeChainable
{
    UITextField *textField = UITextField.new;
    textField.attributedText = [[NSAttributedString alloc] initWithString:@"Hello, world!"];
    textField.bonChainable = BONChain.new.font([UIFont systemFontOfSize:16]);

    XCTAssertNotNil(textField.bonChainable);
    XCTAssertEqualObjects(textField.attributedText.string, @"Hello, world!");

    NSMutableDictionary *controlAttributes = [self defaultAttributesForClass:[UITextField class] withString:@"Hello, world!"];
    [controlAttributes[BONValueFromRange(0, 13)] addEntriesFromDictionary:@{
        NSFontAttributeName : [UIFont systemFontOfSize:16],
    }];

    BONAssertAttributedStringHasAttributes(textField.attributedText, controlAttributes);
}

#pragma mark - Helpers

- (NSMutableDictionary *)defaultAttributesForClass:(Class)viewClass withString:(NSString *)string
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];

    id view = [[viewClass alloc] init];
    if ([view respondsToSelector:@selector(setAttributedText:)] &&
        [view respondsToSelector:@selector(attributedText)]) {
        [view setAttributedText:[[NSAttributedString alloc] initWithString:string]];
        [[view attributedText] enumerateAttributesInRange:NSMakeRange(0, string.length) options:0 usingBlock:^(NSDictionary<NSString *, id> *_Nonnull attrs, NSRange range, BOOL *_Nonnull stop) {
            attributes[[NSValue valueWithRange:range]] = [attrs mutableCopy];
        }];
    }

    return attributes;
}

@end
