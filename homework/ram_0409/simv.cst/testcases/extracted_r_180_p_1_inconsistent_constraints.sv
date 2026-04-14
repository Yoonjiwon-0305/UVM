class c_180_1;
    int i = 179;
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

program p_180_1;
    c_180_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "000z10zzxxxz01xx0z0z1xx1x0110110zxzzxxzzzzzzzxxxxxzxxxzxxzzxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
