// pe_patcher.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

using namespace std;

int main(int argc, char** argv)
{
    if (argc != 2) {
        std::cerr << "Usage: " << argv[0] << " <binary>" << std::endl;
        return 1;
    }

    std::unique_ptr<LIEF::Binary> binary = LIEF::Parser::parse(argv[1]);
    std::cout << *binary << std::endl;
    return 0;
}
