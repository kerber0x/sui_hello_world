module hello_world::hello_world;

use std::string::String;

/// An object that contains an arbitrary string
public struct HelloWorldObject has key, store {
    id: UID,
    /// A string contained in the object
    text: std::string::String,
}

public fun hello_world(): String {
    b"Hello, World!".to_string()
}

public fun addition(a: u8, b: u8): u8 {
    a + b
}

public fun mint(ctx: &mut TxContext) {
    let object = HelloWorldObject {
        id: object::new(ctx),
        text: std::string::utf8(b"Hello World!"),
    };
    transfer::public_transfer(object, tx_context::sender(ctx));
}
