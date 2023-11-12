# Create a Project

In this directory, we can see a `src` folder with a single file called `main.pyx`. The file doesn't have to be called `main`, but note the extension `.pyx` as this is the exntension for **Cython** files.

We define a single function but use just 100% Python syntax:

```cython
def helloworld():
    print("Hello, world!")
```

We now want to expose this a package so that it can be called from another Python program, we do this with the `setup.py`. If you look inside the `setup.py` file, we specify our Cython files to be loaded as `ext_modules`, and Cython takes care of compiling it into C/C++ code.

We can build the package by running:

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
creating build/lib.linux-x86_64-cpython-312
gcc -shared build/temp.linux-x86_64-cpython-312/src/main.o -L/usr/local/lib -o build/lib.linux-x86_64-cpython-312/example.cpython-312-x86_64-linux-gnu.so
```

What happens in the above command is:

1. There will be a new file `main.c` created next to `main.pyx` _(Note, this should **not** be git tracked)_
2. The `main.c` file will be compiled into an `.so` file in the `build` directory next to the `src` directory. It is this file that will be imported into another Python program

To make the package available to other Python programs, we can install it with:

```bash
python3 -m pip install .
```

We can now run `main.py` and we see:

```bash
python3 main.py
# Hello, world!
```
