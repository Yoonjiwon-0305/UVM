class c_63_1;
    int i = 62;
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

program p_63_1;
    c_63_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx1z0xxxx1zz1x110z1z1x0111x0zz1zxzzxzzxxzzzxzxxxzxxxzzxzzxxzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
