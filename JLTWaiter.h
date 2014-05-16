//
//  JLTWaiter.h
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

#import <Foundation/Foundation.h>

@interface JLTWaiter : NSObject

@property (atomic, getter=isFinished) BOOL finished;
@property (atomic) NSTimeInterval waitQuantum;

- (void)waitWithTimeOut:(NSTimeInterval)timeOut;
- (void)waitWithTimeOut:(NSTimeInterval)timeOut atQuantumPeformBlock:(void(^)())block;

+ (JLTWaiter *)waiter;
+ (JLTWaiter *)waiterWithWaitQuantum:(NSTimeInterval)waitQuantum;
- (id)initWithWaitQuantum:(NSTimeInterval)waitQuantum;

@end
