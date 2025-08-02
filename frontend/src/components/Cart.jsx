import React, { useEffect, useState } from 'react';
import { getCart, removeFromCart } from '../api';

const Cart = () => {
    const [cart, setCart] = useState(null);

    useEffect(() => {
        const fetchCart = async () => {
            const { data } = await getCart();
            setCart(data);
        };
        fetchCart();
    }, []);

    const handleRemoveFromCart = async (productId) => {
        const { data } = await removeFromCart(productId);
        setCart(data);
    };

    if (!cart) return <div>Loading...</div>;

    return (
        <div className="container">
            <h2>Shopping Cart</h2>
            <ul className="list-group">
                {cart.items.map((item) => (
                    <li className="list-group-item d-flex justify-content-between align-items-center" key={item.id}>
                        {item.product.name} - ₹{item.product.price} x {item.quantity}
                        <button className="btn btn-danger" onClick={() => handleRemoveFromCart(item.product.id)}>Remove</button>
                    </li>
                ))}
            </ul>
            <h3>Total: ₹{cart.totalPrice}</h3>
        </div>
    );
};

export default Cart;
