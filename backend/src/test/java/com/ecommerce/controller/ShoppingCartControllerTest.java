package com.ecommerce.controller;

import com.ecommerce.model.ShoppingCart;
import com.ecommerce.model.User;
import com.ecommerce.security.jwt.JwtTokenProvider;
import com.ecommerce.service.ShoppingCartService;
import com.ecommerce.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(ShoppingCartController.class)
public class ShoppingCartControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private ShoppingCartService shoppingCartService;

    @MockBean
    private UserService userService;

    @MockBean
    private JwtTokenProvider jwtTokenProvider;

    @MockBean
    private UserDetailsService userDetailsService;

    @Test
    @WithMockUser
    public void testGetCart() throws Exception {
        User user = new User();
        user.setId(1L);
        when(userService.findByUsername(anyString())).thenReturn(user);
        when(shoppingCartService.getCartByUserId(anyLong())).thenReturn(new ShoppingCart());

        mockMvc.perform(get("/api/cart"))
                .andExpect(status().isOk());
    }
}
