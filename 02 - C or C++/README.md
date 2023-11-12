# C or C++

In the previous example (Helloworld), we compiled a Cython file to C, and called it from Python, but alot of the time we want to get access to some convenient data structures only available in C++, for example `vector` and `unordered_map`. (These will be explained in more detail in later posts)

So let's say we import them into our Cython file:

```cython
from libcpp.vector cimport vector  # Note the cimport


def do_something():
    cdef vector[int] vector_of_ints = vector[int]()
    vector_of_ints.push_back(1)
```

If we use the same `setup.py` as before, we will get an error:

```bash
python3 setup.py build_ext
Compiling src/main.pyx because it changed.
[1/1] Cythonizing src/main.pyx
running build_ext
building 'example' extension
creating build
creating build/temp.linux-x86_64-cpython-312
creating build/temp.linux-x86_64-cpython-312/src
gcc -fno-strict-overflow -Wsign-compare -DNDEBUG -g -O3 -Wall -fPIC -I/usr/local/include/python3.12 -c src/main.c -o build/temp.linux-x86_64-cpython-312/src/main.o
src/main.c:1200:10: fatal error: ios: No such file or directory
 1200 | #include "ios"
      |          ^~~~~
compilation terminated.
error: command '/usr/bin/gcc' failed with exit code 1
```

The error we have here is that we trying to import C++ header files (`std::ios`) into our C compile, which of course cannot be found. We therefore need to add an extra line to our `setup.py` to tell it to compile to C++:

```diff
 [
     Extension(
         name="example",
         sources=["src/main.pyx"],
+        language="c++"
     )
 ],
```

What we now have is that instead of Cython creating the `main.c` file, it now creates `main.cpp`, which is then used to build the `.so` in `build`.

We can even tell the extension to use a specific version like `C++20`:

```diff
 [
     Extension(
         name="example",
         sources=["src/main.pyx"],
+        language="c++",
+        extra_compile_args=["-std=c++20"]
     )
 ],
```
