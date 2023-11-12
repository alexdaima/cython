# Cython

A guide for Python programmers to learn Cython quickly (It does expect that you are comfortable using the Python language, but expects that you are not familiar with C or C++). All the code in this guide can be ran using the Dockerfile in the root of this repository.

1. [Helloworld](./01%20-%20Helloworld/README.md)
2. [C or C++](./02%20-%20C%20or%20C++/README.md)
3. [Functions](./03%20-%20Functions/README.md)

## What is Cython?

Cython is a superset of Python, which means it looks and feels like Python, but has extra keywords that allow parts of it to be able to be compiled to highly efficient C and/or C++ code. Cython allows parts of your code to be annotated with C/C++ types, allowing for much faster execution but still maintaining interoperability with Python for it's flexibility and abundance of packages.

This means that we could in the same function, write some complex computational code that runs completely in C/C++ giving us large speed gains, and then easily and conveniently use the `requests` module to make a HTTP request. An example of this might be:

```cython
import requests

cdef do_something():
    cdef int i
    cdef int n = 1000000
    cdef int sum = 0
    for i in range(n):
        sum += i

    requests.post("test.com", json={"sum": sum})
```

## Why am I writing this?

I've been using Cython for a while now, and I've found it to be a very useful tool. However, I've also learned that most engineers don't even know it exists, or have got it confused with CPython. I also think that the documentation for Cython is not very comprehensive (maybe the stuff I write here could get in there someday) and it's hard to find good resources to learn it well. So I'm writing this guide to help people learn Cython quickly and easily.

## When and why should I use Cython?

Compiling to C and C++ primarily gives speed increases for computationally intensive programs, so if you're building something that is mostly IO bound then Cython isn't going to help much.
