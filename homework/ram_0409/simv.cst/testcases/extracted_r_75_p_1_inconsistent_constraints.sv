class c_75_1;
    int i = 74;
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

program p_75_1;
    c_75_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1100zx1zz0z11111zz1z110x01z0z1z0xzxxxzzxxzzzzzzzxzxxxxzzxxxxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
