create table customer(
                         customer_id varchar(5) primary key ,
                         customer_full_name varchar(100) not null ,
                         customer_email varchar(100) not null unique,
                         customer_phone varchar(15) not null,
                         customer_address varchar(255) not null
);
create table room(
                     room_id varchar(5) primary key ,
                     room_type varchar(50) not null,
                     room_price decimal(10,2) not null,
                     room_status varchar(20) not null,
                     room_area int not null
);
create table booking(
                        booking_id serial primary key ,
                        customer_id varchar(5) references customer(customer_id) not null,
                        room_id varchar(5) references room(room_id) not null,
                        check_in_date date not null,
                        check_out_date date not null,
                        total_amount decimal(10,2)
);
create table  payment(
                         payment_id serial primary key ,
                         booking_id int references booking(booking_id) not null ,
                         payment_method varchar(50) not null,
                         payment_date date not null,
                         payment_amount decimal(10,2) not null
);

insert into customer values
                         ('C001','Nguyen Anh Tu','tu.nguyen@example.com','0912345678','Hanoi,Vietnam'),
                         ('C002','Tran Thi Mai','mai.tran@example.com','0923456789','Ho Chi Minh,Vietnam'),
                         ('C003','Le Minh Hoang','hoang.le@example.com','0934567890','Danang,Vietnam'),
                         ('C004','Pham Hoang Nam','nam.pham@example.com','0945678901','Hue,Vietnam'),
                         ('C005','Vu Minh Thu','thu.vu@example.com','0956789012','Hai Phong,Vietnam');
insert into room values
                     ('R001','Single',100.0,'Available',25),
                     ('R002','Double',150.0,'Booked',40),
                     ('R003','Suite',250.0,'Available',60),
                     ('R004','Single',120.0,'Booked',30),
                     ('R005','Double',160.,'Available', 35);
insert into booking(customer_id, room_id, check_in_date, check_out_date, total_amount) values
                                                                                           ('C001','R001','2025-03-01','2025-03-05',400.0),
                                                                                           ('C002','R002','2025-03-02','2025-03-06',600.0),
                                                                                           ('C003','R003','2025-03-03','2025-03-07',1000.0),
                                                                                           ('C004','R004','2025-03-04','2025-03-08',480.0),
                                                                                           ('C005','R005','2025-03-05','2025-03-09',800.0);
insert into payment(booking_id, payment_method, payment_date, payment_amount) values
                                                                                  (1,'Cash','2025-03-05',400.0),
                                                                                  (2,'Credit Card','2025-03-06',600.0),
                                                                                  (3,'BankTransfer','2025-03-07',1000.0),
                                                                                  (4,'Cash','2025-03-08',480.0),
                                                                                  (5,'Credit Card','2025-03-09',800.0);
--3. Cậpnhậtdữliệu(6điểm)
update booking set total_amount = total_amount*0.9;