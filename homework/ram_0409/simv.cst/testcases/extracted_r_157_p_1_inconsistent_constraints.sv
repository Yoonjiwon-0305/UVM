class c_157_1;
    int i = 156;
    rand bit[7:0] addr; // rand_mode = ON 

    constraint r_addr_this    // (constraint_mode = ON) (./tb/ram_seq_item.sv:14)
    {
       (addr inside {[8'h0:8'hf]});
    }
    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (./tb/ram_sequence.sv:102)
    {
       (addr == i);
    }
endclass

program p_157_1;
    c_157_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01x1x0zx0100zx0zz0z0xx0zxzxx0z01xxxzxxzzzzxxzzzzzzzxzxxxxxzzxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
