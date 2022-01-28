# CMake Template

## What

This is a reasonably modular, generally applicable, working template for CMake. 

Everything is overridable, but the template does make some default assumptions about your project. Those defaults are described in *config/CMakeLists.txt* under the *notes* section; specifically *~> notes on directories*:

```
 ~> notes on directories:
 we're setting up variables for an overridable 
 project tree which looks something like this:

 /{root directory}/
  src/main.{c/cpp}
  src/[{...}.{c/cpp/h/hpp}]
  src/include/[{...}.{c/cpp/h/hpp}]
  build/{project name}[.so]
  config/{CMakeLists.txt, MakeFile, CMakeFiles, ...}

```

## How

This template works by defining a bunch of variables up at the top of the CMakeLists.txt and then implementing them in a format and order which CMake understands. I think it's handy.

With that in mind, feel free to edit the config/CMakeLists.txt file as needed. The only fields generally necessary to edit are right up at the top in the `Representation` section. (If you have a large project with specific requirements or a project with subprojects which require different rules, you will need to edit the CMakeLists.txt file accordingly -- all I ask is that you send me your revisions :)

For ease of use, a `module.sh` script is provided which can build, make and run your project for you. It's usage is: `./module.sh [build] [run] [arguments to pass to the program]`.

Of course, you don't have to use that program. You can also just run `cmake <cmake file> && make` as usual.

