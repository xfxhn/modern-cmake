#include "noms/fruit/apple.h"

#include <utility>

namespace noms {

    Apple::Apple(std::string colour) {
        this->colour = std::move(colour);
    }

    std::string Apple::getColour() {
        return colour;
    }

}
