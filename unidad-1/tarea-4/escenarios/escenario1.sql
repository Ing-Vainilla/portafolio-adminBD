START TRANSACTION;

INSERT INTO compras (id_compra, total) VALUES (1, 2000.00);

UPDATE producto 
SET stock = stock - 1
WHERE id_producto = 1;

INSERT INTO detalle_compra (id_compra, id_producto, cantidad, precio_unitario) 
VALUES (1, 1, 1, 2000.00);

INSERT INTO pagos (id_compra, monto, metodo) 
VALUES (1, 2000.00, 'Tarjeta de Crédito');

COMMIT;