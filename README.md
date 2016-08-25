# 注意：要使链接可有效点击，需要关闭textView的可编辑性，并且指定代理，执行代理方法
textView.delegate = self;
textView.editable = NO;

-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
NSLog(@"URL = %@", URL);
[[UIApplication sharedApplication] openURL:URL];
return YES;
}