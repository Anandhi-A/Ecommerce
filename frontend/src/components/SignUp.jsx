import React, { useState } from 'react';
import { signUp } from '../api';
import { useNavigate } from 'react-router-dom';

const SignUp = () => {
    const [formData, setFormData] = useState({ username: '', password: '', email: '' });
    const navigate = useNavigate();

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            await signUp(formData);
            navigate('/login');
        } catch (error) {
            console.error(error);
        }
    };

    return (
        <div className="container">
            <form onSubmit={handleSubmit}>
                <div className="form-group">
                    <label>Username</label>
                    <input type="text" name="username" className="form-control" onChange={handleChange} />
                </div>
                <div className="form-group">
                    <label>Email</label>
                    <input type="email" name="email" className="form-control" onChange={handleChange} />
                </div>
                <div className="form-group">
                    <label>Password</label>
                    <input type="password" name="password" className="form-control" onChange={handleChange} />
                </div>
                <button type="submit" className="btn btn-primary">Sign Up</button>
            </form>
        </div>
    );
};

export default SignUp;
