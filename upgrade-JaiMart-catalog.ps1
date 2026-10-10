# JaiMart catalog + local image upgrade
# Run from the project root: powershell -ExecutionPolicy Bypass -File .\upgrade-JaiMart-catalog.ps1
$ErrorActionPreference = "Stop"

$root = (Get-Location).Path
$required = @(
  ".\src\main\webapp\js\products.js",
  ".\src\main\webapp\css\style.css",
  ".\db\schema.sql"
)
foreach ($file in $required) {
  if (-not (Test-Path $file)) { throw "Run this script from JaiMart project root. Missing: $file" }
}

$stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$backup = ".\backup-catalog-$stamp"
New-Item -ItemType Directory -Path $backup | Out-Null
Copy-Item ".\src\main\webapp\js\products.js" "$backup\products.js"
Copy-Item ".\src\main\webapp\css\style.css" "$backup\style.css"
if (Test-Path ".\db\seed.sql") { Copy-Item ".\db\seed.sql" "$backup\seed.sql" }
Write-Host "Backups saved to $backup" -ForegroundColor Green

$webRoot = ".\src\main\webapp"
$imageDir = Join-Path $webRoot "images\products"
New-Item -ItemType Directory -Force -Path $imageDir | Out-Null

# 100 catalog entries, including the eight existing demo products.
$catalog = @(
  @{n="Wireless Mouse";d="Ergonomic wireless mouse with USB receiver.";p=699; s=50;c="Electronics";e="🖱️"},
  @{n="Mechanical Keyboard";d="Mechanical keyboard for work and gaming.";p=2499;s=30;c="Electronics";e="⌨️"},
  @{n="USB-C Hub";d="Multiport USB-C hub for laptops.";p=1299;s=40;c="Electronics";e="🔌"},
  @{n="Cotton T-Shirt";d="Soft breathable cotton crew-neck T-shirt.";p=499;s=100;c="Apparel";e="👕"},
  @{n="Denim Jacket";d="Classic everyday denim jacket.";p=1899;s=25;c="Apparel";e="🧥"},
  @{n="Running Shoes";d="Lightweight shoes for daily running.";p=2199;s=35;c="Apparel";e="👟"},
  @{n="Stainless Steel Bottle";d="Reusable insulated stainless steel bottle.";p=599;s=60;c="Home";e="🧴"},
  @{n="Desk Lamp";d="LED desk lamp for study and work.";p=899;s=45;c="Home";e="💡"},

  @{n="Bluetooth Headphones";d="Wireless over-ear headphones.";p=1799;s=40;c="Electronics";e="🎧"},
  @{n="Bluetooth Speaker";d="Portable wireless speaker.";p=1499;s=35;c="Electronics";e="🔊"},
  @{n="USB Flash Drive 64GB";d="Compact 64GB USB flash drive.";p=499;s=70;c="Electronics";e="💾"},
  @{n="External SSD 1TB";d="Portable 1TB solid-state drive.";p=6999;s=15;c="Electronics";e="💽"},
  @{n="Laptop Stand";d="Adjustable laptop stand for desk setups.";p=999;s=25;c="Electronics";e="💻"},
  @{n="Webcam 1080p";d="Full HD webcam for calls and classes.";p=1899;s=20;c="Electronics";e="📷"},
  @{n="Wireless Charger";d="Wireless charging pad for compatible phones.";p=899;s=30;c="Electronics";e="🔋"},
  @{n="Power Bank 20000mAh";d="High-capacity portable power bank.";p=1799;s=25;c="Electronics";e="🔋"},
  @{n="Smart Watch";d="Smart watch with fitness tracking.";p=2499;s=20;c="Electronics";e="⌚"},
  @{n="Gaming Mouse Pad";d="Large smooth gaming mouse pad.";p=399;s=50;c="Electronics";e="🖱️"},
  @{n="Laptop Backpack";d="Padded backpack for laptops and accessories.";p=1299;s=30;c="Accessories";e="🎒"},
  @{n="Phone Tripod";d="Compact adjustable tripod for smartphones.";p=799;s=25;c="Electronics";e="📱"},

  @{n="Polo T-Shirt";d="Casual cotton polo T-shirt.";p=699;s=50;c="Apparel";e="👕"},
  @{n="Hooded Sweatshirt";d="Soft fleece hoodie for everyday wear.";p=1199;s=30;c="Apparel";e="🧥"},
  @{n="Slim Fit Jeans";d="Everyday slim-fit denim jeans.";p=1499;s=35;c="Apparel";e="👖"},
  @{n="Casual Shirt";d="Comfortable casual button-down shirt.";p=999;s=30;c="Apparel";e="👔"},
  @{n="Sports Shorts";d="Lightweight shorts for training.";p=599;s=40;c="Apparel";e="🩳"},
  @{n="Cotton Socks Pack";d="Pack of comfortable cotton socks.";p=249;s=80;c="Apparel";e="🧦"},
  @{n="Baseball Cap";d="Adjustable everyday baseball cap.";p=399;s=45;c="Apparel";e="🧢"},
  @{n="Leather Belt";d="Classic belt for everyday outfits.";p=599;s=25;c="Apparel";e="🧷"},
  @{n="Canvas Sneakers";d="Casual canvas sneakers.";p=1299;s=25;c="Apparel";e="👟"},
  @{n="Rain Jacket";d="Lightweight water-resistant rain jacket.";p=1599;s=20;c="Apparel";e="🧥"},

  @{n="Ceramic Coffee Mug";d="Ceramic mug for coffee and tea.";p=249;s=60;c="Home";e="☕"},
  @{n="Nonstick Frying Pan";d="Nonstick frying pan for everyday cooking.";p=899;s=25;c="Home";e="🍳"},
  @{n="Dinner Plate Set";d="Set of durable dinner plates.";p=799;s=30;c="Home";e="🍽️"},
  @{n="Cotton Bedsheet";d="Soft cotton bedsheet for a comfortable bed.";p=1199;s=25;c="Home";e="🛏️"},
  @{n="Decorative Cushion";d="Decorative cushion for sofa or bed.";p=399;s=40;c="Home";e="🛋️"},
  @{n="Wall Clock";d="Minimal wall clock for home or office.";p=699;s=25;c="Home";e="🕒"},
  @{n="Storage Organizer";d="Multi-purpose storage organizer.";p=499;s=35;c="Home";e="🗃️"},
  @{n="Bath Towel Set";d="Absorbent towel set for daily use.";p=649;s=35;c="Home";e="🧺"},
  @{n="Electric Kettle";d="Electric kettle for hot water.";p=1099;s=25;c="Home";e="🫖"},
  @{n="Air Tight Container Set";d="Reusable airtight kitchen containers.";p=549;s=40;c="Home";e="🥡"},

  @{n="Face Cleanser";d="Gentle daily face cleanser.";p=299;s=50;c="Beauty";e="🧴"},
  @{n="Moisturizing Cream";d="Daily moisturizing cream.";p=349;s=45;c="Beauty";e="🧴"},
  @{n="Sunscreen SPF 50";d="Broad-spectrum daily sunscreen.";p=499;s=35;c="Beauty";e="☀️"},
  @{n="Shampoo";d="Everyday cleansing shampoo.";p=299;s=45;c="Beauty";e="🧴"},
  @{n="Conditioner";d="Conditioner for soft manageable hair.";p=299;s=40;c="Beauty";e="🧴"},
  @{n="Lip Balm";d="Moisturizing lip balm.";p=149;s=70;c="Beauty";e="💄"},
  @{n="Perfume 50ml";d="Everyday fragrance in a 50ml bottle.";p=899;s=20;c="Beauty";e="🌸"},
  @{n="Hair Dryer";d="Compact hair dryer for home use.";p=1299;s=15;c="Beauty";e="💨"},
  @{n="Makeup Brush Set";d="Brush set for makeup application.";p=599;s=25;c="Beauty";e="🖌️"},
  @{n="Nail Care Kit";d="Basic nail grooming kit.";p=349;s=30;c="Beauty";e="💅"},

  @{n="Yoga Mat";d="Non-slip yoga and exercise mat.";p=799;s=35;c="Sports";e="🧘"},
  @{n="Resistance Bands";d="Resistance band set for workouts.";p=399;s=40;c="Sports";e="🏋️"},
  @{n="Dumbbell Pair 5kg";d="Pair of 5kg dumbbells for strength training.";p=1499;s=20;c="Sports";e="🏋️"},
  @{n="Cricket Bat";d="Practice cricket bat.";p=1299;s=15;c="Sports";e="🏏"},
  @{n="Football";d="Durable football for training and play.";p=699;s=25;c="Sports";e="⚽"},
  @{n="Badminton Racket";d="Lightweight badminton racket.";p=899;s=20;c="Sports";e="🏸"},
  @{n="Skipping Rope";d="Adjustable skipping rope for cardio.";p=249;s=50;c="Sports";e="➰"},
  @{n="Cycling Helmet";d="Protective helmet for cycling.";p=1199;s=15;c="Sports";e="🚴"},
  @{n="Gym Gloves";d="Grip gloves for weight training.";p=399;s=30;c="Sports";e="🥊"},
  @{n="Hiking Water Bottle";d="Reusable bottle for outdoor activities.";p=499;s=35;c="Sports";e="🥤"},

  @{n="Notebook Pack";d="Pack of ruled notebooks for school or office.";p=199;s=100;c="Stationery";e="📓"},
  @{n="Gel Pen Set";d="Smooth-writing gel pen set.";p=149;s=100;c="Stationery";e="🖊️"},
  @{n="Desk Organizer";d="Organizer for pens and desk supplies.";p=349;s=35;c="Stationery";e="🗂️"},
  @{n="Backpack";d="Everyday backpack with multiple compartments.";p=999;s=30;c="Accessories";e="🎒"},
  @{n="A4 Paper Ream";d="A4 paper for printing and writing.";p=299;s=60;c="Stationery";e="📄"},
  @{n="Scientific Calculator";d="Scientific calculator for study.";p=799;s=25;c="Stationery";e="🧮"},
  @{n="Sticky Notes Set";d="Colorful sticky notes for reminders.";p=129;s=70;c="Stationery";e="🗒️"},
  @{n="Whiteboard";d="Small whiteboard for home or office.";p=599;s=20;c="Stationery";e="🧾"},
  @{n="Highlighter Pack";d="Pack of assorted highlighters.";p=179;s=50;c="Stationery";e="🖍️"},
  @{n="Document Folder";d="Folder for organizing documents.";p=99;s=70;c="Stationery";e="📁"},

  @{n="Phone Case";d="Protective case for compatible smartphones.";p=299;s=50;c="Accessories";e="📱"},
  @{n="Tempered Glass";d="Screen protector for compatible smartphones.";p=149;s=70;c="Accessories";e="📱"},
  @{n="Cable Organizer";d="Reusable cable organizer clips.";p=199;s=50;c="Accessories";e="🔗"},
  @{n="Travel Neck Pillow";d="Soft neck pillow for travel.";p=499;s=25;c="Accessories";e="✈️"},
  @{n="Wallet";d="Compact everyday wallet.";p=599;s=30;c="Accessories";e="👛"},
  @{n="Sunglasses";d="Everyday sunglasses with UV protection.";p=699;s=25;c="Accessories";e="🕶️"},
  @{n="Keychain";d="Simple everyday keychain.";p=99;s=80;c="Accessories";e="🔑"},
  @{n="Laptop Sleeve";d="Padded sleeve for laptop protection.";p=699;s=25;c="Accessories";e="💻"},
  @{n="Reusable Tote Bag";d="Reusable shopping tote bag.";p=199;s=45;c="Accessories";e="🛍️"},
  @{n="Travel Toiletry Bag";d="Compact bag for travel essentials.";p=399;s=25;c="Accessories";e="🧳"},

  @{n="LED Bulb Pack";d="Energy-saving LED bulb pack.";p=299;s=45;c="Appliances";e="💡"},
  @{n="Extension Board";d="Multi-socket extension board.";p=499;s=30;c="Appliances";e="🔌"},
  @{n="Table Fan";d="Compact table fan for personal cooling.";p=1499;s=15;c="Appliances";e="🌀"},
  @{n="Hand Blender";d="Hand blender for kitchen preparation.";p=999;s=20;c="Appliances";e="🥣"},
  @{n="Toaster";d="Compact toaster for breakfast.";p=1299;s=15;c="Appliances";e="🍞"},
  @{n="Rice Cooker";d="Electric rice cooker for everyday meals.";p=1899;s=15;c="Appliances";e="🍚"},
  @{n="Vacuum Cleaner";d="Compact vacuum cleaner for home cleaning.";p=2999;s=10;c="Appliances";e="🧹"},
  @{n="Digital Weighing Scale";d="Digital scale for household weighing.";p=699;s=20;c="Appliances";e="⚖️"},
  @{n="Iron Box";d="Electric iron for everyday clothing care.";p=999;s=20;c="Appliances";e="♨️"},
  @{n="Mini Air Purifier";d="Compact air purifier for small spaces.";p=2499;s=10;c="Appliances";e="🌬️"},

  @{n="Puzzle Game";d="Jigsaw puzzle for family leisure.";p=349;s=30;c="Toys";e="🧩"},
  @{n="Building Blocks Set";d="Building blocks for creative play.";p=599;s=25;c="Toys";e="🧱"},
  @{n="Remote Control Car";d="Remote control toy car.";p=999;s=20;c="Toys";e="🚗"},
  @{n="Soft Teddy Bear";d="Soft plush teddy bear.";p=499;s=30;c="Toys";e="🧸"},
  @{n="Board Game";d="Board game for friends and family.";p=699;s=20;c="Toys";e="🎲"},
  @{n="Drawing Kit";d="Drawing kit with pencils and colors.";p=399;s=35;c="Toys";e="🎨"},
  @{n="Kids Water Bottle";d="Reusable water bottle for kids.";p=299;s=40;c="Kids";e="🥤"},
  @{n="Kids Lunch Box";d="Lunch box for school meals.";p=349;s=35;c="Kids";e="🍱"},
  @{n="Story Book";d="Illustrated story book for young readers.";p=249;s=40;c="Books";e="📚"},
  @{n="Beginner Science Kit";d="Simple science activity kit for learning.";p=799;s=15;c="Toys";e="🔬"}
)

