import AddIsProperties

@AddIsProperties
enum Fruit {
    case apple
    case orange
    case waterMelon
}

let fruit : Fruit = .apple


print(fruit.isApple)


