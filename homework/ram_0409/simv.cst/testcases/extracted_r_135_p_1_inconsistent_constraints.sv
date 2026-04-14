class c_135_1;
    int i = 134;
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

program p_135_1;
    c_135_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10xx0x1zz1x1x0x00x1z0zx00zx1110zxzzxzzzxzzzxxzxxzxxxzzxxxzzxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
