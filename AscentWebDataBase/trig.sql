create trigger or_pro1_update
after insert on orderitem
for each row
begin
update product set realstock=realstock-new.quantity where id=new.productid;
end;

create trigger or_pro1_delete
after delete on orderitem
for each row
begin
update product set realstock=realstock+old.quantity where id=old.productid;
end;

create trigger or_pro1_update2
after update on orderitem
for each row
begin
update product set realstock=realstock+old.quantity-new.quantity where id=old.productid;
end;

create trigger ori_ors_delete
after delete on orderitem
for each row
begin
delete from orders where id=old.ordersid;
end;