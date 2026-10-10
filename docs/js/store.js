// JaiMart Mock Store & Client Engine for GitHub Pages
(function() {
    const STORAGE_KEY_PRODUCTS = "jaimart_products";
    const STORAGE_KEY_CART = "jaimart_cart";
    const STORAGE_KEY_ORDERS = "jaimart_orders";
    const STORAGE_KEY_REVIEWS = "jaimart_reviews";
    const STORAGE_KEY_USER = "jaimart_user";

    // Initialize products from catalog-data if not present
    function initProducts() {
        const stored = localStorage.getItem(STORAGE_KEY_PRODUCTS);
        if (!stored) {
            const initial = window.JAIMART_INITIAL_PRODUCTS || [];
            localStorage.setItem(STORAGE_KEY_PRODUCTS, JSON.stringify(initial));
            return initial;
        }
        try {
            return JSON.parse(stored);
        } catch (e) {
            return window.JAIMART_INITIAL_PRODUCTS || [];
        }
    }

    // Default Seed Users
    const SEED_USERS = [
        { id: 1, name: "Site Admin", email: "admin@jaimart.in", role: "ADMIN" },
        { id: 2, name: "Priya Seller", email: "priya.seller@jaimart.in", role: "SELLER" },
        { id: 3, name: "Arjun Seller", email: "arjun.seller@jaimart.in", role: "SELLER" },
        { id: 4, name: "Rahul Buyer", email: "rahul.buyer@jaimart.in", role: "BUYER" },
        { id: 5, name: "Ananya Buyer", email: "ananya.buyer@jaimart.in", role: "BUYER" }
    ];

    function initUser() {
        const stored = localStorage.getItem(STORAGE_KEY_USER);
        if (stored) {
            try { return JSON.parse(stored); } catch (e) {}
        }
        // Default to Rahul Buyer for a rich demo experience
        const defaultUser = SEED_USERS[3];
        localStorage.setItem(STORAGE_KEY_USER, JSON.stringify(defaultUser));
        return defaultUser;
    }

    function initOrders() {
        const stored = localStorage.getItem(STORAGE_KEY_ORDERS);
        if (!stored) {
            const initialOrders = [
                {
                    id: 101,
                    userId: 4,
                    status: "DELIVERED",
                    totalAmount: 1198.0,
                    createdAt: "2026-10-01",
                    items: [
                        { productId: 1, productName: "Wireless Mouse", quantity: 1, unitPrice: 699.0 },
                        { productId: 4, productName: "Cotton T-Shirt", quantity: 1, unitPrice: 499.0 }
                    ]
                },
                {
                    id: 102,
                    userId: 4,
                    status: "SHIPPED",
                    totalAmount: 2499.0,
                    createdAt: "2026-10-05",
                    items: [
                        { productId: 2, productName: "Mechanical Keyboard", quantity: 1, unitPrice: 2499.0 }
                    ]
                }
            ];
            localStorage.setItem(STORAGE_KEY_ORDERS, JSON.stringify(initialOrders));
            return initialOrders;
        }
        try { return JSON.parse(stored); } catch(e) { return []; }
    }

    function initReviews() {
        const stored = localStorage.getItem(STORAGE_KEY_REVIEWS);
        if (!stored) {
            const initialReviews = [
                { productId: 1, userName: "Rahul Buyer", rating: 5, comment: "Super smooth scroll, battery lasts forever!" },
                { productId: 1, userName: "Ananya Buyer", rating: 4, comment: "Compact and very responsive." },
                { productId: 2, userName: "Rahul Buyer", rating: 5, comment: "Clicky tactile switches, amazing build quality." }
            ];
            localStorage.setItem(STORAGE_KEY_REVIEWS, JSON.stringify(initialReviews));
            return initialReviews;
        }
        try { return JSON.parse(stored); } catch(e) { return []; }
    }

    // Helper functions
    function escapeHtml(str) {
        if (str === null || str === undefined) return "";
        return String(str)
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#39;");
    }

    function formatMoney(value) {
        const num = Number(value);
        return "$" + (isNaN(num) ? "0.00" : num.toFixed(2));
    }

    // Storage access
    const Store = {
        escapeHtml,
        formatMoney,

        getProducts: function(keyword, category) {
            let products = initProducts();
            if (category) {
                products = products.filter(p => p.category.toLowerCase() === category.toLowerCase());
            }
            if (keyword) {
                const kw = keyword.toLowerCase().trim();
                products = products.filter(p => 
                    p.name.toLowerCase().includes(kw) || 
                    (p.description && p.description.toLowerCase().includes(kw))
                );
            }
            return products.filter(p => p.active !== false);
        },

        getAllProductsRaw: function() {
            return initProducts();
        },

        getProductById: function(id) {
            const numId = Number(id);
            const products = initProducts();
            return products.find(p => p.id === numId) || null;
        },

        saveProducts: function(products) {
            localStorage.setItem(STORAGE_KEY_PRODUCTS, JSON.stringify(products));
        },

        // Cart Operations
        getCart: function() {
            const stored = localStorage.getItem(STORAGE_KEY_CART);
            const items = stored ? JSON.parse(stored) : [];
            const total = items.reduce((sum, item) => sum + (item.unitPrice * item.quantity), 0);
            return { items, total };
        },

        addToCart: function(productId, quantity) {
            const product = this.getProductById(productId);
            if (!product) throw new Error("Product not found");
            const cart = this.getCart().items;
            const existing = cart.find(i => i.productId === Number(productId));
            if (existing) {
                existing.quantity += Number(quantity);
            } else {
                cart.push({
                    productId: product.id,
                    productName: product.name,
                    unitPrice: product.price,
                    quantity: Number(quantity),
                    imageUrl: product.imageUrl
                });
            }
            localStorage.setItem(STORAGE_KEY_CART, JSON.stringify(cart));
            this.updateCartBadge();
            return this.getCart();
        },

        updateCartItem: function(productId, quantity) {
            let cart = this.getCart().items;
            const item = cart.find(i => i.productId === Number(productId));
            if (item) {
                if (Number(quantity) <= 0) {
                    cart = cart.filter(i => i.productId !== Number(productId));
                } else {
                    item.quantity = Number(quantity);
                }
            }
            localStorage.setItem(STORAGE_KEY_CART, JSON.stringify(cart));
            this.updateCartBadge();
            return this.getCart();
        },

        removeFromCart: function(productId) {
            let cart = this.getCart().items;
            cart = cart.filter(i => i.productId !== Number(productId));
            localStorage.setItem(STORAGE_KEY_CART, JSON.stringify(cart));
            this.updateCartBadge();
            return this.getCart();
        },

        clearCart: function() {
            localStorage.removeItem(STORAGE_KEY_CART);
            this.updateCartBadge();
        },

        updateCartBadge: function() {
            const cart = this.getCart();
            const count = cart.items.reduce((s, i) => s + i.quantity, 0);
            const badge = document.getElementById("cartCountBadge");
            if (badge) {
                badge.textContent = count > 0 ? count : "";
                badge.style.display = count > 0 ? "inline-block" : "none";
            }
        },

        // Orders
        getOrders: function() {
            return initOrders();
        },

        checkout: function() {
            const cart = this.getCart();
            if (cart.items.length === 0) throw new Error("Your cart is empty");
            const orders = this.getOrders();
            const user = this.getCurrentUser();
            const newOrderId = Math.floor(1000 + Math.random() * 9000);
            const newOrder = {
                id: newOrderId,
                userId: user ? user.id : 4,
                status: "CONFIRMED",
                totalAmount: cart.total,
                createdAt: new Date().toISOString().split("T")[0],
                items: [...cart.items]
            };
            orders.unshift(newOrder);
            localStorage.setItem(STORAGE_KEY_ORDERS, JSON.stringify(orders));
            this.clearCart();
            return newOrder;
        },

        updateOrderStatus: function(orderId, nextStatus) {
            const orders = this.getOrders();
            const order = orders.find(o => o.id === Number(orderId));
            if (order) {
                order.status = nextStatus;
                localStorage.setItem(STORAGE_KEY_ORDERS, JSON.stringify(orders));
            }
            return order;
        },

        // Reviews
        getReviews: function(productId) {
            const reviews = initReviews().filter(r => r.productId === Number(productId));
            const avg = reviews.length > 0
                ? reviews.reduce((sum, r) => sum + r.rating, 0) / reviews.length
                : 0;
            return { reviews, averageRating: avg };
        },

        addReview: function(productId, rating, comment, orderId) {
            const reviews = initReviews();
            const user = this.getCurrentUser();
            const newReview = {
                productId: Number(productId),
                userName: user ? user.name : "Verified Buyer",
                rating: Number(rating),
                comment: comment || "",
                orderId: Number(orderId)
            };
            reviews.unshift(newReview);
            localStorage.setItem(STORAGE_KEY_REVIEWS, JSON.stringify(reviews));
            return newReview;
        },

        // Auth
        getCurrentUser: function() {
            return initUser();
        },

        setCurrentUser: function(user) {
            if (user) {
                localStorage.setItem(STORAGE_KEY_USER, JSON.stringify(user));
            } else {
                localStorage.removeItem(STORAGE_KEY_USER);
            }
            this.renderHeaderSession();
        },

        getSeedUsers: function() {
            return SEED_USERS;
        },

        renderHeaderSession: function() {
            const user = this.getCurrentUser();
            const box = document.getElementById("sessionBox");
            if (!box) return;
            if (user) {
                box.innerHTML = `
                    <span>Signed in as <strong>${escapeHtml(user.name)}</strong> (${escapeHtml(user.role)})</span>
                    <button id="logoutBtn" style="cursor:pointer;margin-left:8px;">Switch/Log out</button>
                `;
                const logout = document.getElementById("logoutBtn");
                if (logout) {
                    logout.onclick = () => {
                        window.location.href = "login.html";
                    };
                }
            } else {
                box.innerHTML = `
                    <a href="login.html">Log in</a>
                    <a href="register.html">Register</a>
                `;
            }
        },

        // Seller actions
        addListing: function(name, description, price, stock, category, imageUrl) {
            const products = initProducts();
            const newId = products.length + 1;
            const newP = {
                id: newId,
                sellerId: 2,
                name,
                description,
                price: Number(price),
                stockQty: Number(stock),
                category,
                imageUrl: imageUrl || "images/products/wireless-mouse.svg",
                active: true
            };
            products.unshift(newP);
            this.saveProducts(products);
            return newP;
        },

        // Admin actions
        deactivateListing: function(productId) {
            const products = initProducts();
            const p = products.find(x => x.id === Number(productId));
            if (p) {
                p.active = false;
                this.saveProducts(products);
                return true;
            }
            return false;
        },

        // Chatbot simulation
        getChatReply: function(text) {
            const msg = (text || "").toLowerCase();
            if (msg.includes("hello") || msg.includes("hi") || msg.includes("hey")) {
                return "Hello! Welcome to JAIMART. How can I help you today? You can ask about products, orders, shipping, or returns.";
            }
            if (msg.includes("order") || msg.includes("track")) {
                return "You can view your real-time order history and shipment status on the Orders page. Placed orders transition from Confirmed to Shipped and Delivered.";
            }
            if (msg.includes("return") || msg.includes("refund")) {
                return "JAIMART provides a 7-day easy return policy for all delivered products. Simply contact support with your Order ID to initiate a return.";
            }
            if (msg.includes("shipping") || msg.includes("delivery")) {
                return "Standard shipping takes 2-4 business days. Express delivery arrives within 24 hours in select metro areas!";
            }
            if (msg.includes("payment") || msg.includes("checkout")) {
                return "JAIMART supports secure mock checkout simulation, credit cards, debit cards, UPI, and Cash on Delivery.";
            }
            if (msg.includes("seller") || msg.includes("sell")) {
                return "Sellers can list products and manage inventory in the Seller Dashboard. Switch to Priya or Arjun Seller to try it out!";
            }
            if (msg.includes("who are you") || msg.includes("what is jaimart")) {
                return "I am the JAIMART AI Assistant. JAIMART is a multi-seller e-commerce marketplace built for Anna University R2025 Semester 3.";
            }
            return "Thanks for reaching out! You can browse our 100-item product catalog, manage your cart, or switch roles to test seller and admin features.";
        }
    };

    // Attach to window
    window.Store = Store;

    document.addEventListener("DOMContentLoaded", function() {
        Store.renderHeaderSession();
        Store.updateCartBadge();
    });
})();