if ($catalog.Count -ne 100) { throw "Expected exactly 100 catalog products, found $($catalog.Count)." }

function ConvertTo-Slug([string]$value) {
  $slug = $value.ToLowerInvariant() -replace '[^a-z0-9]+','-'
  return $slug.Trim('-')
}
function Escape-Sql([string]$value) { return $value.Replace("'","''") }
function Escape-Xml([string]$value) {
  return [System.Security.SecurityElement]::Escape($value)
}

# Create one self-contained local SVG illustration per product.
foreach ($item in $catalog) {
  $slug = ConvertTo-Slug $item.n
  $title = Escape-Xml $item.n
  $category = Escape-Xml $item.c
  $emoji = $item.e
  $svg = @"
<svg xmlns="http://www.w3.org/2000/svg" width="640" height="480" viewBox="0 0 640 480" role="img" aria-label="$title">
  <defs>
    <linearGradient id="bg" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0%" stop-color="#edf7f0"/>
      <stop offset="100%" stop-color="#d5e8dc"/>
    </linearGradient>
    <linearGradient id="tile" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0%" stop-color="#ffffff"/>
      <stop offset="100%" stop-color="#f4f7f4"/>
    </linearGradient>
  </defs>
  <rect width="640" height="480" rx="28" fill="url(#bg)"/>
  <circle cx="320" cy="190" r="128" fill="#ffffff" opacity=".55"/>
  <rect x="188" y="70" width="264" height="240" rx="30" fill="url(#tile)" stroke="#c7dbce" stroke-width="3"/>
  <text x="320" y="220" font-family="Segoe UI Emoji, Apple Color Emoji, sans-serif" font-size="112" text-anchor="middle">$emoji</text>
  <text x="320" y="370" font-family="Segoe UI, Arial, sans-serif" font-size="26" font-weight="700" fill="#173e2b" text-anchor="middle">$title</text>
  <text x="320" y="410" font-family="Segoe UI, Arial, sans-serif" font-size="17" fill="#53705d" text-anchor="middle">$category</text>
</svg>
"@
  Set-Content -Path (Join-Path $imageDir "$slug.svg") -Value $svg -Encoding UTF8
}

