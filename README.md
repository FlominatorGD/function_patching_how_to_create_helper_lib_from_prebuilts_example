# Usage Guide on how to build libab-impl.so, libb-impl.so and app executable

### Prerequisites: ###
Before building and running this project, you must have the following tools installed on your system:

g++ compiler
make
patchelf

### Instuctions: ###
```bash
make clean
```
```bash
make
```
```bash
./build/bin/app
```
By default, app will call functions defined in libab-impl.so.

### How to Use the Patch Script: ###
The mod.sh script patches the app executable and the libab-impl.so library to change the function calls in libab-impl.so to be able to use libb-impl.so. To run this script, use the following command:

```bash
./mod.sh
```
After the patch, running the app (executable) again, will show that the function call relationship between libab-impl.so and libb-impl.so has been modified.
```bash
./build/bin/app
```
