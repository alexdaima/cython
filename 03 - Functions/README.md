# Functions

In Cython, we have three different ways to create functions

## `def`

These functions can be imported from the package to a Python program, but they can also call `cdef` functions.

## `cdef`

These functions cannot be imported from the package to a Python program, and are aggressivly optimized to C/C++, but can still use regular Python packages.

If you try to import these functions from a Python script, you will get an error like the following:

```bash
python3 main.py
Traceback (most recent call last):
  File "/srv/03 - Functions/main.py", line 1, in <module>
    from example import do_something
ImportError: cannot import name 'do_something' from 'example' (/usr/local/lib/python3.12/site-packages/example.cpython-312-x86_64-linux-gnu.so)
```

## `cpdef`

These functions are a combination of `def` and `cdef`, they can be imported from the package to a Python program, and are also optimized to C/C++, just not as aggressively and efficiently.
