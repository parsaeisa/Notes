# C++

Classes and packages are referred to each other with `::`. Like: `torch::nn::Linear`.

## Good libraries

- CUDA
- Optix
- glm: Has many vector operations, matrice operations, etc.

## Struct

I think it is something like class in other languages. 
```c++
struct <Classname> : <InheritedClass> {
  <ClassName>() {
    // This is constructor
  }

  <Method return type> <method name>(<arg type> <arg name>) {
  }

  <VariableType> <param1>, <param2>, <param3>;
};
```