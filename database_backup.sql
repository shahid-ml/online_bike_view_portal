CREATE TABLE offers(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(20),
    bike_id INT
);
INSERT INTO bikes(id,bike_name,brand,price,image,category) VALUES
(5,'Bajaj Pulsar NS200','Bajaj',155000,'ns200.jpg','200cc'),
(6,'Honda Hornet 2.0','Honda',140000,'hornet200.jpg','200cc'),
(7,'Suzuki Gixxer SF','Suzuki',150000,'gixxer.jpg','150cc'),
(8,'KTM RC 390','KTM',320000,'rc390.jpg','390cc'),
(9,'Royal Enfield Hunter 350','Royal Enfield',170000,'hunter350.jpg','350cc'),
(10,'TVS Raider 125','TVS',95000,'raider125.jpg','125cc'),
(11,'Bajaj Dominar 400','Bajaj',230000,'dominar400.jpg','400cc'),
(12,'Yamaha MT 15','Yamaha',170000,'mt15.jpg','150cc'),
(13,'Honda CB350','Honda',215000,'cb350.jpg','350cc'),
(14,'Suzuki V-Strom SX','Suzuki',210000,'vstrom.jpg','250cc'),
(15,'Hero Xpulse 200','Hero',145000,'xpulse200.jpg','200cc'),
(16,'Kawasaki Ninja 300','Kawasaki',340000,'ninja300.jpg','300cc'),
(17,'BMW G310R','BMW',285000,'g310r.jpg','310cc'),
(18,'Royal Enfield Meteor 350','Royal Enfield',205000,'meteor350.jpg','350cc'),
(19,'TVS Ronin','TVS',160000,'ronin.jpg','225cc'),
(20,'Yamaha FZ S V3','Yamaha',125000,'fzs.jpg','150cc');