# Build an additive, repeat-safe SQL script. It resolves seller IDs by email,
# not by assuming the IDs are always 2 and 3. It does not delete or update existing records.
$sqlLines = @(
  "-- JaiMart 100-product local-image catalog."
  "-- Additive and repeat-safe by (seller_id, name); does not delete products."
  "-- Review seller emails before running. Apply against the database your app uses."
  "BEGIN;"
)
for ($i = 0; $i -lt $catalog.Count; $i++) {
  $item = $catalog[$i]
  $sellerEmail = if (($i % 2) -eq 0) { "priya.seller@JaiMart.com" } else { "arjun.seller@JaiMart.com" }
  $name = Escape-Sql $item.n
  $desc = Escape-Sql $item.d
  $category = Escape-Sql $item.c
  $slug = ConvertTo-Slug $item.n
  $image = "/images/products/$slug.svg"
  $sqlLines += @"
INSERT INTO products (seller_id, name, description, price, stock_qty, category, image_url, active)
SELECT u.id, '$name', '$desc', $($item.p), $($item.s), '$category', '$image', TRUE
FROM users u
WHERE u.email = '$sellerEmail'
  AND u.role = 'SELLER'
  AND NOT EXISTS (
    SELECT 1 FROM products p WHERE p.seller_id = u.id AND p.name = '$name'
  );
"@
}
$sqlLines += "COMMIT;"
Set-Content ".\db\catalog_100.sql" -Value ($sqlLines -join "`r`n") -Encoding UTF8

