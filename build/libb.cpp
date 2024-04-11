// libb.cpp
#include "include/libb.h"
#include <iostream>

void bxxx() {
    std::cout << "Calling b_x_x_x from libb:" << std::endl;
}

void bsss(struct my_struct *ar){
    std::cout << "Calling b_s_s_s from libb: with value:" << std::endl;
    std::cout << "ID: " << ar->id << ", Name: " << ar->name << std::endl;
}

