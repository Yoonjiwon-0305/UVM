class c_206_1;
    int i = 205;
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

program p_206_1;
    c_206_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzz1xzzx1x1xz00x1xz01zz0zxzxz01xzzzzxzzxzzzzxzxzzxzxxxxzzzxzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