# Update existing demo products to local images without deleting or reinserting them.
$updateSql = @(
  "-- Run this once against the same database used by the application."
  "UPDATE products SET image_url='/images/products/wireless-mouse.svg' WHERE name='Wireless Mouse' AND image_url LIKE 'https://picsum.photos/%';"
  "UPDATE products SET image_url='/images/products/mechanical-keyboard.svg' WHERE name='Mechanical Keyboard' AND image_url LIKE 'https://picsum.photos/%';"
  "UPDATE products SET image_url='/images/products/usb-c-hub.svg' WHERE name='USB-C Hub' AND image_url LIKE 'https://picsum.photos/%';"
  "UPDATE products SET image_url='/images/products/cotton-t-shirt.svg' WHERE name='Cotton T-Shirt' AND image_url LIKE 'https://picsum.photos/%';"
  "UPDATE products SET image_url='/images/products/denim-jacket.svg' WHERE name='Denim Jacket' AND image_url LIKE 'https://picsum.photos/%';"
  "UPDATE products SET image_url='/images/products/running-shoes.svg' WHERE name='Running Shoes' AND image_url LIKE 'https://picsum.photos/%';"
  "UPDATE products SET image_url='/images/products/stainless-steel-bottle.svg' WHERE name='Stainless Steel Bottle' AND image_url LIKE 'https://picsum.photos/%';"
  "UPDATE products SET image_url='/images/products/desk-lamp.svg' WHERE name='Desk Lamp' AND image_url LIKE 'https://picsum.photos/%';"
)
Set-Content ".\db\fix_existing_product_images.sql" -Value ($updateSql -join "`r`n") -Encoding UTF8

