class c_169_1;
    int i = 168;
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

program p_169_1;
    c_169_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01xzzz01z000x11x110x0z1xxx0zxxx1zxxxxzzxzzxzzxzzxxxxzxxzxzxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
