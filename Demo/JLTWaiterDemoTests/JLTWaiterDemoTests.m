//
//  JLTWaiterDemoTests.m
//  JLTWaiterDemoTests
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

#import <XCTest/XCTest.h>
#import "JLTWaiter.h"
#import "JLTViewController.h"

@interface JLTWaiterDemoTests : XCTestCase
@property (nonatomic) UIViewController *origViewController;
@property (nonatomic) JLTViewController *viewController;
@end

@implementation JLTWaiterDemoTests

- (void)setUp
{
    self.origViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    self.viewController = [self.origViewController.storyboard instantiateInitialViewController];

    [UIApplication sharedApplication].delegate.window.rootViewController = self.viewController;
}

- (void)tearDown
{
    [UIApplication sharedApplication].delegate.window.rootViewController = self.origViewController;
}

- (void)testWaiterExists
{
    XCTAssertNotNil([JLTWaiter waiter]);
}

- (void)testWaiterSuccess
{
    JLTWaiter *waiter = [JLTWaiter waiter];
    [self.viewController swapHeightAndWidthWithDuration:2.0 completion:^{
        waiter.finished = YES;
    }];

    [waiter waitWithTimeOut:2.5];

    XCTAssertTrue(waiter.finished);
}

- (void)testWaiterFailure
{
    JLTWaiter *waiter = [JLTWaiter waiter];
    [self.viewController swapHeightAndWidthWithDuration:2.0 completion:^{
        waiter.finished = YES;
    }];

    [waiter waitWithTimeOut:1.5];

    XCTAssertFalse(waiter.finished);
}

- (void)testGoogleHomepage
{
    JLTWaiter *waiter = [JLTWaiter waiter];
    [self.viewController fetchGoogleWithCompletion:^(NSString *HTML, NSError *error) {
        waiter.finished = YES;
        XCTAssertNotNil(HTML);
        XCTAssertNil(error);
    }];
    [waiter waitWithTimeOut:5.0];

    XCTAssertTrue(waiter.finished);
}

@end
