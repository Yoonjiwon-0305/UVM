class c_106_1;
    int i = 105;
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

program p_106_1;
    c_106_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01z1zz01xxzx11z0xzzz1x0zz0zx0x11zzzzzxzxzxxxzzzzxzxzzzxxxxzxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
