-- JAIMART 100-product local-image catalog.
-- Additive and repeat-safe by (seller_id, name); does not delete products.
-- Review seller emails before running. Apply against the database your app uses.
BEGIN;
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Wireless Mouse', 'Ergonomic wireless mouse with USB receiver.', 699, 50, 'Electronics', '/images/products/wireless-mouse.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Wireless Mouse'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Mechanical Keyboard', 'Mechanical keyboard for work and gaming.', 2499, 30, 'Electronics', '/images/products/mechanical-keyboard.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Mechanical Keyboard'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'USB-C Hub', 'Multiport USB-C hub for laptops.', 1299, 40, 'Electronics', '/images/products/usb-c-hub.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'USB-C Hub'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Cotton T-Shirt', 'Soft breathable cotton crew-neck T-shirt.', 499, 100, 'Apparel', '/images/products/cotton-t-shirt.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Cotton T-Shirt'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Denim Jacket', 'Classic everyday denim jacket.', 1899, 25, 'Apparel', '/images/products/denim-jacket.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Denim Jacket'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Running Shoes', 'Lightweight shoes for daily running.', 2199, 35, 'Apparel', '/images/products/running-shoes.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Running Shoes'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Stainless Steel Bottle', 'Reusable insulated stainless steel bottle.', 599, 60, 'Home', '/images/products/stainless-steel-bottle.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Stainless Steel Bottle'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Desk Lamp', 'LED desk lamp for study and work.', 899, 45, 'Home', '/images/products/desk-lamp.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Desk Lamp'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Bluetooth Headphones', 'Wireless over-ear headphones.', 1799, 40, 'Electronics', '/images/products/bluetooth-headphones.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Bluetooth Headphones'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Bluetooth Speaker', 'Portable wireless speaker.', 1499, 35, 'Electronics', '/images/products/bluetooth-speaker.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Bluetooth Speaker'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'USB Flash Drive 64GB', 'Compact 64GB USB flash drive.', 499, 70, 'Electronics', '/images/products/usb-flash-drive-64gb.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'USB Flash Drive 64GB'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'External SSD 1TB', 'Portable 1TB solid-state drive.', 6999, 15, 'Electronics', '/images/products/external-ssd-1tb.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'External SSD 1TB'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Laptop Stand', 'Adjustable laptop stand for desk setups.', 999, 25, 'Electronics', '/images/products/laptop-stand.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Laptop Stand'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Webcam 1080p', 'Full HD webcam for calls and classes.', 1899, 20, 'Electronics', '/images/products/webcam-1080p.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Webcam 1080p'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Wireless Charger', 'Wireless charging pad for compatible phones.', 899, 30, 'Electronics', '/images/products/wireless-charger.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Wireless Charger'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Power Bank 20000mAh', 'High-capacity portable power bank.', 1799, 25, 'Electronics', '/images/products/power-bank-20000mah.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Power Bank 20000mAh'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Smart Watch', 'Smart watch with fitness tracking.', 2499, 20, 'Electronics', '/images/products/smart-watch.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Smart Watch'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Gaming Mouse Pad', 'Large smooth gaming mouse pad.', 399, 50, 'Electronics', '/images/products/gaming-mouse-pad.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Gaming Mouse Pad'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Laptop Backpack', 'Padded backpack for laptops and accessories.', 1299, 30, 'Accessories', '/images/products/laptop-backpack.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Laptop Backpack'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Phone Tripod', 'Compact adjustable tripod for smartphones.', 799, 25, 'Electronics', '/images/products/phone-tripod.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Phone Tripod'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Polo T-Shirt', 'Casual cotton polo T-shirt.', 699, 50, 'Apparel', '/images/products/polo-t-shirt.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Polo T-Shirt'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Hooded Sweatshirt', 'Soft fleece hoodie for everyday wear.', 1199, 30, 'Apparel', '/images/products/hooded-sweatshirt.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Hooded Sweatshirt'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Slim Fit Jeans', 'Everyday slim-fit denim jeans.', 1499, 35, 'Apparel', '/images/products/slim-fit-jeans.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Slim Fit Jeans'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Casual Shirt', 'Comfortable casual button-down shirt.', 999, 30, 'Apparel', '/images/products/casual-shirt.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Casual Shirt'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Sports Shorts', 'Lightweight shorts for training.', 599, 40, 'Apparel', '/images/products/sports-shorts.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Sports Shorts'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Cotton Socks Pack', 'Pack of comfortable cotton socks.', 249, 80, 'Apparel', '/images/products/cotton-socks-pack.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Cotton Socks Pack'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Baseball Cap', 'Adjustable everyday baseball cap.', 399, 45, 'Apparel', '/images/products/baseball-cap.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Baseball Cap'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Leather Belt', 'Classic belt for everyday outfits.', 599, 25, 'Apparel', '/images/products/leather-belt.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Leather Belt'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Canvas Sneakers', 'Casual canvas sneakers.', 1299, 25, 'Apparel', '/images/products/canvas-sneakers.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Canvas Sneakers'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Rain Jacket', 'Lightweight water-resistant rain jacket.', 1599, 20, 'Apparel', '/images/products/rain-jacket.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Rain Jacket'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Ceramic Coffee Mug', 'Ceramic mug for coffee and tea.', 249, 60, 'Home', '/images/products/ceramic-coffee-mug.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Ceramic Coffee Mug'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Nonstick Frying Pan', 'Nonstick frying pan for everyday cooking.', 899, 25, 'Home', '/images/products/nonstick-frying-pan.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Nonstick Frying Pan'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Dinner Plate Set', 'Set of durable dinner plates.', 799, 30, 'Home', '/images/products/dinner-plate-set.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Dinner Plate Set'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Cotton Bedsheet', 'Soft cotton bedsheet for a comfortable bed.', 1199, 25, 'Home', '/images/products/cotton-bedsheet.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Cotton Bedsheet'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Decorative Cushion', 'Decorative cushion for sofa or bed.', 399, 40, 'Home', '/images/products/decorative-cushion.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Decorative Cushion'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Wall Clock', 'Minimal wall clock for home or office.', 699, 25, 'Home', '/images/products/wall-clock.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Wall Clock'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Storage Organizer', 'Multi-purpose storage organizer.', 499, 35, 'Home', '/images/products/storage-organizer.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Storage Organizer'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Bath Towel Set', 'Absorbent towel set for daily use.', 649, 35, 'Home', '/images/products/bath-towel-set.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Bath Towel Set'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Electric Kettle', 'Electric kettle for hot water.', 1099, 25, 'Home', '/images/products/electric-kettle.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Electric Kettle'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Air Tight Container Set', 'Reusable airtight kitchen containers.', 549, 40, 'Home', '/images/products/air-tight-container-set.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Air Tight Container Set'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Face Cleanser', 'Gentle daily face cleanser.', 299, 50, 'Beauty', '/images/products/face-cleanser.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Face Cleanser'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Moisturizing Cream', 'Daily moisturizing cream.', 349, 45, 'Beauty', '/images/products/moisturizing-cream.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Moisturizing Cream'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Sunscreen SPF 50', 'Broad-spectrum daily sunscreen.', 499, 35, 'Beauty', '/images/products/sunscreen-spf-50.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Sunscreen SPF 50'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Shampoo', 'Everyday cleansing shampoo.', 299, 45, 'Beauty', '/images/products/shampoo.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Shampoo'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Conditioner', 'Conditioner for soft manageable hair.', 299, 40, 'Beauty', '/images/products/conditioner.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Conditioner'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Lip Balm', 'Moisturizing lip balm.', 149, 70, 'Beauty', '/images/products/lip-balm.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Lip Balm'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Perfume 50ml', 'Everyday fragrance in a 50ml bottle.', 899, 20, 'Beauty', '/images/products/perfume-50ml.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Perfume 50ml'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Hair Dryer', 'Compact hair dryer for home use.', 1299, 15, 'Beauty', '/images/products/hair-dryer.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Hair Dryer'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Makeup Brush Set', 'Brush set for makeup application.', 599, 25, 'Beauty', '/images/products/makeup-brush-set.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Makeup Brush Set'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Nail Care Kit', 'Basic nail grooming kit.', 349, 30, 'Beauty', '/images/products/nail-care-kit.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Nail Care Kit'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Yoga Mat', 'Non-slip yoga and exercise mat.', 799, 35, 'Sports', '/images/products/yoga-mat.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Yoga Mat'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Resistance Bands', 'Resistance band set for workouts.', 399, 40, 'Sports', '/images/products/resistance-bands.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Resistance Bands'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Dumbbell Pair 5kg', 'Pair of 5kg dumbbells for strength training.', 1499, 20, 'Sports', '/images/products/dumbbell-pair-5kg.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Dumbbell Pair 5kg'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Cricket Bat', 'Practice cricket bat.', 1299, 15, 'Sports', '/images/products/cricket-bat.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Cricket Bat'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Football', 'Durable football for training and play.', 699, 25, 'Sports', '/images/products/football.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Football'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Badminton Racket', 'Lightweight badminton racket.', 899, 20, 'Sports', '/images/products/badminton-racket.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Badminton Racket'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Skipping Rope', 'Adjustable skipping rope for cardio.', 249, 50, 'Sports', '/images/products/skipping-rope.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Skipping Rope'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Cycling Helmet', 'Protective helmet for cycling.', 1199, 15, 'Sports', '/images/products/cycling-helmet.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Cycling Helmet'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Gym Gloves', 'Grip gloves for weight training.', 399, 30, 'Sports', '/images/products/gym-gloves.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Gym Gloves'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Hiking Water Bottle', 'Reusable bottle for outdoor activities.', 499, 35, 'Sports', '/images/products/hiking-water-bottle.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Hiking Water Bottle'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Notebook Pack', 'Pack of ruled notebooks for school or office.', 199, 100, 'Stationery', '/images/products/notebook-pack.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Notebook Pack'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Gel Pen Set', 'Smooth-writing gel pen set.', 149, 100, 'Stationery', '/images/products/gel-pen-set.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Gel Pen Set'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Desk Organizer', 'Organizer for pens and desk supplies.', 349, 35, 'Stationery', '/images/products/desk-organizer.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Desk Organizer'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Backpack', 'Everyday backpack with multiple compartments.', 999, 30, 'Accessories', '/images/products/backpack.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Backpack'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'A4 Paper Ream', 'A4 paper for printing and writing.', 299, 60, 'Stationery', '/images/products/a4-paper-ream.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'A4 Paper Ream'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Scientific Calculator', 'Scientific calculator for study.', 799, 25, 'Stationery', '/images/products/scientific-calculator.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Scientific Calculator'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Sticky Notes Set', 'Colorful sticky notes for reminders.', 129, 70, 'Stationery', '/images/products/sticky-notes-set.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Sticky Notes Set'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Whiteboard', 'Small whiteboard for home or office.', 599, 20, 'Stationery', '/images/products/whiteboard.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Whiteboard'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Highlighter Pack', 'Pack of assorted highlighters.', 179, 50, 'Stationery', '/images/products/highlighter-pack.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Highlighter Pack'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Document Folder', 'Folder for organizing documents.', 99, 70, 'Stationery', '/images/products/document-folder.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Document Folder'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Phone Case', 'Protective case for compatible smartphones.', 299, 50, 'Accessories', '/images/products/phone-case.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Phone Case'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Tempered Glass', 'Screen protector for compatible smartphones.', 149, 70, 'Accessories', '/images/products/tempered-glass.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Tempered Glass'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Cable Organizer', 'Reusable cable organizer clips.', 199, 50, 'Accessories', '/images/products/cable-organizer.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Cable Organizer'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Travel Neck Pillow', 'Soft neck pillow for travel.', 499, 25, 'Accessories', '/images/products/travel-neck-pillow.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Travel Neck Pillow'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Wallet', 'Compact everyday wallet.', 599, 30, 'Accessories', '/images/products/wallet.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Wallet'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Sunglasses', 'Everyday sunglasses with UV protection.', 699, 25, 'Accessories', '/images/products/sunglasses.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Sunglasses'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Keychain', 'Simple everyday keychain.', 99, 80, 'Accessories', '/images/products/keychain.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Keychain'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Laptop Sleeve', 'Padded sleeve for laptop protection.', 699, 25, 'Accessories', '/images/products/laptop-sleeve.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Laptop Sleeve'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Reusable Tote Bag', 'Reusable shopping tote bag.', 199, 45, 'Accessories', '/images/products/reusable-tote-bag.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Reusable Tote Bag'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Travel Toiletry Bag', 'Compact bag for travel essentials.', 399, 25, 'Accessories', '/images/products/travel-toiletry-bag.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Travel Toiletry Bag'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'LED Bulb Pack', 'Energy-saving LED bulb pack.', 299, 45, 'Appliances', '/images/products/led-bulb-pack.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'LED Bulb Pack'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Extension Board', 'Multi-socket extension board.', 499, 30, 'Appliances', '/images/products/extension-board.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Extension Board'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Table Fan', 'Compact table fan for personal cooling.', 1499, 15, 'Appliances', '/images/products/table-fan.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Table Fan'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Hand Blender', 'Hand blender for kitchen preparation.', 999, 20, 'Appliances', '/images/products/hand-blender.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Hand Blender'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Toaster', 'Compact toaster for breakfast.', 1299, 15, 'Appliances', '/images/products/toaster.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Toaster'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Rice Cooker', 'Electric rice cooker for everyday meals.', 1899, 15, 'Appliances', '/images/products/rice-cooker.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Rice Cooker'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Vacuum Cleaner', 'Compact vacuum cleaner for home cleaning.', 2999, 10, 'Appliances', '/images/products/vacuum-cleaner.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Vacuum Cleaner'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Digital Weighing Scale', 'Digital scale for household weighing.', 699, 20, 'Appliances', '/images/products/digital-weighing-scale.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Digital Weighing Scale'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Iron Box', 'Electric iron for everyday clothing care.', 999, 20, 'Appliances', '/images/products/iron-box.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Iron Box'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Mini Air Purifier', 'Compact air purifier for small spaces.', 2499, 10, 'Appliances', '/images/products/mini-air-purifier.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Mini Air Purifier'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Puzzle Game', 'Jigsaw puzzle for family leisure.', 349, 30, 'Toys', '/images/products/puzzle-game.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Puzzle Game'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Building Blocks Set', 'Building blocks for creative play.', 599, 25, 'Toys', '/images/products/building-blocks-set.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Building Blocks Set'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Remote Control Car', 'Remote control toy car.', 999, 20, 'Toys', '/images/products/remote-control-car.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Remote Control Car'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Soft Teddy Bear', 'Soft plush teddy bear.', 499, 30, 'Toys', '/images/products/soft-teddy-bear.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Soft Teddy Bear'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Board Game', 'Board game for friends and family.', 699, 20, 'Toys', '/images/products/board-game.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Board Game'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Drawing Kit', 'Drawing kit with pencils and colors.', 399, 35, 'Toys', '/images/products/drawing-kit.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Drawing Kit'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Kids Water Bottle', 'Reusable water bottle for kids.', 299, 40, 'Kids', '/images/products/kids-water-bottle.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Kids Water Bottle'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Kids Lunch Box', 'Lunch box for school meals.', 349, 35, 'Kids', '/images/products/kids-lunch-box.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Kids Lunch Box'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Story Book', 'Illustrated story book for young readers.', 249, 40, 'Books', '/images/products/story-book.svg', TRUE
FROM users u
WHERE u.email = 'priya.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Story Book'
  );
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, 'Beginner Science Kit', 'Simple science activity kit for learning.', 799, 15, 'Toys', '/images/products/beginner-science-kit.svg', TRUE
FROM users u
WHERE u.email = 'arjun.seller@jaimart.in'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = 'Beginner Science Kit'
  );
COMMIT;