# Improve product rendering while preserving the existing /products API and detail link.
$js = @'
function escapeHtml(value) {
    return String(value ?? "")
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}

function localFallbackImage(product) {
    const name = String(product?.name ?? "").toLowerCase();
    const known = {
        "wireless mouse": "wireless-mouse.svg",
        "mechanical keyboard": "mechanical-keyboard.svg",
        "usb-c hub": "usb-c-hub.svg",
        "cotton t-shirt": "cotton-t-shirt.svg",
        "denim jacket": "denim-jacket.svg",
        "running shoes": "running-shoes.svg",
        "stainless steel bottle": "stainless-steel-bottle.svg",
        "desk lamp": "desk-lamp.svg"
    };
    return "/images/products/" + (known[name] || "wireless-mouse.svg");
}

async function loadProducts() {
    const grid = document.getElementById("productGrid");
    const searchInput = document.getElementById("searchInput");
    const categorySelect = document.getElementById("categorySelect");
    if (!grid) return;

    const keyword = searchInput ? searchInput.value.trim() : "";
    const category = categorySelect ? categorySelect.value : "";
    const params = new URLSearchParams();
    if (keyword) params.set("q", keyword);
    if (category) params.set("category", category);

    grid.innerHTML = "<p>Loading products...</p>";
    try {
        const url = "/products" + (params.toString() ? "?" + params.toString() : "");
        const products = await api.get(url);
        if (!Array.isArray(products)) throw new Error("Invalid product response from server");
        if (products.length === 0) {
            grid.innerHTML = '<p class="catalog-empty">No products found. Try another search.</p>';
            return;
        }
        grid.innerHTML = products.map(renderCard).join("");
    } catch (err) {
        console.error("Failed to load products:", err);
        grid.innerHTML = '<p class="catalog-error">Could not load products: ' +
            escapeHtml(err.message) + "</p>";
    }
}

function renderCard(product) {
    const productName = escapeHtml(product.name);
    const category = escapeHtml(product.category || "General");
    const productId = encodeURIComponent(product.id);
    const stock = Number(product.stockQty || 0);
    const rawImage = String(product.imageUrl || "").trim();
    // Keep local paths and same-origin URLs. Legacy external URLs may still render,
    // but on failure use a local illustration instead.
    const imageUrl = rawImage || localFallbackImage(product);
    const price = formatMoney(product.price);

    return `
      <a class="product-card" href="product-detail.jsp?id=${productId}" aria-label="View ${productName}">
        <div class="product-image-wrap">
          <img src="${escapeHtml(imageUrl)}"
               alt="${productName}"
               loading="lazy"
               onerror="this.onerror=null;this.src='${localFallbackImage(product)}';">
          <span class="product-image-tag">${category}</span>
        </div>
        <div class="product-card-content">
          <span class="category">${category}</span>
          <strong class="product-name">${productName}</strong>
          <span class="price">${escapeHtml(price)}</span>
          <span class="product-stock ${stock > 0 ? "in-stock" : "out-of-stock"}">
            ${stock > 0 ? stock + " in stock" : "Out of stock"}
          </span>
        </div>
      </a>
    `;
}

