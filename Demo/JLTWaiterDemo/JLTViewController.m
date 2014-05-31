//
//  JLTViewController.m
//  JLTWaiterDemo
//
//  Created by Jeffery Thomas on 3/25/13.
//  Copyright (c) 2013 JLTSource. No rights reserved. Do with it what you will.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "JLTViewController.h"

@interface JLTViewController ()

@end

@implementation JLTViewController

- (IBAction)swapHeightAndWidth:(id)sender
{
    [self swapHeightAndWidthWithDuration:2.0 completion:NULL];
}

- (void)swapHeightAndWidthWithDuration:(NSTimeInterval)duration completion:(void (^)())completion
{
    CGRect frame = self.rectangleView.frame;

    frame.size.height = self.rectangleView.frame.size.width;
    frame.size.width = self.rectangleView.frame.size.height;

    [UIView animateWithDuration:duration animations:^{
        self.rectangleView.frame = frame;
    } completion:^(BOOL finished) {
        if (completion) completion();
    }];
}

- (IBAction)setTitleToFirstLineOfGoogle:(UIButton *)button
{
    [self fetchGoogleWithCompletion:^(NSString *HTML, NSError *error) {
        if ([HTML length] > 0) {
            NSArray *lines = [HTML componentsSeparatedByString:@"\n"];
            [button setTitle:lines[0] forState:UIControlStateNormal];
        } else {
            [button setTitle:@"error" forState:UIControlStateNormal];
        }
    }];
}

- (void)fetchGoogleWithCompletion:(void (^)(NSString *, NSError *))completion
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *URL = [NSURL URLWithString:@"https://google.com/"];
    [[session dataTaskWithURL:URL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if ([data length] > 0) {
            NSString *HTML = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            if (completion != nil) dispatch_async(dispatch_get_main_queue(), ^{ completion(HTML, nil); });
        } else {
            if (completion != nil) dispatch_async(dispatch_get_main_queue(), ^{ completion(nil, error); });
        }
    }] resume];
}

@end
