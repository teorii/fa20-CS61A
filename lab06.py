this_file = __file__


def make_adder_inc(a):
    """
    >>> adder1 = make_adder_inc(5)
    >>> adder2 = make_adder_inc(6)
    >>> adder1(2)
    7
    >>> adder1(2) # 5 + 2 + 1
    8
    >>> adder1(10) # 5 + 10 + 2
    17
    >>> [adder1(x) for x in [1, 2, 3]]
    [9, 11, 13]
    >>> adder2(5)
    11
    """
    "*** YOUR CODE HERE ***"
    def adder(x):
        nonlocal a
        a += 1
        return a + x - 1
    return adder


def make_fib():
    """Returns a function that returns the next Fibonacci number
    every time it is called.
    >>> fib = make_fib()
    >>> fib()
    0
    >>> fib()
    1
    >>> fib()
    1
    >>> fib()
    2
    >>> fib()
    3
    """
    "*** YOUR CODE HERE ***"
    count = 0
    def fibcount():
        nonlocal count
        print(str(listfib(count)))
        count += 1
    def listfib(count):
        if count <= 0:
            return 0
        elif count == 1:
            return 1
        else:
            return listfib(count - 1) + listfib(count - 2)
    return fibcount


def insert_items(lst, entry, elem):
    """
    >>> test_lst = [1, 5, 8, 5, 2, 3]
    >>> new_lst = insert_items(test_lst, 5, 7)
    >>> new_lst
    [1, 5, 7, 8, 5, 7, 2, 3]
    >>> large_lst = [1, 4, 8]
    >>> large_lst2 = insert_items(large_lst, 4, 4)
    >>> large_lst2
    [1, 4, 4, 8]
    >>> large_lst3 = insert_items(large_lst2, 4, 6)
    >>> large_lst3
    [1, 4, 6, 4, 6, 8]
    >>> large_lst3 is large_lst
    True
    """
    item = 0
    for i in range(len(lst)):
        if lst[i+item] == entry:
            lst[i + item + 1 : i + item + 1] = [elem]
            item += 1
    return lst
    