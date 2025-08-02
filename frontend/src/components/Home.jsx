import React, { useEffect, useState } from 'react';
import { fetchProducts, addToCart } from '../api';
import { useNavigate } from 'react-router-dom';
import './Home.css';

const Home = () => {
    const [products, setProducts] = useState([]);
    const navigate = useNavigate();
    const token = localStorage.getItem('token');

    useEffect(() => {
        const getProducts = async () => {
            try {
                const { data } = await fetchProducts();
                setProducts(data);
            } catch (error) {
                console.error("Error fetching products:", error);
            }
        };
        getProducts();
    }, []);

    const handleAddToCart = async (productId) => {
        if (token) {
            try {
                await addToCart(productId, 1);
                // Optionally, add some feedback to the user that the item was added.
            } catch (error) {
                console.error("Error adding to cart:", error);
            }
        } else {
            navigate('/login');
        }
    };

    return (
        <div className="home-container">
            <h1 className="home-title">Our Products</h1>
            <div className="product-grid">
                {products.map((product) => (
                    <div className="product-card" key={product.id}>
                        <img src={product.imageUrl} className="product-image" alt={product.name} />
                        <div className="product-info">
                            <h5 className="product-name">{product.name}</h5>
                            <p className="product-description">{product.description}</p>
                            <div className="product-footer">
                                <p className="product-price">₹{product.price.toLocaleString('en-IN')}</p>
                                <button className="add-to-cart-btn" onClick={() => handleAddToCart(product.id)}>Add to Cart</button>
                            </div>
                        </div>
                    </div>
                ))}
            </div>
        </div>
    );
};

export default Home;