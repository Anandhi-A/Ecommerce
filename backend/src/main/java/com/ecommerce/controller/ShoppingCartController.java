package com.ecommerce.controller;

import com.ecommerce.model.ShoppingCart;
import com.ecommerce.service.ShoppingCartService;
import com.ecommerce.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/cart")
public class ShoppingCartController {

    @Autowired
    private ShoppingCartService shoppingCartService;

    @Autowired
    private UserService userService;

    @GetMapping
    public ResponseEntity<ShoppingCart> getCart(@AuthenticationPrincipal UserDetails userDetails) {
        Long userId = userService.findByUsername(userDetails.getUsername()).getId();
        ShoppingCart cart = shoppingCartService.getCartByUserId(userId);
        if (cart == null) {
            cart = shoppingCartService.createCart(userService.findByUsername(userDetails.getUsername()));
        }
        return ResponseEntity.ok(cart);
    }

    @PostMapping("/add")
    public ResponseEntity<ShoppingCart> addItemToCart(@AuthenticationPrincipal UserDetails userDetails, @RequestParam Long productId, @RequestParam int quantity) {
        Long userId = userService.findByUsername(userDetails.getUsername()).getId();
        ShoppingCart cart = shoppingCartService.addItemToCart(userId, productId, quantity);
        return ResponseEntity.ok(cart);
    }

    @DeleteMapping("/remove")
    public ResponseEntity<ShoppingCart> removeItemFromCart(@AuthenticationPrincipal UserDetails userDetails, @RequestParam Long productId) {
        Long userId = userService.findByUsername(userDetails.getUsername()).getId();
        ShoppingCart cart = shoppingCartService.removeItemFromCart(userId, productId);
        return ResponseEntity.ok(cart);
    }
}
