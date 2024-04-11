// main.cpp
#include "include/libab.h"
#include <iostream>
#include <cstring>

int main() {
    // Calling example functions
    axxx();
    bxxx();

    // Create an instance of my_struct
    my_struct exampleStruct;
    exampleStruct.id = 1;
    // Use strcpy for safety in setting char arrays. Ensure the name fits in the array.
    strcpy(exampleStruct.name, "Example Name");

    // Now calling asss and bsss with the instance
    asss(&exampleStruct);
    bsss(&exampleStruct);

    return 0;
}
