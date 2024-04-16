def multiply(m, n):
    """
    >>> multiply(5, 3)
    15
    """
    if n == 1:
        return m
    else:
        return m + multiply(m, n - 1)

def hailstone(n):
    """Print out the hailstone sequence starting at n, and return the
    number of elements in the sequence.
    >>> a = hailstone(10)
    10
    5
    16
    8
    4
    2
    1
    >>> a
    7
    """
    if n != 1:
        print(int(n))
        if n % 2 == 0:
            return hailstone(n / 2) + 1
        else:
            return hailstone(3 * n + 1) + 1
    else:
        print(1)
        return 1


def merge(n1, n2):
    """ Merges two numbers
    >>> merge(31, 42)
    4321
    >>> merge(21, 0)
    21
    >>> merge (21, 31)
    3211
    """
    n1_remain, n1_last = n1 // 10, n1 % 10
    n2_remain, n2_last = n2 // 10, n2 % 10
    # n1 == 0 or n2 == 0 is both corner case and base case (I made it up)
    if n1 == 0:
        return n2
    elif n2 == 0:
        return n1
    elif n1_last <= n2_last:
        return merge(n1_remain, n2) * 10 + n1_last
    else:
        return merge(n1, n2_remain) * 10 + n2_last 


def make_func_repeater(f, x):
    """
    >>> incr_1 = make_func_repeater(lambda x: x + 1, 1)
    >>> incr_1(2) #same as f(f(x))
    3
    >>> incr_1(5)
    6
    """
    def repeat(h):
        if h > 1:
            return f(repeat(h - 1))
        else:
            return f(x)
    return repeat

def is_prime(n):
    """
    >>> is_prime(7)
    True
    >>> is_prime(10)
    False
    >>> is_prime(1)
    False
    """
    def prime_helper(k):
        if k == 1:
            return True
        elif k == 0 or n % k == 0:
            return False
        else:
            return prime_helper(k - 1)
    return prime_helper(n - 1)    


