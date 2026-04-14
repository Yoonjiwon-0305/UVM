class c_211_1;
    int i = 210;
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

program p_211_1;
    c_211_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01xxxxxxx11zx10zx011z0z1x01x0z01xzxxzzxxxxzxxzxxzzxxxxxxzxxxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
