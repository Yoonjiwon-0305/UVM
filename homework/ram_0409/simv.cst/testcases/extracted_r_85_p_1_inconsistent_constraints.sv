class c_85_1;
    int i = 84;
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

program p_85_1;
    c_85_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0100xzzxzxzz0xx110z01z00z0zz0x0zxzzxzzxzxzxzzxxzxxzxzzzzxzxxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
