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

/*!
 @brief Set to YES to mark waiter as successfully completed and stop waiting.

 When an instance of a waiter is created, this value is set to NO.
 -waitWithTimeOut: will continue waiting until the set to YES or until the
 timeout is reached.
 */
@property (atomic, getter=isFinished) BOOL finished;

/*!
 @brief The interval of time to wait before checking if finished.
 
 The default value when unspecified is 0.1 seconds. The finished
 test will check to see of either the waiter has been marked as finished or if
 the time out has been reached.
 */
@property (atomic) NSTimeInterval waitQuantum;

/*!
 @brief Halt the execution of the method, but continue executing the thread.

 The execution of the method will resume once the waiter has been
 marked as finished or the waiter has timed out.
 */
- (void)waitWithTimeOut:(NSTimeInterval)timeOut;

/*!
 @brief Halt the execution of the method, but continue executing the thread.

 The execution of the method will resume once the waiter has been
 marked as finished or the waiter has timed out.
 
 At the end of every wait quatum, perform the specified block.
 */
- (void)waitWithTimeOut:(NSTimeInterval)timeOut atQuantumPeformBlock:(void(^)())block;

+ (instancetype)waiter;
+ (instancetype)waiterWithWaitQuantum:(NSTimeInterval)waitQuantum;
- (instancetype)initWithWaitQuantum:(NSTimeInterval)waitQuantum;

@end
