class c_87_1;
    int i = 86;
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

program p_87_1;
    c_87_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x100x01z1z0xz1xz1z1x111z10xx1011xxzxxxzxzzxxzxxxxxxzzxxzzxzzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
