//
//  JLTViewController.h
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

#import <UIKit/UIKit.h>

@interface JLTViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *rectangleView;

- (IBAction)swapHeightAndWidth:(id)sender;

- (void)swapHeightAndWidthWithDuration:(NSTimeInterval)duration
                            completion:(void (^)())completion;

- (IBAction)setTitleToFirstLineOfGoogle:(UIButton *)button;

- (void)fetchGoogleWithCompletion:(void (^)(NSString *HTML, NSError *error))completion;

@end
