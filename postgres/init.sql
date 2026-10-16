CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    product VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE
);

INSERT INTO orders (customer_name, product, quantity, price, order_date)
VALUES
('Alice', 'Laptop', 1, 999.99, '2026-10-01'),
('Bob', 'Mouse', 2, 25.50, '2026-10-02'),
('Charlie', 'Keyboard', 1, 75.00, '2026-10-03'),
('David', 'Monitor', 2, 250.00, '2026-10-04'),
('Emma', 'Headphones', 1, 120.00, '2026-10-05'),
('Frank', 'Webcam', 1, 85.00, '2026-10-06'),
('Grace', 'Laptop', 1, 1100.00, '2026-10-07'),
('Henry', 'Mouse', 3, 20.00, '2026-10-08'),
('Isabella', 'Keyboard', 2, 65.00, '2026-10-09'),
('Jack', 'Monitor', 1, 300.00, '2026-10-10'),
('Kate', 'USB Hub', 2, 35.00, '2026-10-11'),
('Liam', 'Headphones', 1, 150.00, '2026-10-12'),
('Mia', 'Webcam', 2, 90.00, '2026-10-13'),
('Noah', 'Laptop', 1, 1250.00, '2026-10-14'),
('Olivia', 'Mouse', 1, 30.00, '2026-10-14');