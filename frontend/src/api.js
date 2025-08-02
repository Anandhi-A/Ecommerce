import axios from 'axios';

const API = axios.create({ baseURL: 'http://localhost:8082/api' });

API.interceptors.request.use((req) => {
    if (localStorage.getItem('token')) {
        req.headers.Authorization = `Bearer ${localStorage.getItem('token')}`;
    }
    return req;
});


export const login = (formData) => API.post('/auth/login', formData);
export const signUp = (formData) => API.post('/auth/signup', formData);

export const fetchProducts = () => API.get('/products');

export const getCart = () => API.get('/cart');
export const addToCart = (productId, quantity) => API.post(`/cart/add?productId=${productId}&quantity=${quantity}`);
export const removeFromCart = (productId) => API.delete(`/cart/remove?productId=${productId}`);

