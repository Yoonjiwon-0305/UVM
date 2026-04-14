class c_162_1;
    int i = 161;
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

program p_162_1;
    c_162_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00zz0xx01z1zx1zx1zz1z0xx1zz0000zxzzxzxzxxzzxxxzzxxzxxxzzxzxzxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
