//
//  JLTWaiter.m
//  JLTWaiter
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

#import "JLTWaiter.h"

@implementation JLTWaiter

- (void)waitWithTimeOut:(NSTimeInterval)timeOut
{
    [self waitWithTimeOut:timeOut atQuantumPeformBlock:NULL];
}

- (void)waitWithTimeOut:(NSTimeInterval)timeOut atQuantumPeformBlock:(void (^)())block
{
    NSDate *timeOutDate = [NSDate dateWithTimeIntervalSinceNow:timeOut];

    if (block) block();

    while (!self.finished && [timeOutDate timeIntervalSinceNow] > 0) {
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:self.waitQuantum];
        [[NSRunLoop currentRunLoop] runUntilDate:date];

        if (block) block();
    }
}

#pragma mark Memory Lifecycle

+ (instancetype)waiter
{
    return [[JLTWaiter alloc] init];
}

+ (instancetype)waiterWithWaitQuantum:(NSTimeInterval)waitQuantum
{
    return [[JLTWaiter alloc] initWithWaitQuantum:waitQuantum];
}

- (instancetype)initWithWaitQuantum:(NSTimeInterval)waitQuantum
{
    self = [super init];
    if (self) {
        _waitQuantum =  waitQuantum;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithWaitQuantum:0.1];
}

@end
