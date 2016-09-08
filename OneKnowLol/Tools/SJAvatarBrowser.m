//
//  SJAvatarBrowser.m
//  OneKnowLol
//
//  Created by Ardee on 16/9/8.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import "SJAvatarBrowser.h"
static CGRect oldframe;
static UIImageView *_imageView;
static SJAvatarBrowser *sjABser;
static UIImageView *_sentImg;
@implementation SJAvatarBrowser


+ (void)showImage:(UIImageView *)avatarImageView{
    UIImage *image=avatarImageView.image;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    oldframe=[avatarImageView convertRect:avatarImageView.bounds toView:window];
    backgroundView.backgroundColor=[UIColor blackColor];
    backgroundView.alpha=0;
    _imageView=[[UIImageView alloc]initWithFrame:oldframe];
    _imageView.image=image;
    _imageView.tag=1;
    [backgroundView addSubview:_imageView];
    [window addSubview:backgroundView];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    [backgroundView addGestureRecognizer: tap];
    
     UILongPressGestureRecognizer*longTap = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(imglongTapClick:)];
    [backgroundView addGestureRecognizer:longTap];
    
    [UIView animateWithDuration:0.3 animations:^{
        _imageView.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width)/2, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
        backgroundView.alpha=1;
    } completion:^(BOOL finished) {
        
    }];
}
//再次点击图片会回到之前的状态
+ (void)hideImage:(UITapGestureRecognizer*)tap{
    UIView *backgroundView=tap.view;
    UIImageView *imageView=(UIImageView*)[tap.view viewWithTag:1];
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=oldframe;
        backgroundView.alpha=0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}
//长按图片会弹出保存图片的按钮
+ (void)imglongTapClick:(UILongPressGestureRecognizer*)gesture

{
    
    if(gesture.state==UIGestureRecognizerStateBegan)
        
    {
        
        UIActionSheet*actionSheet = [[UIActionSheet alloc]initWithTitle:@"保存图片"delegate:self cancelButtonTitle:@"取消"destructiveButtonTitle:nil otherButtonTitles:@"保存图片到手机",nil];
        
        actionSheet.actionSheetStyle=UIActionSheetStyleBlackOpaque;
        
        [actionSheet showInView:sjABser];
        
        UIImageView *img = (UIImageView *)[gesture view];
        
//        _imageView = img;
        
    }
    
}
//点击保存或取消图片触发相应的事件
+ (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:  (NSInteger)buttonIndex

{
    
    if(buttonIndex ==0) {
        UIImageWriteToSavedPhotosAlbum(_imageView.image,sjABser,@selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:),nil);
        NSString*message =@"去相册看看吧,应该保存上了.";
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提示"message:message delegate:self cancelButtonTitle:@"确定"otherButtonTitles:nil];
        
        [alert show];

    }
    
}
//保存图片成功与否都会触发这个代理方法,然而并没有触发,我也不知道为什么,大概是类方法无法调用它?
- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo

{
    
    NSString*message =@"呵呵";
    
    if(!error) {
        
        message =@"成功保存到相册";
        
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提示"message:message delegate:self cancelButtonTitle:@"确定"otherButtonTitles:nil];
        
        [alert show];
        
    }else
        
    {
        
        message = [error description];
        
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提    示"message:message delegate:self cancelButtonTitle:@"确定"otherButtonTitles:nil];
        
        [alert show];
        
    }
    
}
@end
