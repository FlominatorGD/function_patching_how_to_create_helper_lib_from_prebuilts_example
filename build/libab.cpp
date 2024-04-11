// libab.cpp
#include "include/libab.h"
#include <iostream>

void axxx() {
    std::cout << "Calling a_x_x_x from libab:" << std::endl;
}

void bxxx() {
    std::cout << "Calling b_x_x_x from libab:" << std::endl;
}

void asss(struct my_struct *ar){
    std::cout << "Calling a_s_s_s from libab: with value:" << std::endl;
    std::cout << "ID: " << ar->id << ", Name: " << ar->name << std::endl;
}

void bsss(struct my_struct *ar){
    std::cout << "Calling b_s_s_s from libab: with value:" << std::endl;
    std::cout << "ID: " << ar->id << ", Name: " << ar->name << std::endl;
}

