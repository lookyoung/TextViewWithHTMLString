//
//  TestViewController.m
//  TextView显示html富文本
//
//  Created by LIUYANG on 16/8/25.
//  Copyright © 2016年 LYG. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()<UITextViewDelegate>

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor yellowColor];
    
    // 创建从Bundle中来自HTML文件的URL
//    NSURL *html = [[NSBundle mainBundle] URLForResource: @"test" withExtension:@"html"];
    
    // 用HTML创建attributed String
//    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithURL:html options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    
    NSString * formatString = @"<span style=\"font-size:13px;color:#7E7C8A\">123455说到世纪大道</span><a href='http://www.baidu.com'>打开百度</a><br><br/><p>iOS <span style=\"font-size:18px; color:#E88834;\">Developer</span> Tips</p><strong>耐撕</strong><style>strong{font-family: 'Avenir-Roman';font-size: 14px;}</style>";
//    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithData:[formatString dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute : [NSNumber numberWithInteger:NSUTF8StringEncoding]} documentAttributes:nil error:nil];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithData:[formatString dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute : [NSNumber numberWithInteger:NSUTF8StringEncoding]} documentAttributes:nil error:nil];
    [attrStr addAttributes:@{ NSLinkAttributeName : @"http://www.hao123.com"} range:NSMakeRange(3, 4)];
    NSLog(@"attrStr = %@", attrStr);
    // 创建TextView，添加attributed str
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, 320, 50)];
    [textView setAttributedText:attrStr];
    textView.delegate = self;
    textView.editable = NO;
    
    // 显示出来
    [[self view] addSubview:textView];

    
//    NSString *htmlStr = [[NSBundle mainBundle] pathForResource:@"test.html" ofType:nil];
//    
//    NSAttributedString *attributStr = [[NSAttributedString alloc] initWithURL:[NSURL URLWithString:htmlStr] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType} documentAttributes:NULL error:nil];
//    
//    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 50, 200, 300)];
//    textView.attributedText = attributStr;
//    
//    [self.view addSubview:textView];
}

-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    NSLog(@"URL = %@", URL);
    [[UIApplication sharedApplication] openURL:URL];
    return YES;
}

@end
