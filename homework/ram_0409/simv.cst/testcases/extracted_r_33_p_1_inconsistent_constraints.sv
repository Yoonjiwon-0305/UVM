class c_33_1;
    int i = 32;
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

program p_33_1;
    c_33_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0z11xzz1x0110101100x1xx1x10zxz1xxzxzzzzzxzzzzxzzxzzzzxzzzxxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
