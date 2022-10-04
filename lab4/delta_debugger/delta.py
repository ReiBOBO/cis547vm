import math

from typing import Tuple

from delta_debugger import run_target

EMPTY_STRING = b"" #global var to store the final input

def delta_debug(target: str, input: bytes) -> bytes:
    global EMPTY_STRING #define global
    """
    Delta-Debugging algorithm

    TODO: Implement your algorithm for delta-debugging.

    Hint: It may be helpful to use an auxilary function that
    takes as input a target, input string, n and
    returns the next input and n to try.

    :param target: target program
    :param input: crashing input to be minimized
    :return: 1-minimal crashing input.
    """
    
    EMPTY_STRING = input #initialize the global final result
    helper(target,input,2) #call the helper function to find the one minimal
    return EMPTY_STRING

#helper function that runs the actual minimization algorithm
def helper(target, input:bytes, n:int ):
    global EMPTY_STRING #declare the global var
    length = len(input) #get the length of the input
    if(length<n): #base case for where the algorithm stops
        if(run_target(target,b"")!=0): #we do want to cover the empty string case before we return
            EMPTY_STRING=b""
        return 
    x:int = 0
    # The idea is to recurse by cases:
    # case 1. find delta fail then recurse on the delta with n=2
    # case 2. find dabla fail then recurse on the dabla with n=n-1
    # case 3. No fail found, then recurse on the input with n=n*2
    while(x<length):
        start:int = x
        x=x+int(length/n)
        delta=input[start:x]
        dabla=input[0:start]+input[x:length]
        passed=run_target(target,delta)
        if(passed!=0): #failed good
            if(len(EMPTY_STRING)>len(delta)):
                EMPTY_STRING=delta #meaning we find a shorter input causes a failure
            #case 1
            helper(target,delta,2)
            return #reduce the redundant runs, no need to run other branches
        else:        
            passed=run_target(target,dabla)
            if(passed!=0):
                if(len(EMPTY_STRING)>len(dabla)): 
                    EMPTY_STRING=dabla #meaning we find a shorter input causes a failure
                #case 2
                helper(target,dabla,n-1)
                return #reduce the redundant runs, no need to run other branches
    #case 3
    if(passed==0):
        helper(target,input,n*2)  
    
    
    