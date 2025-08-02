package com.ecommerce.service;

import com.ecommerce.model.CartItem;
import com.ecommerce.model.Product;
import com.ecommerce.model.ShoppingCart;
import com.ecommerce.model.User;
import com.ecommerce.repository.ProductRepository;
import com.ecommerce.repository.ShoppingCartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class ShoppingCartService {

    @Autowired
    private ShoppingCartRepository shoppingCartRepository;

    @Autowired
    private ProductRepository productRepository;

    public ShoppingCart getCartByUserId(Long userId) {
        return shoppingCartRepository.findByUserId(userId);
    }

    public ShoppingCart createCart(User user) {
        ShoppingCart cart = new ShoppingCart();
        cart.setUser(user);
        cart.setItems(new ArrayList<>());
        return shoppingCartRepository.save(cart);
    }

    public ShoppingCart addItemToCart(Long userId, Long productId, int quantity) {
        ShoppingCart cart = getCartByUserId(userId);
        Product product = productRepository.findById(productId).orElse(null);

        if (cart != null && product != null) {
            for (CartItem item : cart.getItems()) {
                if (item.getProduct().getId().equals(productId)) {
                    item.setQuantity(item.getQuantity() + quantity);
                    updateCartPrice(cart);
                    return shoppingCartRepository.save(cart);
                }
            }

            CartItem newItem = new CartItem();
            newItem.setProduct(product);
            newItem.setQuantity(quantity);
            cart.getItems().add(newItem);
            updateCartPrice(cart);
            return shoppingCartRepository.save(cart);
        }
        return null;
    }

    public ShoppingCart removeItemFromCart(Long userId, Long productId) {
        ShoppingCart cart = getCartByUserId(userId);

        if (cart != null) {
            cart.getItems().removeIf(item -> item.getProduct().getId().equals(productId));
            updateCartPrice(cart);
            return shoppingCartRepository.save(cart);
        }
        return null;
    }

    private void updateCartPrice(ShoppingCart cart) {
        double totalPrice = 0;
        for (CartItem item : cart.getItems()) {
            totalPrice += item.getProduct().getPrice() * item.getQuantity();
        }
        cart.setTotalPrice(totalPrice);
    }
}
