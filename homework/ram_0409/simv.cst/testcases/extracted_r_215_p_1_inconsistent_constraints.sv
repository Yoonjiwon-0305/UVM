class c_215_1;
    int i = 214;
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

program p_215_1;
    c_215_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz01z0xz1z001zx0010x1z1z11zz00z1xxzzxzxzzxxzzxzzzzzxzzzzxxxxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
