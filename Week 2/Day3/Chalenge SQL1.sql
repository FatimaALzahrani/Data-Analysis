## 1 - Join Queries - Building Joins
# 1.
SELECT 
    green_product.pdt_name,
    green_pdt_segment.pdt_segment
FROM 
    inductive-seat-389220.Day3_Week2.green_product
INNER JOIN 
    inductive-seat-389220.Day3_Week2.green_pdt_segment 
ON 
   green_product.products_id = green_pdt_segment.products_id

# 2.
SELECT 
    p.products_id,
    p.pdt_name,
    p.products_status,
    p.categories_id,
    p.promo_id,
    s.stock,
    s.stock_forecast
FROM 
    inductive-seat-389220.Day3_Week2.green_product p
JOIN 
    inductive-seat-389220.Day3_Week2.green_stock s
ON 
    p.products_id = s.pdt_id;

# 3.
SELECT 
    gp.products_id,
    gp.pdt_name,
    gpr.promo_name,
    gpr.promo_pourcent
FROM 
    inductive-seat-389220.Day3_Week2.green_product gp
LEFT JOIN 
    inductive-seat-389220.Day3_Week2.green_promo gpr
ON 
    gp.promo_id = gpr.promo_id;

# 4.
SELECT 
    gp.products_id,
    gp.pdt_name,
    gpr.promo_name,
    gpr.promo_pourcent
FROM 
    inductive-seat-389220.Day3_Week2.green_product gp
RIGHT JOIN 
    inductive-seat-389220.Day3_Week2.green_promo gpr
ON 
    gp.promo_id = gpr.promo_id;

# 5.
SELECT 
    p.products_id,
    p.pdt_name,
    p.products_status,
    p.categories_id,
    p.promo_id,
    pr.ps_cat,
    pr.pd_cat
FROM 
    inductive-seat-389220.Day3_Week2.green_product p
JOIN 
    inductive-seat-389220.Day3_Week2.green_price pr
ON 
    p.products_id = pr.products_id;

# 6.
SELECT 
    p.products_id,
    p.pdt_name,
    p.categories_id,
    cat.category_1,
    cat.category_2,
    cat.category_3
FROM 
    inductive-seat-389220.Day3_Week2.green_product p
JOIN 
    inductive-seat-389220.Day3_Week2.green_categories cat
ON 
    p.categories_id = cat.categories_id;

# 7. 
SELECT 
    gp.products_id,
    gp.pdt_name,
    COALESCE(SUM(sa.qty), 0) AS qty_sold
FROM 
    inductive-seat-389220.Day3_Week2.green_product gp
LEFT JOIN 
    inductive-seat-389220.Day3_Week2.green_sales sa
ON 
    gp.products_id = sa.pdt_id
GROUP BY 
    gp.products_id, gp.pdt_name;

# 8.
SELECT 
    gp.products_id,
    gp.pdt_name,
    COALESCE(SUM(sa.qty), 0) AS qty_sold
FROM 
    inductive-seat-389220.Day3_Week2.green_product gp
RIGHT JOIN 
    inductive-seat-389220.Day3_Week2.green_sales sa
ON 
    gp.products_id = sa.pdt_id
GROUP BY 
    gp.products_id, gp.pdt_name;