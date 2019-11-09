//: Playground - noun: a place where people can play

/// 六大设计原则
/// 单一职责
    /// UIView与CALayer
/// 开闭原则
    /// extension，代码一旦写完，允许扩展而不允许修改
    /// 关联对象
/// 里氏替换
    /// 父类可以被子类无缝替换，原有功能不受任何影响，如KVO的原理。
    /// KVO之后，我们实际上使用的是子类，但是无感知。
    /// 协议：接收一个遵循该协议的对象， 则任何该协议对象都可传入。
/// 接口隔离
    /// 如UITableView的dataSource和delegate的功能各自独立
/// 依赖倒置
    /// 具体实现依赖于抽象，而抽象不能依赖于具体实现。
    /// 如一些方法接收的参数为protocol类型，因iOS中没有抽象类的概念
/// 迪米特法则
    /// 高内聚低耦合
    /// 对象尽可能少地暴露内部属性和方法
/// 控制反转IOC
/// 依赖注入
    /// 如用户登录页自己接收用户信息，而非通过一个单例来管理用户信息。
    /// 面向协议的组件化方案



/// 常见设计模式

/// Target-Action：
    /// UIButton
/// Factory
    /// AdFactory，接收一个type，返回一个对应类型的对象。
    /// 优点在于调用方无需修改代码。
/// 单例：
    /// static let即可，static和lazy自带线程安全。OC中要使用dispatch_once
/// 观察者：Notification，KVO
    /// NSKVOObserving_MyClass
/// 代理：delegate
    /// 注意防止循环引用
/// 责任链：nextResponder，事件传递和事件响应链
    /// 链条的对象中一定要有一个同样类型的属性，如nextObject，以及一个处理函数，所以要能处理，能传递，能终止。
/// 装饰器：
    /// Python中的注解，
    /// ReSwift中有用
/// 建造者
    /// Builder，将对象的表示与构建分离，简单的分层即可。
    /// 如makeSomeView这样的接口抽离。
/// 桥接
    /// 抽象类，
    /// let baseA = BaseObjectA();
    /// let baseB = BaseObjectB();
    /// baseA.objB = baseB;
    /// 然后A和B都可使用实际的具体实现类。
    /// 即接口规定接收的是抽象类，而根据依赖倒置原则，直接传递具体实现类即桥接模式。
/// 策略
    /// 与桥接模式有点类似
/// 适配器
    /// adapter，对象的变形/适配等操作。如将一个对象event改为event2，或新类持有旧类也可以。
/// 命令
    /// 对行为进行参数化的一种模式。
    /// 如feed的收藏/点赞/评论等，降低代码耦合度
    /// Command抽象类和CommandService，提供execute/cancel等操作命令对象的方式。
/// 面向切面AOP