const searchButton = document.getElementById("searchBtn");
if (searchButton) searchButton.addEventListener("click", loadProducts);

const searchInput = document.getElementById("searchInput");
if (searchInput) {
    searchInput.addEventListener("keydown", event => {
        if (event.key === "Enter") loadProducts();
    });
}

const categorySelect = document.getElementById("categorySelect");
if (categorySelect) categorySelect.addEventListener("change", loadProducts);

loadProducts();
'@
Set-Content ".\src\main\webapp\js\products.js" -Value $js -Encoding UTF8

$cssAddition = @'

/* JaiMart catalog refresh */
.product-grid {
    grid-template-columns: repeat(auto-fill, minmax(210px, 1fr));
    gap: 1.1rem;
    align-items: stretch;
}
.product-card {
    padding: 0;
    overflow: hidden;
    gap: 0;
    border-color: #e2e8e3;
    border-radius: 14px;
    box-shadow: 0 3px 12px rgba(18, 54, 33, .05);
    transition: transform .18s ease, box-shadow .18s ease, border-color .18s ease;
}
.product-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 12px 28px rgba(18, 54, 33, .12);
    border-color: #b7d0bf;
}
.product-image-wrap {
    position: relative;
    background: #edf5ef;
    overflow: hidden;
}
.product-card img {
    display: block;
    width: 100%;
    height: 220px;
    object-fit: contain;
    padding: .6rem;
    border-radius: 0;
    background: transparent;
    transition: transform .25s ease;
}
.product-card:hover img { transform: scale(1.035); }
.product-image-tag {
    position: absolute;
    left: .75rem;
    top: .75rem;
    max-width: calc(100% - 1.5rem);
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    background: rgba(255,255,255,.92);
    color: #24563a;
    border: 1px solid rgba(36,86,58,.12);
    border-radius: 999px;
    padding: .25rem .55rem;
    font-size: .72rem;
    font-weight: 650;
}
.product-card-content {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: .45rem;
    padding: .95rem;
}
.product-card .category {
    color: #54705d;
    font-size: .76rem;
    text-transform: uppercase;
    letter-spacing: .055em;
    font-weight: 700;
}
.product-card .product-name {
    color: #202a23;
    font-size: .98rem;
    line-height: 1.35;
    min-height: 2.6em;
}
.product-card .price {
    color: #174b2d;
    font-size: 1.12rem;
    margin-top: .15rem;
}
.product-stock {
    font-size: .78rem;
    font-weight: 600;
    margin-top: .15rem;
}
.product-stock.in-stock { color: #287344; }
.product-stock.out-of-stock { color: #a33b35; }
.catalog-empty, .catalog-error {
    grid-column: 1 / -1;
    padding: 1rem;
    border-radius: 10px;
    background: #fff;
    border: 1px solid var(--border);
}
@media (max-width: 560px) {
    .site-main { padding: 1rem; }
    .product-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); gap: .7rem; }
    .product-card img { height: 155px; padding: .35rem; }
    .product-card-content { padding: .7rem; }
    .product-card .product-name { font-size: .9rem; }
    .product-card .price { font-size: 1rem; }
}
'@
Add-Content ".\src\main\webapp\css\style.css" -Value $cssAddition -Encoding UTF8

Write-Host ""
Write-Host "Generated $($catalog.Count) local SVG product illustrations." -ForegroundColor Green
Write-Host "Created db\catalog_100.sql (additive 100-product catalog)." -ForegroundColor Green
Write-Host "Created db\fix_existing_product_images.sql (updates the eight legacy placeholder URLs)." -ForegroundColor Green
Write-Host "Updated products.js and appended catalog styling to style.css." -ForegroundColor Green
Write-Host ""
Write-Host "IMPORTANT: SQL files were created but NOT executed. Review seller emails and database target before applying them." -ForegroundColor Yellow
Write-Host "Next: run mvn clean package and inspect the build before applying SQL." -ForegroundColor Cyan
