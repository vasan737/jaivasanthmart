package com.kishore.JaiMart.listener;

import com.kishore.JaiMart.dao.CartDAO;
import com.kishore.JaiMart.dao.OrderDAO;
import com.kishore.JaiMart.dao.ProductDAO;
import com.kishore.JaiMart.dao.ReviewDAO;
import com.kishore.JaiMart.dao.UserDAO;
import com.kishore.JaiMart.dao.impl.JdbcCartDAO;
import com.kishore.JaiMart.dao.impl.JdbcOrderDAO;
import com.kishore.JaiMart.dao.impl.JdbcProductDAO;
import com.kishore.JaiMart.dao.impl.JdbcReviewDAO;
import com.kishore.JaiMart.dao.impl.JdbcUserDAO;
import com.kishore.JaiMart.chat.ChatProvider;
import com.kishore.JaiMart.chat.ChatService;
import com.kishore.JaiMart.chat.GeminiChatProvider;
import com.kishore.JaiMart.chat.MockChatProvider;
import com.kishore.JaiMart.service.CartService;
import com.kishore.JaiMart.service.OrderService;
import com.kishore.JaiMart.service.ProductService;
import com.kishore.JaiMart.service.ReviewService;
import com.kishore.JaiMart.service.UserService;

import javax.sql.DataSource;

/**
 * Small hand-rolled DI container: wires DAO implementations (Factory pattern,
 * Section 12) into services once at application startup and hands the same
 * instances to every servlet via the ServletContext. No framework needed at
 * this project's scale.
 */
public final class ServiceRegistry {

    public static final String ATTR = "JaiMart.services";

    private final UserService userService;
    private final ProductService productService;
    private final CartService cartService;
    private final OrderService orderService;
    private final ReviewService reviewService;
    private final ChatService chatService;

    public ServiceRegistry(DataSource dataSource) {
        this(dataSource, loadChatConfig());
    }

    public ServiceRegistry(DataSource dataSource, java.util.Properties chatConfig) {
        UserDAO userDAO = new JdbcUserDAO(dataSource);
        ProductDAO productDAO = new JdbcProductDAO(dataSource);
        CartDAO cartDAO = new JdbcCartDAO(dataSource);
        OrderDAO orderDAO = new JdbcOrderDAO(dataSource);
        ReviewDAO reviewDAO = new JdbcReviewDAO(dataSource);

        this.userService = new UserService(userDAO);
        this.productService = new ProductService(productDAO);
        this.cartService = new CartService(cartDAO, productDAO);
        this.orderService = new OrderService(dataSource, orderDAO, productDAO, cartDAO);
        this.reviewService = new ReviewService(reviewDAO, orderDAO);

        // Section 17, Rule 2: implementation selected via config flag
        // ai.chatbot.provider=gemini|mock.
        String providerFlag = chatConfig.getProperty("ai.chatbot.provider", "mock");
        ChatProvider provider = "gemini".equalsIgnoreCase(providerFlag)
                ? new GeminiChatProvider(chatConfig.getProperty("ai.chatbot.apiKey", ""))
                : new MockChatProvider();
        this.chatService = new ChatService(provider);
    }

    private static java.util.Properties loadChatConfig() {
        java.util.Properties props = new java.util.Properties();
        try (var in = ServiceRegistry.class.getClassLoader().getResourceAsStream("config.properties")) {
            if (in != null) {
                props.load(in);
            }
        } catch (java.io.IOException ignored) {
            // Defaults (mock provider) apply if config.properties is missing.
        }
        return props;
    }

    public UserService userService() {
        return userService;
    }

    public ProductService productService() {
        return productService;
    }

    public CartService cartService() {
        return cartService;
    }

    public OrderService orderService() {
        return orderService;
    }

    public ReviewService reviewService() {
        return reviewService;
    }

    public ChatService chatService() {
        return chatService;
    }
}
